#include <stdio.h>

int sum(int a, int b);

int main() {
    for (int i = 0; i < 10; ++i) {
        printf("SUM of 5+%d is %d\n", i, sum(5, i));
    }

    return 0;
}
