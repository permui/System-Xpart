#include "../include/syscall.h"
#include "stdio.h"
#include "../include/string.h"
#include "interactive.h"

void runcmd(char* cmd) {
	exec(cmd);
	fprintf(2, "child: exec %s failed, maybe the executable does not exists\n", cmd);
	exit(0);
}

int getcmd(char *buf, int nbuf) {
	fprintf(2, "$ ");
	memset(buf, 0, nbuf);
	interactive_readline(buf, nbuf);
	if(buf[0] == 0)
		return -1;
	return 0;
}

int main(void) {
	static char buf[100];
	int fd;
	
    while (1) {
        int r = getcmd(buf,sizeof(buf));
        if (r < 0) continue;

        if (strcmp(buf, "exit") == 0) break;

        int pid = fork();

        printf("My pid is %d, fork() returns %d\n", getpid(), pid);

        if (pid == 0) runcmd(buf); else
        if (pid > 0) wait(); else
        panic("panic fork");
	}

	exit(0);
}