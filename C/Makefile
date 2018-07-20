# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ryaoi <ryaoi@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/07/17 13:17:32 by ryaoi             #+#    #+#              #
#    Updated: 2018/07/20 13:53:22 by ryaoi            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC 		= gcc
CFLAGS 	= -Wall -Wextra -Werror
NAME 	= Quine

all: $(NAME)
	
$(NAME): Colleen Grace Sully

Colleen: Colleen.c
	$(CC) $(CFLAGS) -o $@ $^

Grace: Grace.c
	$(CC) $(CFLAGS) -o $@ $^

Sully: Sully.c
	$(CC) $(CFLAGS) -o $@ $^

fclean_Colleen:
	rm -rf Colleen

fclean_Grace:
	rm -rf Grace

fclean_Sully:
	rm -rf Sully

clean :
	@echo "No object file!"

fclean: fclean_Colleen fclean_Grace fclean_Sully

re: fclean
	make
