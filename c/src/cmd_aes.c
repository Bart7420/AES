#include "cmd_aes.h"
#include "conversion.h"
#include "aes.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void clearBuffer() {
    char c;
    while((c = getchar()) != '\n' && c != EOF);
}

void cmdAes(){
    printf("AES command line\n");

    byte input[16];
    byte key[32];

    while(getInputText(input) == 0){
        printf("\nErreur lors de la saisie");
        clearBuffer();
    }
    clearBuffer();
    int keyLength = getKey(key);

    while(keyLength == 0){
        printf("\nErreur lors de la saisie");
        clearBuffer();
        keyLength = getKey(key);
    }
    clearBuffer();

    byte *output = chiffrer(key, input, keyLength);
    char result[33] = "";
    stateToStr(output, result);

    int vAES = 0;
    switch(keyLength){
        case 4:
            vAES = 128;
            break;
        case 6:
            vAES = 192;
            break;
        case 8:
            vAES = 256;
            break;
        default:
            break;
    }

    printf("\n\n Version AES : %d", vAES);
    printf("\n Sortie chiffrée : %s\n\n", result);

    free(output);

}

int getInputText(byte *input){

    char text[33] = "";
    printf("\nEntrez le texte à chiffrer (32 char): ");
    if(scanf("%32[0-9a-f]", text) == EOF || strlen(text) != 32){
        return 0;
    }
    strToState(text, input);
    return 1;


}
int getKey(byte *key) {
    
    char user_key[65] = "";

    printf("\nEntrez la clé de chiffrement : ");
    if(scanf("%64[0-9a-f]", user_key) == EOF){
        return 0;
    }
    int keyLength = strlen(user_key)/8;

    if(keyLength != 4 && keyLength != 6 && keyLength != 8){
        return 0;
    }

    strToWords(user_key, key, strlen(user_key));
    return keyLength;
}