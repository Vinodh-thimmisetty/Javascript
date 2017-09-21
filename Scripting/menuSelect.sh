#/bin/bash

#Purpose: Select a value from available List of Menu items
#Author: Vinodh Kumar Thimmisetty

#Set PS3 Command Prompt: It is like asking user to select a value from the Menu
PS3="Select a food Item"
COLUMNS=12

#Set Menu

select food in pizza burger salad pasta exit
do
   echo "You've Selected $food"

	case $food in
	    pizza)
		echo "Pizza is not healthy. It has more than 100KCal/byte"
		;;
	    burger)
		echo "Oh Man! Burger is not good here :-)"
		;;
	    salad)
		echo "Yo Yo.... Salad is  Good for Health"
		;;
	    pasta)
		echo "Pasta isn't bad"
		;;
	    exit)
		echo "Bye !"
		break # exit
		;;
	    *)
		echo "please Try Again"
		;;
	esac
done
