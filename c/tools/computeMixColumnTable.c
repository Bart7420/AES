#include <stdio.h>

typedef unsigned char byte;

byte multPoly(byte poly1, byte poly2) {

    byte result = 0;

    for (int i = 0; i < 8; i++) {
        if ((poly2 & 1) == 1) {
            result = result ^ poly1;
        }
        // test l'état du bit de poid le plus fort
        if ((poly1 & 0x80) == 0x80) {

            poly1<<=1;

            poly1 = poly1 ^ 0x1b; // on multiplie (xor dans l'ensemble fini) par l'élément irréductible

        } else {

            poly1<<=1;
        }
        

        poly2 >>= 1; // on décale b pour obtenir le prochain bit en position la plus faible
    }
    return result;
    
}


int main(int argc,char *argv[]){
    byte array02[256];
    byte array03[256];
    byte array0e[256];
    byte array0b[256];
    byte array0d[256];
    byte array09[256];

    for (int i = 0; i < 256; i++) {
        array02[i] = multPoly(0x02, i);
        array03[i] = multPoly(0x03, i);
        array0e[i] = multPoly(0x0e, i);
        array0b[i] = multPoly(0x0b, i);
        array0d[i] = multPoly(0x0d, i);
        array09[i] = multPoly(0x09, i);
    }

    //Print result in a c array format
    printf("byte mixTable02[256] = {");
    for (int i = 0; i < 256; i++) {
        printf("0x%02x, ", array02[i]);
    }
    printf("};\n");
    printf("byte mixTable03[256] = {");
    for (int i = 0; i < 256; i++) {
        printf("0x%02x, ", array03[i]);
    }
    printf("};\n");
    printf("byte mixTable0e[256] = {");
    for (int i = 0; i < 256; i++) {
        printf("0x%02x, ", array0e[i]);
    }
    printf("};\n");
    printf("byte mixTable0b[256] = {");
    for (int i = 0; i < 256; i++) {
        printf("0x%02x, ", array0b[i]);
    }
    printf("};\n");
    printf("byte mixTable0d[256] = {");
    for (int i = 0; i < 256; i++) {
        printf("0x%02x, ", array0d[i]);
    }
    printf("};\n");
    printf("byte mixTable09[256] = {");
    for (int i = 0; i < 256; i++) {
        printf("0x%02x, ", array09[i]);
    }
    printf("};\n");

    return 0;
}
