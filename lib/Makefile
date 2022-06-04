C_SRC = $(sort $(wildcard *.c))
OBJ = $(patsubst %.c,%.o,$(C_SRC))

all: $(OBJ)

%.o: %.c
	${GCC} ${CFLAG} -c $<

clean: 
	$(shell rm *.o -rf)


.PHONY: all clean