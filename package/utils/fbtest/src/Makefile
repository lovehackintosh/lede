CC = gcc
CFLAGS = -Wall -Ofast -pipe -march=armv8-a -mtune=cortex-a53 -mcpu=cortex-a53+crypto+crc
OBJS = fbtest.o

all: fbtest

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

fbtest: $(OBJS)
	$(CC) -o $@ $(OBJS)

clean:
	rm -f fbtest *.o
