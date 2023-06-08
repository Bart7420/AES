#gcc_options =  #-I include/ #-fsanitize=address -fsanitize=undefined -fsanitize=shift -fsanitize=shift-exponent -fsanitize=shift-base -fsanitize=integer-divide-by-zero -fsanitize=unreachable -fsanitize=vla-bound -fsanitize=null -fsanitize=return -fsanitize=signed-integer-overflow -fsanitize=bounds -fsanitize=bounds-strict -fsanitize=bool -fsanitize=enum
gcc_options = -g -O3 -mavx2 -march=native #-g -Wall -Wextra -fsanitize=address


mixTable: 
	gcc -o computeMixColumnTable computeMixColumnTable.c $(gcc_options)

testVit: 
	gcc -o testVit testVit.c $(gcc_options)



clean:
	rm -rf *.o
	rm -rf computeMixColumnTable
	rm -rf testVit