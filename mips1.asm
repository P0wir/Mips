.globl main

.data
	n: .word 1
	m: .word 1
.text
main: 
	lw $a0, n
	lw $a1, m
	
	jal tau
	move $a0, $v0
	li $v0, 1
	syscall
	

	li $v0, 10
	syscall
	
tau:
	li $t1, 1
	sllv $t1, $t1, $a0
	sll $t2, $a1, 1
	addi $t2, $t2, 1
	mul $t3, $t1, $t2
	addi $v0, $t3, -1
	jr $ra