
#Note that this file only contains a function xyCoordinatesToAddress
#As such, this function should work independent of any caller funmction which calls it
#When using regisetrs, you HAVE to make sure they follow the register usage convention in RISC-V as discussed in lectures.
#Else, your function can potentially fail when used by the autograder and in such a context, you will receive a 0 score for this part

##########################################################################
# Created by: Gyanmote, Tanya
#             tgyanmot@ucsc.edu
#             28 May 2022
#        
# Assignment: Lab 4: Paint Application
#             CSE 12, Computer Systems and Assembly Language
#             UC Santa Cruz, Spring 2022
#
# Description: This lab will create a tiny "Paint" application that will operate on our RISC-V computer emulator. 
# This program will utilize keyboard input to make patterns on a Bitmap display. A bitmap "maps" a bit pattern to 
# a particular color for display. When we pull that value over a display unit, the address where we keep this color 
# value functions effectively as a "pixel." A beginning pixel coordinate will be specified by the user. Then, using 
# the w, a, s, and d keys, you may draw straight lines in the left and right directions. Directions are up and down. 
# They may also draw diagonally by hitting the q, c, e, and z keys.
#
# Notes: This program is intended to be run from the MARS IDE.
##########################################################################

#######################		PSEUDOCODE:
#
# Part one of the program takes a useripnut from the coordinate range of 0-31 for a x and y coordinate. Then will graph the dot using Bitmap display.
# 
# Step one, find a pattern and create and equation to convert a coordinate to it's pizel address
# Formula for the pixel address = base address + ((row * row size) + column)
# 
#######################		REGISTERS:

# a0: is the x coordinate of user input 
# a1: is the y coordinate of user input
# a2: contains the base address



xyCoordinatesToAddress:
	#(x,y) in (a0,a1) arguments
	#a2 argument contains base address
	#returns pixel address in a0
	
	#make sure to return to calling function after putting correct value in a0!
	#Enter code below!DO NOT MODIFY ANYTHING BEFORE THIS COMMENT LINE!
	
    	slli	a0, a0, 2	#a0, which is x is shifting left by 2 because to shift left over a bit map, its 4 bits so 2^n=4, n=2
    	slli 	a1, a1, 7	#a1, which is y is shifting left by 7, 
    	add 	a0, a0, a1	#adding together the value of a0,a1 from the equation above
    	add 	a0, a0, a2	#adding that total to the base address so I can get the pixel address
    
    	ret			#control is transferred to the return address



	
