#####################################################################################
#	Functional Description: Main program to test Factorial function
#	Enter a negative number to terminate run
#####################################################################################

		.data
		.align		2
prompt:		.asciiz		"\n\n Give me a value for  \"N\" : "
msg:		.asciiz		" N factorial is:  "
bye: 		.asciiz		"  \n *** Good-Bye  ***"
		.text
main:		addiu		$sp,  $sp,  -8	#Allocate space
mloop:
		li		$v0,  4
		la		$a0,  prompt
		syscall
		li		$v0,  5		#Get value for N
		syscall
		bltz		$v0,  quit
		sw		$v0, 0 ($sp)
		jal		Fac		#  Call factorial

		li		$v0,  4		#  Print message
		la		$a0,  msg		
		syscall
		
		lw		$a0, 4($sp)		#Get result
		li		$v0,  1
		syscall				#Print factorial
		b		mloop
quit:
		addiu		$sp,  8		# Deallocate space
		li		$v0,  4
		la		$a0,  bye
		syscall
		li		$v0,  10
		syscall
#####################################################################################
# Functional Description: Recursive Factorial Fac  (N:  in,  N! :out)
#####################################################################################
Fac:
	lw		$a0,   0 ($sp)
	bltz		$a0,   Problem
	addi		$t1,   $a0,   -13
	bgtz		$t1,   Problem		#   13 is largest value we can
						#   accept
	addiu		$sp,   $sp,   -16		#   Allocate	
       	sw		$ra,   12 ($sp)		#   Save return address
     	sw		$a0,   8($sp)
       	slti		$t0,   $a0,  2		#   If N is 1 or 0,  then return the value 1
       	beqz		$t0,   Go
       	li		$v0,   1
       	b		facret
Go:
	addi		$a0,   $a0,   -1		#
	sw		$a0,   0 ($sp)		#   Pass N-1 to factorial function
	jal		Fac			#   Recursive call
	lw		$v0,   4($sp)		#   Get  (N-1)  !  back.
	lw		$ra,  12  ($sp)
	lw		$a0,  8 ($sp)
	mult		$v0,  $a0			#  N* (N-1)  !
	mflo		$v0
facret:
	addiu		$sp,  $sp,  16		#  Deallocate
	sw		$v0,  4 ($sp)
	jr		$ra
Problem:
	sw		$0,  4 ($sp)
	jr		$ra
