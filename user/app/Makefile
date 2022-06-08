USER_C_FILES = $(notdir $(wildcard app/*.c))
USER_TARGET = $(patsubst %.c,%,$(USER_C_FILES))

# USER_TARGET += 			\
# 				hello 	\
# 				shell	\
# 				demo	\
# 				owen

%.o:%.c
	$(CC) $(CFLAG) -c $< -o $@

%.o:%.S
	$(CC) $(CFLAG) -c $< -o $@