#include <stdio.h>

#include "test.h"

int main(void) {
    printf("Testing embedding of files into binary.\n");

    for (unsigned int i = 0; i < test_txt_len; i++) {
        printf("%02x ", test_txt[i]);
    }
    printf("\n\n");

    for (unsigned int i = 0; i < test_txt_len; i++) {
        printf("%c", test_txt[i]);
    }
    printf("\n\n");

    return 0;
}
