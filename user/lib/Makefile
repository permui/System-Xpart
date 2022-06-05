ASM_SRC		= $(sort $(wildcard *.S))
C_SRC       = $(sort $(wildcard *.c))
OBJ		    = $(patsubst %.S,%.o,$(ASM_SRC)) $(patsubst %.c,%.o,$(C_SRC))

all: built-in.a

built-in.a: $(OBJ)
	$(AR) cDPrST built-in.a $(OBJ)

%.o:%.c
	$(CC) $(CFLAG) -c $<

%.o:%.S
	$(CC) $(CFLAG)  -c $<

clean:
	rm -rf *.o built-in.a