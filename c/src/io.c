
#include <stdio.h>
#include <stddef.h>

//#include "main.h"


extern char entree[100];
extern char sortie[100];
//char entree[100];
//char sortie[100];


void ecriture() {

    if (strcmp((entree), "") && strcmp((sortie), "")){
            FILE* out = NULL;
            out = fopen((sortie), "w");
            
            /*if (out != NULL) { // vérification
                fputc( (char) 0x01, out);
                fputc( (char) 0x01, out);
                fclose(out);
            }*/
            unsigned char test1[16] = {0xd4, 0x27, 0x11, 0xae, 0xe0, 0xbf, 0x98, 0xf1, 0xb8, 0xb4, 0x5d, 0xe5, 0x1e, 0x41, 0x52, 0x32};
            fwrite(test1, sizeof(test1), 1, out);
            fclose(out);
 
      
    }
}