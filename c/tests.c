
#include <string.h>
#include <stdio.h>
#include "aes.h"

void strToState(unsigned char *str, unsigned char *state) {

    unsigned char transform(unsigned char in) {
        unsigned char out;
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
        }
        return out;
    }

    for (int i=0, j=0; i<32;i=i+2, j++) {
        state[j] = (transform(str[i])<<4) ^ transform(str[i+1]);
    }

}

void stateToStr(unsigned char *state, unsigned char *output) {

    char tot[36];


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


    for (int i = 0; i < 36; i++) {
        output[i] = tot[i];
    }


}


void verifier_test(char *name, char *test, char *verif) {
    if (strcmp(test, verif) == 0) {
        printf("\033[0;32m");
        printf("%s : ok\n", name);
        printf("ATTENDU : %s\n", verif);
        printf("RESULT  : %s\n", test);
        printf("\033[0m");
    } else {
        printf("\033[0;31m");
        printf("%s : ko\n", name);
        printf("ATTENDU : %s\n", verif);
        printf("RESULT  : %s\n", test);
        printf("\033[0m");
        

    }
}


void test_mixColumn() {


    /*              TEST 1            */
    /*      Attendu :                 */
    char attendu1[] = "046681e5e0cb199a48f8d37a2806264c";

    /*      Entrée du test :          */
    unsigned char test1[16] = {0xd4, 0xbf, 0x5d, 0x30, 0xe0, 0xb4, 0x52, 0xae, 0xb8, 0x41, 0x11, 0xf1, 0x1e, 0x27, 0x98, 0xe5};
    
    /*      Commande a tester :       */
    mixColumn(test1);

    /*     Conversion(NE PAS MODIFIER)*/
    char result1[32] = "";
    stateToStr(test1, result1);
    /*      Véfification du test      */
    verifier_test("mixcolumn test1", result1, attendu1);

}

void test_invMixColumn() {


    /*              TEST 1            */
    /*      Attendu :                 */
    char attendu1[] = "4773b91ff72f354361cb018ea1e6cf2c";

    /*      Entrée du test :          */
    unsigned char test1[16] = {0xbd, 0x6e, 0x7c, 0x3d, 0xf2, 0xb5, 0x77, 0x9e, 0x0b, 0x61, 0x21, 0x6e, 0x8b, 0x10, 0xb6, 0x89};
    
    /*      Commande a tester :       */
    invMixColumn(test1);

    /*     Conversion(NE PAS MODIFIER)*/
    char result1[32] = "";
    stateToStr(test1, result1);
    /*      Véfification du test      */
    verifier_test("invMixcolumn test1", result1, attendu1);

}


void test_subBytes() {

    /*              TEST 1            */
    /*      Attendu :                 */
    char attendu1[] = "d42711aee0bf98f1b8b45de51e415230";

    /*      Entrée du test :          */
    unsigned char test1[16] = {0x19, 0x3d, 0xe3, 0xbe, 0xa0, 0xf4, 0xe2, 0x2b, 0x9a, 0xc6, 0x8d, 0x2a, 0xe9, 0xf8, 0x48, 0x08};

    /*      Commande a tester :       */
    subBytes(test1);

    /*     Conversion(NE PAS MODIFIER)*/
    char result1[32] = "";
    stateToStr(test1, result1);
    /*      Véfification du test      */
    verifier_test("subBytes test1", result1, attendu1);
}

void test_invSubBytes() {

    /*              TEST 1            */
    /*      Attendu :                 */
    char attendu1[] = "bdb52189f261b63d0b107c9e8b6e776e";

    /*      Entrée du test :          */
    unsigned char test1[16] = {0x7a, 0xd5, 0xfd, 0xa7, 0x89, 0xef, 0x4e, 0x27, 0x2b, 0xca, 0x10, 0x0b, 0x3d, 0x9f, 0xf5, 0x9f};

    /*      Commande a tester :       */
    invSubBytes(test1);

    /*     Conversion(NE PAS MODIFIER)*/
    char result1[32] = "";
    stateToStr(test1, result1);
    /*      Véfification du test      */
    verifier_test("invSubBytes test1", result1, attendu1);
}

void test_addRoundKey() {

    /*              TEST 1            */
    /*      Attendu :                 */
    char attendu1[] = "a49c7ff2689f352b6b5bea43026a5049";

    /*      Entrée du test :          */
    unsigned char test1[16] = {0x04, 0x66, 0x81, 0xe5, 0xe0, 0xcb, 0x19, 0x9a, 0x48, 0xf8, 0xd3, 0x7a, 0x28, 0x06, 0x26, 0x4c};
    unsigned char test1_key[16] = {0xa0, 0xfa, 0xfe, 0x17, 0x88, 0x54, 0x2c, 0xb1, 0x23, 0xa3, 0x39, 0x39, 0x2a, 0x6c, 0x76, 0x05};

    /*      Commande a tester :       */
    addRoundKey(test1, test1_key);

    /*     Conversion(NE PAS MODIFIER)*/
    char result1[32] = "";
    stateToStr(test1, result1);
    /*      Véfification du test      */
    verifier_test("addRoundKey test1", result1, attendu1);
}

void test_shiftRows() {

    /*              TEST 1            */
    /*      Attendu :                 */
    char attendu1[] = "d4bf5d30e0b452aeb84111f11e2798e5";

    /*      Entrée du test :          */
    unsigned char test1[16] = {0xd4, 0x27, 0x11, 0xae, 0xe0, 0xbf, 0x98, 0xf1, 0xb8, 0xb4, 0x5d, 0xe5, 0x1e, 0x41, 0x52, 0x30};

    /*      Commande a tester :       */
    shiftRows(test1);

    /*     Conversion(NE PAS MODIFIER)*/
    char result1[32] = "";
    stateToStr(test1, result1);
    /*      Véfification du test      */
    verifier_test("shiftRows test1", result1, attendu1);
}

void test_invShiftRows() {

    /*              TEST 1            */
    /*      Attendu :                 */
    char attendu1[] = "3e175076b61c04678dfc2295f6a8bfc0";

    /*      Entrée du test :          */
    char test1bis[] = "3e1c22c0b6fcbf768da85067f6170495";
    unsigned char test1[16];// = {0x3e, 0x1c, 0x22, 0xc0, 0xb6, 0xfc, 0xbf, 0x76, 0x8d, 0xa8, 0x50, 0x67, 0xf6, 0x17, 0x04, 0x95};
    strToState(test1bis, test1);

    /*      Commande a tester :       */
    invShiftRows(test1);

    /*     Conversion(NE PAS MODIFIER)*/
    char result1[32] = "";
    stateToStr(test1, result1);
    /*      Véfification du test      */
    verifier_test("invShiftRows test1", result1, attendu1);


    /*              TEST 2            */
    /*      Attendu :                 */
    char attendu2[] = "5411f4b56bd9700e96a0902fa1bb9aa1";

    /*      Entrée du test :          */
    char test2bis[] = "54d990a16ba09ab596bbf40ea111702f";
    unsigned char test2[16];
    strToState(test2bis, test2);

    /*      Commande a tester :       */
    invShiftRows(test2);

    /*     Conversion(NE PAS MODIFIER)*/
    char result2[32] = "";
    stateToStr(test2, result2);
    /*      Véfification du test      */
    verifier_test("invShiftRows test2", result2, attendu2);
}

void all_tests() {
    test_mixColumn();
    test_invMixColumn();
    test_subBytes();
    test_invSubBytes();
    test_addRoundKey();
    test_shiftRows();
    test_invShiftRows();
}



