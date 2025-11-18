.globl main

.data
	x: .word 5
	n: .word 3
	
.text
main:
	lw $s0, x
	lw $s1, n
	
	jal potega
	move $a0, $v0
	li $v0, 1
	syscall
	
	
	li $v0,10
	syscall
	
potega:
	li $t0, 1	# temp = 1
	li $t1, 1	# i = 1
	addi $t6, $s1, 1	# n + 1
loop:
	bge $t1, $t6, koniec_programu
	mul $t0, $t0, $s0
	addi $t1, $t1, 1
	j loop
koniec_programu: move $v0, $t0
		 jr $ra
