CC=gcc
CFLAGS=-Iinclude -Wall
SRC=$(wildcard src/*.c)
OBJ=$(patsubst src/%, build/%, $(SRC:.c=.o))
EXEC=build/cnetlab

all: $(EXEC)

$(EXEC): $(OBJ)
	mkdir -p build
	$(CC) $(CFLAGS) -o $@ $^

build/%.o: src/%.c
	mkdir -p build
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf build/*

docker-image:
	docker build -t cnetlab .

docker-build:
	docker run --rm -v $(PWD)/build:/app/build cnetlab make all

docker-run:
	docker run --rm -v $(PWD)/build:/app/build cnetlab ./build/cnetlab