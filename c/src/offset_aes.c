
#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <stdlib.h>

#include "io.h"
#include "ecb.h"
#include "cbc.h"

int main(int argc,char *argv[]){

    if (argc != 5) {
        printf("Mauvaise entrée !\n");
        printf("Usage :  <mode> <path entree> <path sortie> <cle>\n");
        printf("mode : \"ecb\", \"cbc\" \n");
        return 0;
    }

    char input[100] = "";
    char output[100] = "";
    byte cle[65] = "";

    memcpy(input, argv[2], strlen(argv[2]));
    memcpy(output, argv[3], strlen(argv[3]));
    memcpy(cle, argv[4], strlen(argv[4]));
    printf("%s\n", argv[1]);
    // il faudrait teset si offset est bien un nombre
    //int offset = atoi(argv[1]);
    int taille_fichier = 0;
    printf("%s\n", argv[1]);

    byte *entree = lecture(input, &taille_fichier, 0);
    int *offset3 = entree+10;
    int offset2 = *offset3;
    printf("nouvel offset : %d\n", offset2);

    entree = realloc(entree, taille_fichier+offset2);
    byte *entree2;
    entree2 = entree+offset2;
    ecriture("temp.offset", entree2, taille_fichier, 0);

    if (!strcmp(argv[1], "cbc")) {
        chiffrer_cbc("temp.offset", "temp.offset2", cle );
    } else if (!strcmp(argv[1], "ecb")) {
        chiffrer_ecb("temp.offset", "temp.offset2", cle );
    } else {
        printf("erreur dans le mode");
        return 1;
    }

    int bin = 0;
    byte* entreecodee = lecture("temp.offset2", &bin, 0);
    memcpy(entree2, entreecodee, taille_fichier);
    ecriture(output, entree, taille_fichier+offset2, 0);
    

    return 0;

}