gcc_options = -g -Wall -Wextra -fsanitize=address
mode =

test = 0 # Tests
ifeq ($(test), 1)
gcc_options += -D TEST=1
endif

saes = 0 # Ligne de commande (uniquement aes sur entrée terminal)
ifeq ($(saes), 1)
gcc_options += -D CMD=1
endif

gaes = 0 # Interface graphique
ifeq ($(gaes), 1)
gcc_options += -D GRAPHIC=1
endif


main: main.o aes.o tests.o conversion.o cmd_aes.o graphic_aes.o
	gcc -o $@ $^ $(gcc_options)


main.o: main.c include/main.h
	gcc -c $(gcc_options) $<

aes.o: aes.c include/aes.h
	gcc -c $(gcc_options) $<

tests.o : tests.c include/tests.h
	gcc -c $(gcc_options) $<

conversion.o : conversion.c include/conversion.h
	gcc -c $(gcc_options) $<

cmd_aes.o : cmd_aes.c include/cmd_aes.h
	gcc -c $(gcc_options) $<

graphic_aes.o : graphic_aes.c include/graphic_aes.h
	gcc -c $(gcc_options) $<


clean:
	rm -rf *.o
	rm -rf main
	rm -rf test