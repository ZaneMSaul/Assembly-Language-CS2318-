#####################################################################################
#	Functional Description: Main program to test Factorial function
#	Enter a negative number to terminate run
#####################################################################################

		.data
		.align		2
jumptable: 	.word top, case1, case2, case3
prompt:		.asciiz		"\n\n Please enter a value between 1 and 3: "
msg:		.asciiz		" N factorial is:  "
bye: 		.asciiz		"  \n *** Good-Bye  ***"
	.text

main: addi $s0,0xFF
top:
      li $v0, 4 		# Code to print a string
      la $a0, prompt
      syscall
      li $v0, 5 		# Code to read an integer
      syscall
      blez $v0, top 		# Default for less than one
      li $t3, 3
      bgt $v0, $t3, top 	# Default for greater than 3
      la $a1, jumptable 	# Load address of jumptable
      sll $t0, $v0, 2 		# Compute word offset
      add $t1, $a1, $t0 	#Form a pointer into jumptable
      lw $t2, 0($t1) 		# Load an address from jumptable
      jr $t2 			# Jump to specific case “switch”
case1: sll $s0, $s0, 1 		# Shift left logical one bit
      b output
case2: sll $s0, $s0, 2 		# Shift left logical two bits
      b output
case3: sll $s0, $s0, 3 		# Shift left logical three bits
output:
      li $v0, 1 		# Code to print an integer is 1
      move $a0, $s0 	# Pass argument to system in $a0
      syscall 			# Output
      b  top
