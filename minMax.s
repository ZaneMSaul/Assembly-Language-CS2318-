#Mason Currie

Input:
.data

array: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

request: .asciiz "\n Enter 1 to find minimum value stored in array or 2 to find maximum value in array. "

.text

.globl main #declares global

main:

la $s0,array #loads array

addi $t1,$0,0 #initialize values min and incrementation

lw $t2,0($s0)   

addi $t3,$0,1

li $v0, 4 #prints the user instruction

la $a0,request

syscall

li $v0, 5 #gets the integer

syscall

move $t0, $v0

beq $t0,1,minimum #verifies the value

beq $t0,2,maximum

j main

swapmin: #swapping for minimum value

move $t2,$t1

j minimum

swapmax: #swapping for maximum value

move $t2,$t1

j maximum

minimum: # loop to find minimum

bgt $t3,10,r #checks condition

lw $t1,0($s0)

blt $t1,$t2,swapmin #swaps valueif it is minimum

addi $t3,$t3,1

addi $s0,$s0,4

ble $t3,10,minimum

maximum: #loop to find maximum

bgt $t3,10,r

lw $t1,0($s0)

bgt $t1,$t2,swapmax #swaps value if it is maximum

addi $t3,$t3,1

addi $s0,$s0,4

ble $t3,10,maximum   

r:

li $v0,1 #prints the value

la $a0,($t2)

syscall

li $v0,10 #terminates the program

syscall