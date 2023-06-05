
#include <stdio.h>
#include <stddef.h>
#include "io.h"
#include <stdlib.h>

//#include "main.h"


extern char entree[100];
extern char sortie[100];
//char entree[100];
//char sortie[100];


void ecriture(byte *data, int taille) {
            FILE* out = NULL;
            out = fopen((sortie), "w");
            
            //byte test1[16] = {0xd4, 0x27, 0x11, 0xae, 0xe0, 0xbf, 0x98, 0xf1, 0xb8, 0xb4, 0x5d, 0xe5, 0x1e, 0x41, 0x52, 0x32};
            fwrite(data, sizeof(data), 1, out);
            fclose(out);
}




void afficher_state(byte *state) {
    printf("output :");
    for (int i = 0; i < 58816; i++)
    {
        
        printf("%2X ", state[i]);
        
    }
    printf("\n");
    
}


byte *lecture(int *taille) {
    byte *flux;
        //if (strcmp((entree), "") && strcmp((sortie), "")){
            FILE* out = NULL;
            out = fopen(("/home/etienne/Téléchargements/fips81.pdf"), "r+");
            fseek(out, 0, SEEK_END);
            int file_length = ftell(out);
            printf("%d\n", file_length);
            int length;
            int difference = 16-(file_length % 16);
            length = file_length+difference;

            flux= calloc(sizeof(byte)* length, 1);
            fseek(out, 0, SEEK_SET);
            fread(flux, 1, file_length, out);

            //fwrite(test1, sizeof(test1), 1, out);
            fclose(out);

    //}
    *taille = length;
    return flux;
}