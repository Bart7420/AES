
#include <stdio.h>
#include <stddef.h>
#include "io.h"
#include <stdlib.h>

//#include "main.h"


extern char entree[100];
extern char sortie[100];
//char entree[100];
//char sortie[100];


void ecriture(char output[100], byte *data, int taille, int decryption) {
            FILE* out = NULL;
            out = fopen((output), "w");
            
            //byte test1[16] = {0xd4, 0x27, 0x11, 0xae, 0xe0, 0xbf, 0x98, 0xf1, 0xb8, 0xb4, 0x5d, 0xe5, 0x1e, 0x41, 0x52, 0x32};
            
            int difference = 0;
            if(decryption == 1) {
                difference = data[taille-1]+1;
            }

            if (difference>16) {
                difference = 0; // si la clé n'est pas la bonne, le padding est faux, on écrit alors jsute le résultat
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


byte *lecture(char input[100], int *taille, int mode) {
    byte *flux;
        //if (strcmp((entree), "") && strcmp((sortie), "")){
            printf("1\n");
            FILE* out = NULL;
            out = fopen((input), "r+");
            fseek(out, 0, SEEK_END);
            int file_length = ftell(out);

            if(mode == 1) {
                file_length++; // Ajout d'un byte pour coder le padding
            }
            printf("%d\n", file_length);
            
            int difference = 0;
            if (((file_length %16) != 0) && (mode !=2)) {
                difference = 16-(file_length % 16);
            }
            
            int length;
            length = file_length + difference;

            flux= calloc(sizeof(byte)* length, 1);
            fseek(out, 0, SEEK_SET);
            fread(flux, 1, file_length, out);
            if(mode == 1) {
                flux[length-1] = difference; //Ajout du padding sur le dernier byte
            }

            //fwrite(test1, sizeof(test1), 1, out);
            fclose(out);
            printf("2\n");
    //}
    *taille = length;
    return flux;
}