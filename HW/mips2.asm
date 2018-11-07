.data
Request: .asciiz "Using values between 1 and 255 please do the following: \n"
input1: .asciiz "\nEnter a value to be multiplied: "
input2: .asciiz "Enter a value to multiply with: "
endl: .asciiz "\n"
results: .asciiz "\nResult: "

.text

main:
addi $sp, $sp, -4
li $s1, 1

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

blt $t1, $0, reinput
blt $t2, $0, reinput

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
	sub 	$t0, $t2, $s1		## decriments multiplier
	sw 	$t0, 8($sp)		## multiplier
### Function Controller
	beq	$t2, $0, ZEROPower
	bne 	$t2, $s1, deconstruct	## kill switch
	b exit
	deconstruct:			## deconstruct stack
	jal rmult			## Loop control (end loop1/ begin loop2)
### End Function Controller

### deconstruct stack
	lw $ra, 0($sp)			## loads return address
	lw $t1, 4($sp)			## loads multiplicand
	lw $t2, 12($sp)			## loads result
	mult $t2, $t1			## adds result and multiplicand
	mflo $t1
	mfhi $t0
	bne $t0, $0, Overflow
exit:
	sub 	$sp, $sp, 16		## Deconstructs stack
	sw	$t1, 12($sp)		## result
	jr $ra				## returns to main or deconstruct
ZEROPower:
	add $t1, $s1, $0
	j exit
Overflow:
	li $t1, -1
	j exit
	