
#include <stdio.h>
#include <stddef.h>
#include "io.h"
#include <stdlib.h>
#include <string.h>

//#include "main.h"


extern char entree[100];
extern char sortie[100];
//char entree[100];
//char sortie[100];


void ecriture(char output[100], byte *data, long long int taille, int decryption) {
            printf("Ecriture du fichier\n");
            FILE* out = NULL;
            out = fopen((output), "w");
            
            //byte test1[16] = {0xd4, 0x27, 0x11, 0xae, 0xe0, 0xbf, 0x98, 0xf1, 0xb8, 0xb4, 0x5d, 0xe5, 0x1e, 0x41, 0x52, 0x32};
            
            int difference = 0;
            int eval = 0;
            if(decryption == 1) {
                #ifndef EVAL
                difference = data[taille-1]+1;
                #endif
                #ifdef EVAL
                unsigned int *fileLen = (unsigned int*) data; 
                difference = taille - *fileLen + 4; // Décalage des 4 premiers octets
                eval = 4;
                #endif
            }

            if (difference>16 || difference < 0) {
                difference = 0; // si la clé n'est pas la bonne, le padding est faux, on écrit alors jsute le résultat
            } 
            
            fwrite(&data[eval], (taille-difference), 1, out);
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


byte *lecture(char input[100], long long int *taille, int mode) {
    /* mode
    = 0 ajoute uniquement des zeros a la fin
    = 1 ajoute des zeros et code le nombre de zeros sur le dernier octet
    = 2 ajoute aucun zero
    */
    byte *flux;
    FILE* out = NULL;
    out = fopen((input), "r+");
    if(out == NULL){
        printf("Erreur lors de l'ouverture du fichier");
        return NULL;
    }
    fseek(out, 0, SEEK_END);
    long long int file_length = ftell(out);


    // Place pour encode la taille au début du fichier
    // Mode eval pour respecter la facon de coder la taille du fichier
    int eval = 0;

    if(mode == 1) {
        #ifndef EVAL
        file_length++; // Ajout d'un byte pour coder le padding
        #endif
        #ifdef EVAL
        file_length += 4;
        eval = 4;
        #endif
    }
    
    
    int difference = 0;
    if (((file_length %16) != 0) && (mode !=2)) {
        difference = 16-(file_length % 16);
    }
    
    long long int length;
    length = file_length + difference;


    flux= calloc(sizeof(byte)* length, 1);
    fseek(out, 0, SEEK_SET);
    fread(&flux[eval], 1, file_length, out);
    if(mode == 1) {
        #ifndef EVAL
        flux[length-1] = difference; //Ajout du padding sur le dernier byte
        #endif
        #ifdef EVAL
        unsigned int fileLen = (unsigned int) file_length;
        memcpy(flux, &fileLen, 4);
        #endif

    }
    fclose(out);
    printf("Lecture du fichier terminée\n");
    *taille = length;
    return flux;
}