#include "conversion.h"
#include <stdio.h>
#include <string.h>

byte transform(char in) {
    byte out;
    switch (in)
    {
    case '0':
        out = 0x00;
        break;
    case '1':
        out = 0x01;
        break;
    case '2':
        out = 0x02;
        break;
    case '3':
        out = 0x03;
        break;
    case '4':
        out = 0x04;
        break;
    case '5':
        out = 0x05;
        break;
    case '6':
        out = 0x06;
        break;
    case '7':
        out = 0x07;
        break;
    case '8':
        out = 0x08;
        break;
    case '9':
        out = 0x09;
        break;
    case 'a':
        out = 0x0a;
        break;
    case 'b':
        out = 0x0b;
        break;
    case 'c':
        out = 0x0c;
        break;
    case 'd':
        out = 0x0d;
        break;
    case 'e':
        out = 0x0e;
        break;
    case 'f':
        out = 0x0f;
        break;
    default:
            out = 0x00;
    }
    return out;
}

void strToState(char *str, byte *state) {

    for (int i=0, j=0; i<32;i=i+2, j++) {
        state[j] = (transform(str[i])<<4) ^ transform(str[i+1]);
    }

}

void stateToStr(byte *state, char *output) {

    char tot[33] = "";


    char un[3];
    char deux[3];
    char trois[3];
    char quatre[3];
    char cinq[3];
    char six[3];
    char sept[3];
    char huit[3];
    char neuf[3];
    char dix[3];
    char onze[3];
    char douze[3];
    char treize[3];
    char quatorze[3];
    char quinze[3];
    char seize[3];
    //char dernier[3];

    sprintf(un, "%2.2x", (int) state[0]);
    sprintf(deux, "%2.2x", (int) state[1]);
    sprintf(trois, "%2.2x", (int) state[2]);
    sprintf(quatre, "%2.2x", (int) state[3]);
    sprintf(cinq, "%2.2x", (int) state[4]);
    sprintf(six, "%2.2x", (int) state[5]);
    sprintf(sept, "%2.2x", (int) state[6]);
    sprintf(huit, "%2.2x", (int) state[7]);
    sprintf(neuf, "%2.2x", (int) state[8]);
    sprintf(dix, "%2.2x", (int) state[9]);
    sprintf(onze, "%2.2x", (int) state[10]);
    sprintf(douze, "%2.2x", (int) state[11]);
    sprintf(treize, "%2.2x", (int) state[12]);
    sprintf(quatorze, "%2.2x", (int) state[13]);
    sprintf(quinze, "%2.2x", (int) state[14]);
    sprintf(seize, "%2.2x", (int) state[15]);
    //sprintf(dernier, "%x", (int) state[16]);



    strcpy(tot, un);
    strcat(tot, deux);
    strcat(tot, trois);
    strcat(tot, quatre);
    strcat(tot, cinq);
    strcat(tot, six);
    strcat(tot, sept);
    strcat(tot, huit);
    strcat(tot, neuf);
    strcat(tot, dix);
    strcat(tot, onze);
    strcat(tot, douze);
    strcat(tot, treize);
    strcat(tot, quatorze);
    strcat(tot, quinze);
    strcat(tot, seize);
    //strcat(tot, dernier);


    for (int i = 0; i < 32; i++) {
        output[i] = tot[i];
    }


}

void strToWords(char *str, byte *state, int length) {

    for (int i=0, j=0; i<length;i=i+2, j++) {
        state[j] = (transform(str[i])<<4) ^ transform(str[i+1]);
    }

}

void wordsToStr(byte *state, char *output, int length) {
    for(int i = 0; i < length; i++){
        char un[3];
        sprintf(un, "%2.2x", (int) state[i]);
        strncpy(&output[2*i], un, 2);
    }
}