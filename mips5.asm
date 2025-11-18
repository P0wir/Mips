.globl main

.data
	x: .word 2137
	n: .word 5

.text
main:
	lw $a0, x
	lw $a1, n
	
	jal potega
	move $a0, $v0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
potega:
	bne $a1, $zero, jesli_niezero
	li $v0, 1
	jr $ra
jesli_niezero:
	addi $sp, $sp, -4
	sw $ra, 0($sp) 
	addi $a1, $a1, -1
	jal potega
	move $v0, $v0
	mul $v0, $a0, $v0
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	

