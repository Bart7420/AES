main: main.o aes.o tests.o
	gcc -o $@ $^ -g -Wall -Wextra -fsanitize=address


main.o: main.c aes.h main.h tests.h
	gcc -c -g $<

aes.o: aes.c aes.h
	gcc -c -g $<

tests.o : tests.c tests.h
	gcc -c -g $<


clean:
	rm -rf *.o
	rm -rf main
	rm -rf test