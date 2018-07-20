# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ryaoi <ryaoi@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/07/17 13:17:32 by ryaoi             #+#    #+#              #
#    Updated: 2018/07/20 13:53:12 by ryaoi            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC 		= gcc
CFLAGS 	= -Wall -Wextra -Werror
NAME 	= Quine

all: $(NAME)
	
$(NAME): Colleen Grace Sully

Colleen: Colleen.s
	nasm -fmacho64 $^
	$(CC) $(CFLAGS) -o $@ Colleen.o

Grace: Grace.s
	nasm -fmacho64 $^
	$(CC) $(CFLAGS) -o $@ Grace.o

Sully: Sully.s
	nasm -fmacho64 $^
	$(CC) $(CFLAGS) -o $@ Sully.o

fclean_Colleen:
	rm -rf Colleen

fclean_Grace:
	rm -rf Grace

fclean_Sully:
	rm -rf Sully

clean :
	rm -rf Colleen.o Grace.o Sully.o

fclean: clean fclean_Colleen fclean_Grace fclean_Sully

re: fclean
	make
