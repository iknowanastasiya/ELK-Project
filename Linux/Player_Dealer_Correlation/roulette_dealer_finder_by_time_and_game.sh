#!/bin/bash

#
#
#
#$1 number variable is the date of the file name ex. 0310
#$2 string variable is time ex. '08:00:00 PM'
#$3 table position for first name based on the game
#$4 table position for the last game based on the game

# Black Jack Dealer schedule pass variable  $3 and $4 as '$3' and '$4'
# Roulette Dealer schedule pass variable  $3 and $4 as '$5' and '$6'
# Texas Hold Em Dealer schedule pass variable  $3 and $4 as '$7' and '$8'



	awk '{print $1, $2, '$3', '$4'}' $1_Dealer_schedule | grep "$2"


