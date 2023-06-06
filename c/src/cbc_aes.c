
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


#include "cbc.h"


int main(int argc,char *argv[]){

    if (argc != 5) {
        printf("Mauvaise entrée !\n");
        printf("Usage : <mode> <path entree> <path sortie> <cle>\n");
        printf("mode : \"encode\", \"decode\" \n");
        return 0;
    }


    char input[100] = "";
    char output[100] = "";
    byte cle[65] = "";

    memcpy(input, argv[2], strlen(argv[2]));
    memcpy(output, argv[3], strlen(argv[3]));
    memcpy(cle, argv[4], strlen(argv[4]));


    if (!strcmp(argv[1], "encode")) {
        chiffrer_cbc(input, output, cle);
    }
    if (!strcmp(argv[1], "decode")) {
        dechiffrer_cbc(input, output, cle);
    }


    return 1;
}


