INSTALL_PATH?=/usr/local

.PHONY: all objects install clean

all: objects
	${CXX} -DHAVE_PWD_H -DHAVE_TIME_H -DHAVE_SYS_TIME_H -DHAVE_UNISTD_H --std=c++11 *.cpp objects/*.o -o bake

objects:
	mkdir -p objects/
	${CC} sundown/*.c -c
	mv *.o objects/

install:
	cp bake ${INSTALL_PATH}/bin

clean:
	rm -fr objects/
	rm -f bake
