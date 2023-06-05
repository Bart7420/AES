typedef unsigned char byte;
void strToState(char *str, byte *state);
void stateToStr(byte *state, char *output);
void strToWords(char *str, byte *state, int length);
void wordsToStr(byte *state, char *output, int length);