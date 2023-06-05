
#include <stdio.h>
#include <stddef.h>
#include "io.h"
#include <stdlib.h>

//#include "main.h"


extern char entree[100];
extern char sortie[100];
//char entree[100];
//char sortie[100];


void ecriture(byte *data, int taille, int decryption) {
            FILE* out = NULL;
            out = fopen((sortie), "w");
            
            //byte test1[16] = {0xd4, 0x27, 0x11, 0xae, 0xe0, 0xbf, 0x98, 0xf1, 0xb8, 0xb4, 0x5d, 0xe5, 0x1e, 0x41, 0x52, 0x32};
            
            int difference = 0;
            if(decryption == 1) {
                difference = data[taille-1]+1;
            }
            
            fwrite(data, (taille-difference), 1, out);
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


byte *lecture(int *taille, int encryption) {
    byte *flux;
        //if (strcmp((entree), "") && strcmp((sortie), "")){
            FILE* out = NULL;
            out = fopen((entree), "r+");
            fseek(out, 0, SEEK_END);
            int file_length = ftell(out);

            if(encryption == 1) {
                file_length++; // Ajout d'un byte pour coder le padding
            }
            printf("%d\n", file_length);
            
            int difference = 0;
            if ((file_length %16) != 0) {
                difference = 16-(file_length % 16);
            }
            
            int length;
            length = file_length + difference;

            flux= calloc(sizeof(byte)* length, 1);
            fseek(out, 0, SEEK_SET);
            fread(flux, 1, file_length, out);
            if(encryption == 1) {
                flux[length-1] = difference; //Ajout du padding sur le dernier byte
            }

            //fwrite(test1, sizeof(test1), 1, out);
            fclose(out);

    //}
    *taille = length;
    return flux;
}