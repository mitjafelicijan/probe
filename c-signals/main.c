#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

void handle_signal(int signal) {
    printf("Signal received %d\n", signal);
}

// use “kill -10 pidof a.out“
// https://www.man7.org/linux/man-pages/man7/signal.7.html
int main(void) {
    signal(SIGUSR1, handle_signal);
    signal(SIGUSR2, handle_signal);

    printf("Waiting for signals...\n");
    for (;;)
        sleep(1);

    return 0;
}
