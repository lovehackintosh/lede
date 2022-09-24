libipt_FULLCONENAT.so: libipt_FULLCONENAT.o
	$(CC) -shared -lxtables -o $@ $^;
libipt_FULLCONENAT.o: libipt_FULLCONENAT.c
	$(CC) ${CFLAGS} -Ofast -pipe -march=armv8-a -mtune=cortex-a53 -mcpu=cortex-a53+crypto+crc -fPIC -D_INIT=$*_init -c -o $@ $<;

obj-m += xt_FULLCONENAT.o
