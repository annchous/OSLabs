#include "stdio.h"
#include "stdlib.h"
#include "unistd.h"

int main(void)
{
	printf("process id: %ld,	process group: %d\n", (long)getpid(), getpgid((long)getpid()));
	printf("user id: %d\n", getuid());
	exit(0);
}
