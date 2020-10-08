#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <string.h>

int main(void)
{
	int sock;
	struct sockaddr_in server;
	
	sock = socket(AF_INET, SOCK_STREAM, 0);
	if (sock == -1)
	{
		printf("Error: Cannot create socket");
	}
	puts("Socket was created");
	
	server.sin_family = AF_INET;
	server.sin_addr.s_addr = inet_addr("127.0.0.1");
	server.sin_port = htons(2020);
	
	if (connect(sock, (struct sockaddr *)&server, sizeof(server)) < 0)
	{
		perror("Error: Connection failed");
		return 1;
	}
	puts("Connected");
	
	char client_message[100];
	char server_message[200];
	while (1)
	{
		printf("Enter your name: ");
		scanf("%s", client_message);
		
		if (send(sock, client_message, 100, 0) < 0)
		{
			puts("Sending failed");
			return 1;
		}
		
		if (recv(sock, server_message, 200, 0) < 0)
		{
			puts("Receiving failed");
			break;
		}
		
		char message[250] = "[Server] : ";
		strncat(message, server_message, strlen(server_message));
		puts(message);
	}
	
	close(sock);
	return 0;	
}
