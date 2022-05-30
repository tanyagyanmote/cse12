#in this section of code, you must direct the new position of the pixel based on the label we branched to in lab4.asm

#remember at this point, (x,y) coordinates are in a0,a1 registers respectively
#do the appropriate change in a0 a1 values based on the labels below.

#within each label, make sure to jump to the correct label in  lab4.asm file. 
#This is so that exactly one of the labels moveleft,moveright, movedown, moveup is executed depending on which key user enetered as defined in lab4.asm

#NOTE: To make sure you ONLY use a0,a1 registers in your instructions below. There is no need to involve any other rgeister in this section of code!

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
# Part two of the program uses the keyboard and display MMIO simulator to be able to move the pixel left,right,up,down,and diagonally
# 
# Step one, is to create directions to move the pixel point up,down,left,right,and diagonally
#######################		REGISTERS:

# a0: is the x coordinate of user input 
# a1: is the y coordinate of user input

moveleft:
	#enter code here
	addi a0, a0, -1 	#to move the left you have to move the x value by -1
	b newPosition		#branch change bitmap display with updated (x,y) values 
	
	
movedown:
	#enter code here
	addi a1, a1, 1		#to move the down you have to move the y value by 1
	b newPosition		#branch change bitmap display with updated (x,y) values 
	
		
moveright:
	#enter code here	
	addi a0, a0, 1		#to move the down you have to move the x value by 1
	b newPosition		#branch change bitmap display with updated (x,y) values 
	
moveup:
	#enter code here
	addi a1, a1, -1		#to move the down you have to move the y value by -1
	b newPosition		#branch change bitmap display with updated (x,y) values
	
	
moveDiagonalLeftUp:
	#enter code here
	addi a0, a0, -1		#to move the diagonal left up you have to move the x value by -1
	addi a1, a1, -1		#to move the diagonal left up you have to move the y value by -1
	b newPosition		#branch change bitmap display with updated (x,y) values
 	
moveDiagonalLeftDown:

	#enter code here
 	addi a0, a0, -1		#to move the diagonal left down you have to move the x value by -1
	addi a1, a1, 1		#to move the diagonal left down you have to move the y value by 1
	b newPosition		#branch change bitmap display with updated (x,y) values
	
moveDiagonalRightUp:

	#enter code here
	addi a0, a0, 1		#to move the diagonal right up you have to move the x value by 1
	addi a1, a1, -1		#to move the diagonal right up you have to move the y value by -1
	b newPosition		#branch change bitmap display with updated (x,y) values

moveDiagonalRightDown:

	#enter code here
	addi a0, a0, 1		#to move the diagonal right down you have to move the x value by 1
	addi a1, a1, 1		#to move the diagonal right down you have to move the y value by 1
	b newPosition		#branch change bitmap display with updated (x,y) values
