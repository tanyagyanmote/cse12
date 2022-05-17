##########################################################################
# Created by: Gyanmote, Tanya
#             tgyanmot@ucsc.edu
#             8 May 2022
#        
# Assignment: Lab 3: Looping in RISC-V Assembly
#             CSE 12, Computer Systems and Assembly Language
#             UC Santa Cruz, Spring 2022
#
# Description: In this lab, the user enters a number, with the number the program will print out a pattern with numbers and stars (asterisks) and dollar signs ($).
#
# Notes: This program is intended to be run from the MARS IDE.
##########################################################################

#######################		PSEUDOCODE:
#
# Accepts a number greater than 0 from the user and rejects any unacceptable input with an error message and a repeated prompt
# Given the input N, print a a pattern with numbers and stars (asterisks) and dollar signs ($).
# 		 $1
#                $*$3
#                $*$*$5
#                $*$*$*$7
#                $*$*$*$*$9
#
# loop:
# 	Print the input prompt
#	Take the input
#	Break the loop if the input is greater than 0 
#
#	Print the error message
#
# loop:
#	having a loop for just the first row, to print out $1
#
# loop: 
#	having a outer loop for the $ and number right after
#
# loop:
#	printing one line by line
#	having a register to keep track of the odd sequence of numbers
#	creating a code with the logic of printing out a certain number of $* combinations for the rows
#
#	loop:
#		Using a register to store a counter so check when t3 is 0 and when it is it goes to a new row
#	
#	if there are no more lines to print, the loop should be broken
#
# ecall 10 to exit
#
#
#######################		REGISTERS:

# t0: userinput, with the number
# t1: counter for the outer block and will check if the first row has been created
#     also is used in the first block to check on the first row
# t2: has the sequence of the odd numbers
# t3: the counter for the inner loop


.macro print_str(%string1)  #macro to print any string
	li a7,4 
	la a0, %string1
	ecall
	.end_macro
.data
                           #in the data section of the memory
	prompt: .asciz "Enter the height of the pattern (must be greater than 0):"
	invalid: .asciz "Invalid Entry!\n"
	newline: .asciz "\n" 	
	
.text 				

	
main: 
	j input             #starts from here jumping to input block
	
		
input:
	li a7,4 
	la a0, prompt      #calls the prompt, "Enter the height of the pattern(must be greater than 0): "
	ecall              #executes the system call
	
	li a7, 5           #a0 now contains user input n1
	ecall 	
	
	addi t0, a0, 0     #t0 = a0 + 0, a0 copied to t0
	ble t0,zero,error  #makes sure the input is greater than zero and if not the error message will print and go to error which calls input again
	
	li t1,0             
	li t2,1
		

outer:
	beqz t1, first     #checking if t1 is equal to 0, if 0 then it goes to the first block which is for the first row
	addi t2,t2,2	   #adding 2 to t2, starting from 1 so adding 2 everytime gives us a sequence of odd numbers	

mv t3,t1

inner:
	li a7,11           #these next lines print out the $ and the *                 
	li a0,36           #36 is for the $
	ecall              #42 is for the *
	li a7,11
	li a0,42
	ecall
	addi t3,t3,-1      #this is counter, so after every line it will subtract one from itself
	bgtz t3, inner     #checking if counter is greater than 0,so once it reaches 0, goes to the next

first:
	li a7,11           #this will print the $ right before the number
	li,a0,36           
	ecall
	
	li a7,1            #this prints out the number that comes before the $
	mv a0,t2           
	ecall
	
	li a7,4            
	la a0, newline
	ecall
	
	addi t1,t1,1      #adding 1 to t1
	blt t1,t0, outer  #checking if t1 is less than t0 and if it is it will go to outer 

exit:                      #exit block to exit program
	li a7, 10
	ecall

error:                     #error message if input is less than 0
	print_str(invalid) #prints the message
	j input            #goes back to input to enter another number

	

	
