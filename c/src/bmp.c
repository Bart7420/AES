
#include <string.h>
#include <stdlib.h>
#include <stdio.h>

#include "io.h"
#include "bmp.h"
#include "cbc.h"
#include "ecb.h"

/* mode : 1=encode, 2=decode
 * version : 1=ecb, 2=cbc*/
void bmp(int mode, int version, char path_entree[100], char path_sortie[100], byte cle[65]) {
    int taille_fichier = 0;
    //printf("%s\n", argv[1]);

    byte *entree = lecture(path_entree, &taille_fichier, 2);
    int *offset3 = entree+10; // on récupère la position des données dans le fichier bmp qui sont à la poistion 10
    int offset2 = *offset3;
    printf("nouvel offset : %d\n", offset2);

    entree = realloc(entree, taille_fichier+offset2);
    byte *entree2;
    entree2 = entree+offset2;
    ecriture("temp.offset", entree2, taille_fichier, 0);

    if (mode == 1) {
        if (version == 2) {
            chiffrer_cbc("temp.offset", "temp.offset2", cle );
        } else if (version == 1) {
            chiffrer_ecb("temp.offset", "temp.offset2", cle );
        } /*else {
            printf("erreur dans la version");
            return 1;
        }*/
    } else if (mode == 2) {
        if (version == 2) {
            dechiffrer_cbc("temp.offset", "temp.offset2", cle );
        } else if (version == 1) {
            dechiffrer_ecb("temp.offset", "temp.offset2", cle );
        }/* else {
            printf("erreur dans la version");
            return 1;
        }*/
    } else {
        printf("erreur dans le mode (decode, encode) ");
    }
    
    

    int bin = 0;
    byte* entreecodee = lecture("temp.offset2", &bin, 0);
    memcpy(entree2, entreecodee, taille_fichier);
    ecriture(path_sortie, entree, taille_fichier+offset2, 0);
    free(entree);
    free(entreecodee);
    
}



