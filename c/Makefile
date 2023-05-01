main: main.o aes.o
	gcc -o $@ $^ -Wall -Wextra -fsanitize=address


main.o: main.c aes.h
	gcc -c $<

aes.o: aes.c aes.h
	gcc -c $<



clean:
	rm -rf *.o
	rm -rf main
	rm -rf test