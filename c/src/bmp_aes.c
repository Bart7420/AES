
#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <stdlib.h>

#include "conversion.h"
#include "io.h"
#include "ecb.h"
#include "cbc.h"
#include "bmp.h"

int main(int argc,char *argv[]){

    if (argc != 6) {
        printf("Mauvaise entrée !\n");
        printf("Usage : <mode> <version> <path entree> <path sortie> <cle>\n");
        printf("mode : \"encode\", \"decode\" \n");
        printf("version : \"ecb\", \"cbc\" \n");
        return 0;
    }

    char input[100] = "";
    char output[100] = "";
    byte cle[65] = "";

    memcpy(input, argv[3], strlen(argv[3]));
    memcpy(output, argv[4], strlen(argv[4]));
    strToWords(argv[5], cle, strlen(argv[5]));
    printf("%s\n", argv[1]);
    // il faudrait teset si offset est bien un nombre
    //int offset = atoi(argv[1]);
    int taille = strlen(argv[5]);
    int mode = 0;
    int version = 0;
    if (!strcmp(argv[1], "encode")) {
        mode = 1;
    } else if (!strcmp(argv[1], "decode")) {
        mode = 2;
    } else {
        printf("erreur mode non reconnu\n");
        return EXIT_FAILURE;
    }

    if (!strcmp(argv[2], "ecb")) {
        version = 1;
    } else if (!strcmp(argv[2], "cbc")) {
        version = 2;
    } else {
        printf("erreur version non reconnue\n");
        return EXIT_FAILURE;
    }
    



    bmp(mode, version, input, output, cle, taille);

    return 0;

}