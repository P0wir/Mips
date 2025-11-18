.globl main
.data
	a: .word 1
	b: .word 2
	c: .word 3
	d: .word 4
	

.text	
main:
	lw $a0, a
	lw $a1, b
	lw $a2, c
	lw $a3, d
	
	jal f
	move $a0, $v0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
func:
	add $v0, $a0, $a1
	jr $ra
	
f:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal func
	move $a0, $v0
	add $a1, $a2, $a3
	jal func
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
	