all: nvram

nvram:
	$(CC) $(CFLAGS) -Ofast -pipe -march=armv8-a -mtune=cortex-a53 -mcpu=cortex-a53+crypto+crc -o $@ cli.c crc.c nvram.c $(LDFLAGS)

clean:
	rm -f nvram
