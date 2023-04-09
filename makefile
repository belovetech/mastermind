.PHONY: all clean oclean fclean re

CC = gcc
SRC = main.c checkcode.c utils.c 
OBJ = $(SRC:%.c=%.o)
NAME = my_mastermind
ERR = -Wall -Wextra -Werror
RM = rm -f

all: ${OBJ}
	${CC} ${ERR} ${SRC} -o ${NAME}

clean:
	${RM} *~ ${NAME}

oclean:
	${RM} ${OBJ}

fclean: clean oclean

re: oclean all