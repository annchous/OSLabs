#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <string.h>

int main(int argc, char *argv[])
{
	int socket_descriptor;
	int client_socket;
	struct sockaddr_in server;
	struct sockaddr_in client;
	
	socket_descriptor = socket(AF_INET, SOCK_STREAM, 0);
	if (socket_descriptor == -1)
	{
		printf("Error: Cannot create socket");
	}
	puts("Socket was created");
	
	server.sin_family = AF_INET;
	server.sin_addr.s_addr = INADDR_ANY;
	server.sin_port = htons(2020);
	
	if (bind(socket_descriptor, (struct sockaddr *)&server, sizeof(server)) < 0)
	{
		perror("Error: Binding failed");
		return 1;
	}
	puts("Binding was finished successfully");
	
	listen(socket_descriptor, 3);
	
	int sas = sizeof(struct sockaddr_in);
	client_socket = accept(socket_descriptor, (struct sockaddr *)&client, (socklen_t*)&sas);
	if (client_socket < 0)
	{
		perror("Error: Accept failed");
		return 1;
	}
	puts("Connection was accepted successfully");
	
	int data_size;
	char client_message[100];
	while ((data_size = recv(client_socket, client_message, 100, 0)) > 0)
	{
		char reply[200] = "Hello, ";
		strncat(reply, client_message, strlen(client_message));
		write (client_socket, reply, strlen(reply));
	}
	
	if (data_size == 0)
	{
		puts("Client disconnected");
		fflush(stdout);
	}
	else if (data_size == -1)
	{
		perror("Receiving failed");
	}
	
	return 0;
}
