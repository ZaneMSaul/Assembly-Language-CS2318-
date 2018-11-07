{\rtf1\ansi\ansicpg1252\cocoartf1561\cocoasubrtf400
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 .data\
Average: .asciiz "Average: "\
MinIndex: .asciiz "Index for Minimum: "\
MinValue: .asciiz "Minimum value: "\
MaxIndex: .asciiz "Max Index: "\
MaxValue: .asciiz "Maximum value: "\
endl: .asciiz "\\n"\
				## Initialize qrray\
array: .word 1, 1, 2, 3, 9, 9, 6, 0, 1, 1, 7\
\
.text\
\
main:\
\
li $s0, 10\
la $t0, array\
\
jal function\
\
li $v0, 4			## code to print string\
la $a0, Average			## loading string to print\
syscall\
\
addi $sp, $sp, -4		## Changes pointer at top of stack to top value\
lw $a0, 0($sp)			## Loads value at top of stack to $a0\
li $v0, 1			## Code to print\
syscall\
\
li $v0, 4			## code to print string\
la $a0, endl			## loading string to print\
syscall\
\
li $v0, 4			## code to print string\
la $a0, MinIndex		## loading string to print\
syscall\
\
addi $sp, $sp, -4		## Changes pointer at top of stack to top value\
lw $a0, 0($sp)			## Loads value at top of stack to $a0\
li $v0, 1			## Code to print\
syscall\
\
li $v0, 4			## code to print string\
la $a0, endl			## loading string to print\
syscall\
\
li $v0, 4			## code to print string\
la $a0, MinValue		## loading string to print\
syscall\
\
addi $sp, $sp, -4		## Changes pointer at top of stack to top value\
lw $a0, 0($sp)			## Loads value at top of stack to $a0\
li $v0, 1			## Code to print\
syscall\
\
li $v0, 4			## code to print string\
la $a0, endl			## loading string to print\
syscall\
\
li $v0, 4			## code to print string\
la $a0, MaxIndex		## loading string to print\
syscall\
\
addi $sp, $sp, -4		## Changes pointer at top of stack to top value\
lw $a0, 0($sp)			## Loads value at top of stack to $a0\
li $v0, 1			## Code to print\
syscall\
\
li $v0, 4			## code to print string\
la $a0, endl			## loading string to print\
syscall\
\
li $v0, 4			## code to print string\
la $a0, MaxValue		## loading string to print\
syscall\
\
addi $sp, $sp, -4		## Changes pointer at top of stack to top value\
lw $a0, 0($sp)			## Loads value at top of stack to $a0\
li $v0, 1			## Code to print\
syscall\
\
li $v0, 4			## code to print string\
la $a0, endl			## loading string to print\
syscall\
\
li $v0, 4			## code to print string\
la $a0, MaxIndex		## loading string to print\
syscall\
\
addi $sp, $sp, -4		## Changes pointer at top of stack to top value\
lw $a0, 0($sp)			## Loads value at top of stack to $a0\
li $v0, 1			## Code to print\
syscall\
\
li $v0, 4			## code to print string\
la $a0, endl			## loading string to print\
syscall\
\
li $v0, 4			## code to print string\
la $a0, MaxValue		## loading string to print\
syscall\
\
addi $sp, $sp, -4		## Changes pointer at top of stack to top value\
lw $a0, 0($sp)			## Loads value at top of stack to $a0\
li $v0, 1			## Code to print\
syscall\
\
li $v0, 4			## code to print string\
la $a0, endl			## loading string to print\
syscall\
\
li $v0,10\
syscall\
\
function:\
\
la $s1, ($ra)\
\
## passing in $s0, $s2\
lw $t1, 0($t0)			## setting $t1 to an intial value in array\
lw $t2, 0($t0)			## setting $t2 to an intial value in array\
li $t3, 0			## setting $t3/MIN to 0\
li $t4, 0			## setting $t4/MAX to 0\
li $t5, 0			## setting $t5/AVG to 0\
li $t6, 0			## setting $t6/TOT to 0\
\
## For loop begins HERE\
\
li $t7, 0			## setting int i = 0\
Loop1:\
	beq $s0, $t7, Exit1	## Exit condition/ End Loop\
	\
	sll $t8, $t7, 2		## creating offset of 4 into $t8 using index\
	add $t8, $t8, $t0	## storing index location into $t8 using address of array\
	lw $t8, 0($t8)		## store word into $t8\
	\
	add $t6, $t6, $t8	## builds a running total\
	\
	bgt $t8, $t1, IfGreater\
	blt $t8, $t2, IfLess\
	\
	Return:\
	addi $t7, $t7, 1	## Loop Post incriment\
	j Loop1			## reinter loop\
	\
IfGreater:\
	move $t1, $t8		## store the greater number\
	j Return		## return to loop\
IfLess:\
	move $t2, $t8		## store the lesser number\
	j Return		## return to loop\
IfMax:\
	sw $t8, 0($sp)		## store Max value to top of stack\
	sw $t7, 4($sp)		## store I/index value to top of stack\
	addi $sp, $sp, 8	## point to top of stack\
	j Return2\
IfMin:\
	sw $t8, 0($sp)		## store Min value to top of stack\
	sw $t7, 4($sp)		## store I/index value to top of stack\
	addi $sp, $sp, 8	## point to top of stack\
	j Return3\
Exit1:\
\
move $t4, $t1			## store Max value\
move $t3, $t2			## store Min value\
\
li $t7, 0			## reset loop counter\
Loop2:\
	beq $s0, $t7, Exit2	## Exit loop condition\
	\
	sll $t8, $t7, 2		## creating offset of 4 into $t8 using index\
	add $t8, $t8, $t0	## storing index location into $t8 using address of array\
	lw $t8, 0($t8)		## store word into $\
	\
	beq $t8, $t4, IfMax\
	Return2:\
	beq $t8, $t3, IfMin\
	Return3:\
	\
	addi $t7, $t7, 1	## Post incriment counter for loop\
	j Loop2			## return to loop\
Exit2:\
\
div $t6, $s0			## Finds average $t5 = $t6 / $s0\
mfhi $t5\
sw $t5, 0($sp)			## stores average to top of stack\
addi $sp, $sp, 4		## points to top of stack\
\
la $ra, ($s1)\
jr $ra				## Leaves function/ Returns to main\
}