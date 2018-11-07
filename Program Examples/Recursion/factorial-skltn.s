#####################################################################################
#	Functional Description: Main program to test Factorial function
#	Enter a negative number to terminate run
#####################################################################################

		.data
		.align		2

		.text
main:		addiu		$sp,  $sp,  -8	# Allocate space
mloop:

		li		$v0,  4		# Get value for N

		sw		$v0, 0 ($sp)
		jal		Fac		# Call factorial
		or		$v1,  $v0, $0
		addiu		$sp,  8		# Deallocate space

		li		$v0,  10
		syscall
#####################################################################################
# Functional Description: Recursive Factorial Fac  (N:  in,  N! :out)
#####################################################################################
Fac:
	lw		$a0,   0 ($sp)


	addiu		$sp,   $sp,   -16	#   Allocate	
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

