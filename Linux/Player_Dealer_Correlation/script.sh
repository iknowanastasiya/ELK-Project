#!/bin/bash


#$1 number variable is the date of the file name ex. 0310
#$2 string variable is time ex. 08
#$3 variable for am/pm ignoring the case
#   and last appends the appropriate line to the dealer working file

awk '{print $1, $2, $5, $6}' $1_Dealer_schedule | grep $2 | grep -i $3 >> Dealers_working_during_losses1.txt


