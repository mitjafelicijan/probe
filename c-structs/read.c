#include <stdio.h>

#include "struct.h"

int main(void) {
    printf("Read struct\n");

    Character ch;

    FILE *file = fopen("character.dat", "rb");
    if (file == NULL) {
        perror("Error opening file");
        return 1;
    }

    fread(&ch, sizeof(Character), 1, file);
    fclose(file);

    printf("Name: %s\n", ch.name);
    printf("Health: %d\n", ch.health);
    printf("Damage: %.1f\n", ch.damage);

    return 0;
}
