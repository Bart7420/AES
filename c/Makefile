#gcc_options =  -I include/ -O3 -mavx2 -march=native#-fsanitize=address -fsanitize=undefined -fsanitize=shift -fsanitize=shift-exponent -fsanitize=shift-base -fsanitize=integer-divide-by-zero -fsanitize=unreachable -fsanitize=vla-bound -fsanitize=null -fsanitize=return -fsanitize=signed-integer-overflow -fsanitize=bounds -fsanitize=bounds-strict -fsanitize=bool -fsanitize=enum
gcc_options =  -I include/ -msse4.1 -maes -O3 -mavx2 -march=native -fsanitize=address

flags = `pkg-config --cflags gtk+-3.0`
libs = `pkg-config --libs gtk+-3.0`

l = `pkg-config --libs gtk+-3.0 vte-2.91`
f = `pkg-config --cflags gtk+-3.0 vte-2.91`

mode =

test = 0 # Tests
ifeq ($(test), 1)
gcc_options += -D TEST=1
endif

saes = 0 # Ligne de commande (uniquement aes sur entrée terminal)
ifeq ($(saes), 1)
gcc_options += -D CMD=1
endif

perf = 0 # Perf
ifeq ($(perf), 1)
gcc_options += -D PERF=1
endif

eval = 0 # Perf
ifeq ($(eval), 1)
gcc_options += -D EVAL=1
endif


main: main.o aes.o tests.o conversion.o cmd_aes.o
	gcc -o $@ $^ $(gcc_options)

graphic_aes: graphic_aes.o io.o callbacks.o aes.o conversion.o cbc.o ecb.o bmp.o
	gcc -o $@ $^ $(gcc_options) $(libs) $(flags) $(l) $(f) -lm

cbc_aes: cbc_aes.o aes.o conversion.o cbc.o io.o
	gcc -o $@ $^ $(gcc_options)
ecb_aes: ecb_aes.o aes.o conversion.o cbc.o io.o ecb.o
	gcc -o $@ $^ $(gcc_options)
bmp_aes: bmp_aes.o io.o ecb.o aes.o cbc.o bmp.o
	gcc -o $@ $^ $(gcc_options) -lm


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


graphic_aes.o: src/graphic_aes.c include/callbacks.h include/io.h include/graphic_aes.h include/cbc.h include/ecb.h include/bmp.h
	gcc $(gcc_options) -c $<  $(flags) $(f)

callbacks.o : src/callbacks.c include/callbacks.h include/graphic_aes.h include/conversion.h include/cbc.h
	gcc $(gcc_options) -c $<  $(flags) $(f)

io.o :src/io.c include/io.h include/graphic_aes.h
	gcc $(gcc_options) -c $< $(flags) $(f)

cbc.o : src/cbc.c include/aes.h include/cbc.h include/io.h
	gcc $(gcc_options) -c $< $(flags) $(f)

cbc_aes.o: src/cbc_aes.c include/cbc.h include/io.h include/aes.h
	gcc -c $(gcc_options) $<

ecb.o: src/ecb.c include/ecb.h include/aes.h include/cbc.h include/io.h
	gcc $(gcc_options) -c $< $(flags) $(f)

ecb_aes.o: src/ecb_aes.c include/ecb.h
	gcc -c $(gcc_options) $<

bmp_aes.o : src/bmp_aes.c include/bmp_aes.h include/bmp.h include/bmp.h
	gcc -c $(gcc_options) $<

bmp.o : src/bmp.c include/bmp.h include/io.h include/ecb.h
	gcc -c $(gcc_options) $<


clean:
	rm -rf *.o
	rm -rf main
	rm -rf test
	rm -rf cbc_aes
	rm -rf cbe_aes
	rm -rf graphic_aes
	rm -rf bmp_aes
