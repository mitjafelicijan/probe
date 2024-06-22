#include <stdio.h>
#include <string.h>

#include "struct.h"

int main(void) {
    printf("Write struct\n");

    Character ch;

    strcpy(ch.name, "John Doe");
    ch.health = 30;
    ch.damage = 5.9;

    FILE* file = fopen("character.dat", "wb");
    if (file == NULL) {
        perror("Error opening file");
        return 1;
    }

    fwrite(&ch, sizeof(Character), 1, file);
    fclose(file);

    return 0;
}
