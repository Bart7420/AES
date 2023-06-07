
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

#include "io.h"
#include "bmp.h"
#include "cbc.h"
#include "ecb.h"

int count(byte *entree, int taille, byte code) {

    int c = 0;
    for (int i =0; i < taille; i++) {
        if (entree[i] == code) {
            c++;
        }
        
    }

    return c;

}

void set_zero(byte *entree, int taille, byte code) {
    for (int i = 0; i < taille; i++) {
        if (entree[i] == code) {
            entree[i] = 0x00;
        }
    }
}

void entropie(byte *entree, int taille) {

    int coefs[256] = {0};
    int coefs[256] = {0};

    // /coefs[0] = count(entree, taille, 0x00);

    for (int i = 0; i < 256; i++)
    for (int i = 0; i < 256; i++)
    {
        for (int j = 0; j < taille; j++) {   
        for (int j = 0; j < taille; j++) {   
            if (entree[j] == i) {
                coefs[i]++;
            }
            
        }
        

        //coefs[i] = count(entree, taille, i);
        //set_zero(entree, taille, i);
    }

    int nb_symboles = 0;
    for (int i = 0; i < 256; i++) {
        if (coefs[i] != 0) {   
            nb_symboles++;
        }  
    }

    /*
    int sum = 0;
    for (int i = 0; i < 256; i++) {
        printf("elemeent %d, %d\n", i, coefs[i]);
        sum = sum + coefs[i];
    }*/
    

    float sumprob = 0;
    
    float entropie = 0;
    int indice = 0;
    for (int i = 0; i < nb_symboles; i++) {
        if (indice>256) {
            break;
        }
        while (coefs[indice] == 0x00){
            indice++;
        }
        float pi = (float)coefs[indice] / (float)taille;
        
       //if (pi != 0.0) // pas besoin car tri avant
       {
          entropie = entropie - pi * log2f(pi);
       }
       
        
        
        //printf("les prob %f\n", pi);
        //sumprob += pi;
        indice++;
    }

    printf("entropie : %.9f\n", entropie);
    //printf("taille %d\n", taille);
    //printf("sum %d\n", sum);
    //printf("sum %f\n", sumprob);
}





















/* mode : 1=encode, 2=decode
 * version : 1=ecb, 2=cbc*/
void bmp(int mode, int version, char path_entree[100], char path_sortie[100], byte cle[65]) {
    long long int taille_fichier = 0;
    //printf("%s\n", argv[1]);

    byte *entree = lecture(path_entree, &taille_fichier, 2);
    int *offset3 = entree+10; // on récupère la position des données dans le fichier bmp qui sont à la poistion 10
    int offset2 = *offset3;
    printf("nouvel offset : %d\n", offset2);

    entree = realloc(entree, taille_fichier+offset2);
    byte *entree2;
    entree2 = entree+offset2; // le fichier sans l'en tete
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
    
    

    long long int bin = 0;
    byte* entreecodee = lecture("temp.offset2", &bin, 0); // le fichier sans l'en tete
    memcpy(entree2, entreecodee, taille_fichier);
    ecriture(path_sortie, entree, taille_fichier+offset2, 0);

    // entreecodee : data du fichiern encodé (sans l'én tete)

    entropie(entreecodee, taille_fichier);

    // calcul de l'entropie

    


    free(entree);
    free(entreecodee);
    
}







