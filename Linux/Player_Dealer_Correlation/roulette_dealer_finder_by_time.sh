#!/bin/bash


#$1 number variable is the date of the file name ex. 0310
#$2 string variable is time ex. '08:00:00 PM'


awk '{print $1, $2, $5, $6}' $1_Dealer_schedule | grep "$2"


