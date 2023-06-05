gcc_options = -g -Wall -Wextra -I include/ -fsanitize=address

flags = `pkg-config --cflags gtk+-3.0`
libs = `pkg-config --libs gtk+-3.0`

mode =

test = 0 # Tests
ifeq ($(test), 1)
gcc_options += -D TEST=1
endif

saes = 0 # Ligne de commande (uniquement aes sur entrée terminal)
ifeq ($(saes), 1)
gcc_options += -D CMD=1
endif


main: main.o aes.o tests.o conversion.o cmd_aes.o
	gcc -o $@ $^ $(gcc_options)

graphic_aes: graphic_aes.o io.o callbacks.o aes.o conversion.o
	gcc -o $@ $^ $(gcc_options) $(libs) $(flags)


main.o: src/main.c include/main.h
	gcc -c $(gcc_options) $<

aes.o: src/aes.c include/aes.h
	gcc -c $(gcc_options) $<

tests.o : src/tests.c include/tests.h
	gcc -c $(gcc_options) $<

conversion.o : src/conversion.c include/conversion.h
	gcc -c $(gcc_options) $<

cmd_aes.o : src/cmd_aes.c include/cmd_aes.h
	gcc -c $(gcc_options) $<


graphic_aes.o: src/graphic_aes.c include/callbacks.h include/io.h include/graphic_aes.h
	gcc $(gcc_options) -c $<  $(flags)

callbacks.o : src/callbacks.c include/callbacks.h include/graphic_aes.h
	gcc $(gcc_options) -c $<  $(flags)

io.o :src/io.c include/io.h include/graphic_aes.h
	gcc $(gcc_options) -c $< $(flags)


clean:
	rm -rf *.o
	rm -rf main
	rm -rf test