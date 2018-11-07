.text
    li $a1, 100 
    li $v0, 42 
    syscall

main:

li $a3, 0xffff0000 
li $s1, 2

sw $s1, 0($a3) 

li $s1, 0x0000ffff 
mtc0 $s1, $12 

li $t0, 211 
li $t1, 3021377

loop:

mult $t0, $t1

mflo $t0

addiu $t0, $t0, 7780

beqz $v1, loop 

addiu $v1, $v1, -10

beqz $v1, quit 

li $v1, 100 

divu $t0, $v1

mfhi $a0 

li $v0, 1

quit:

li $v0, 10

syscall