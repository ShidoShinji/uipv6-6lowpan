# Test Makefile for uip6

CC=gcc
LD=gcc

INCLUDES=-I"./lib/"\
	-I"./sys/"\
	-I"./net/"\
	-I"./cpu/native/net/"\
	-I"./"

CFLAGS=-std=c99\
	   -DUIP_CONF_IPV6\
	   -g

SRC=$(wildcard ./lib/*.c)
SRC+=$(wildcard ./net/*.c)
SRC+=$(wildcard ./sys/*.c)
SRC+=$(wildcard ./platform/native/*.c)
SRC+=$(wildcard ./cpu/native/net/*.c)

ifdef APPNAME
	SRC+=./apps/$(APPNAME)/main.c
endif

OBJ=$(SRC:.c=.o)

all: $(OBJ)
	$(CC) $(CFLAGS) -o main $(OBJ)

$(OBJ): %.o: %.c
	$(CC) -c $(CFLAGS) $(INCLUDES) $< -o $@

clean:
	-rm $(OBJ) main

dbg-show-src:
	echo $(SRC)

dbg-show-obj:
	echo $(OBJ)


