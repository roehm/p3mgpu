CC=gcc
CFLAGS=-Wall -fopenmp
LFLAGS=-lfftw3 -lm

all: p3mstandalone

p3mstandalone: charge-assign.o common.o error.o ewald.o interpol.o io.o p3m-common.o p3m-ik.o realpart.o timings.o p3m-ad.o p3m-ad-i.o p3m-ik-i.o Makefile
	$(CC) $(CFLAGS) $(LFLAGS) p3m-ad.o p3m-ik-i.o p3m-ad-i.o charge-assign.o common.o error.o ewald.o interpol.o io.o p3m-common.o p3m-ik.o realpart.o main.c -o p3m

charge-assign.o: charge-assign.c charge-assign.h
	$(CC) -c $(CFLAGS) charge-assign.c
common.o: common.c common.h
	$(CC) -c $(CFLAGS) common.c
error.o: error.c error.h
	$(CC) -c $(CFLAGS) error.c
ewald.o: ewald.c ewald.h
	$(CC) -c $(CFLAGS) ewald.c
interpol.o: interpol.c interpol.h
	$(CC) -c $(CFLAGS) interpol.c
io.o: io.c io.h
	$(CC) -c $(CFLAGS) io.c
p3m-common.o: p3m-common.c p3m-common.h
	$(CC) -c $(CFLAGS) p3m-common.c
p3m-ik.o: p3m-ik.c p3m-ik.h
	$(CC) -c $(CFLAGS) p3m-ik.c
p3m-ad.o: p3m-ad.c p3m-ad.h
	$(CC) -c $(CFLAGS) p3m-ad.c
p3m-ik-i.o: p3m-ik-i.c p3m-ik-i.h
	$(CC) -c $(CFLAGS) p3m-ik-i.c
p3m-ad-i.o: p3m-ad-i.c p3m-ad-i.h
	$(CC) -c $(CFLAGS) p3m-ad-i.c
realpart.o: realpart.c realpart.h
	$(CC) -c $(CFLAGS) realpart.c

.PHONY = all
