all: copy MINILIBMX little_clean

copy:
	mkdir obj
	cp inc/*.h obj/
	cp src/*.c obj/

MINILIBMX: object.o

object.o:
	clang -c -std=c11 -Wall -Wextra -Werror -Wpedantic obj/*.c
	ar -rc libmx.a *.o
	rm *.o

little_clean:
	rm -rf obj

uninstall:
	rm -rf obj
	rm calc

clean:
	rm -rf src
	rm -rf inc
	rm -rf obj

reinstall:
	make uninstall
	make
