move 	$t0, $a0		## initializing value $t1/a
	move 	$t1, $a1		## initializing value $t2/b
	li 	$t4, 1			## initializing BEQ 
	sub 	$t5, $a1, $t4
	
	loop2:
	beq 	$t1, $t4, Exit
	sw 	$t0, 0($sp)
	sub 	$t1, $t1, $t4
	sw 	$t1, 4($sp)
	addi 	$sp, $sp, 8
	j loop2
	
	Exit:
		move $t3, $0
		beq $t5, $0, return
		
		Loop:
			sub $sp, $sp, 8
			lw $t0, 0($sp)
			lw $t1, 4($sp)
			add $t3, $t3, $t0
			beq $t1, $t5 return
			j Loop
		return:
			add $t3, $t3, $t0
			sw $t3, 0($sp)