.data
Request: .asciiz "Using values between 1 and 255 please do the following: \n"
input1: .asciiz "\nEnter a value to be multiplied: "
input2: .asciiz "Enter a value to multiply with: "
endl: .asciiz "\n"
results: .asciiz "\nResult: "

.text

main:
addi $sp, $sp, -4
li $t0, 256

reinput:

li $v0, 4			## code to print string
la $a0, Request			## loading string to print
syscall

li $v0, 4			## code to print string
la $a0, input1			## loading string to print
syscall

li $v0, 5
syscall
move $t1, $v0

li $v0, 4			## code to print string
la $a0, input2			## loading string to print
syscall

li $v0, 5
syscall
move $t2, $v0

bge  $t1, $t0, reinput
bge $t2, $t0, reinput
ble $t1, $0, reinput
ble $t2, $0, reinput

sw $t1, 4($sp)
sw $t2, 8($sp)
jal rmult

li $v0, 4			## code to print string
la $a0, results			## loading string to print
syscall

li $v0, 1
lw $a0, 12($sp)
syscall

li $v0, 10
syscall
	
rmult:					## beginning loop 1 (build stacks)
### construct stack
	lw	$t1, 4($sp)		## loads multiplicand
	lw	$t2, 8($sp)		## loads multiplier
	addi	$sp, $sp, 16		## allocates new space
	sw 	$ra, 0($sp)		## Return address
	sw 	$t1, 4($sp)		## multiplicand
	li	$t0, 1
	sub 	$t0, $t2, $t0		## decriments multiplier
	sw 	$t0, 8($sp)		## multiplier
	li 	$t0, 1

### Function Controller
	bne 	$t2, $t0, deconstruct	## kill switch
	b exit
	deconstruct:			## deconstruct stack
	jal rmult			## Loop control (end loop1/ begin loop2)
### End Function Controller

### deconstruct stack
	lw $ra, 0($sp)			## loads return address
	lw $t1, 4($sp)			## loads multiplicand
	lw $t2, 12($sp)			## loads result
	add $t1, $t1, $t2		## adds result and multiplicand
exit:
	sub 	$sp, $sp, 16		## Deconstructs stack
	sw	$t1, 12($sp)		## result
	jr $ra				## returns to main or deconstruct
	