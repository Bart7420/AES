gcc_options =  -I include/ #-fsanitize=address -fsanitize=undefined -fsanitize=shift -fsanitize=shift-exponent -fsanitize=shift-base -fsanitize=integer-divide-by-zero -fsanitize=unreachable -fsanitize=vla-bound -fsanitize=null -fsanitize=return -fsanitize=signed-integer-overflow -fsanitize=bounds -fsanitize=bounds-strict -fsanitize=bool -fsanitize=enum
#gcc_options = -g -Wall -Wextra -I include/ -fsanitize=address #-O3 -mavx2 -march=native


mixTable: 
	gcc -o computeMixColumnTable computeMixColumnTable.c $(gcc_options)



clean:
	rm -rf *.o
	rm -rf main
	rm -rf test