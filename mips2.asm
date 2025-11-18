.data
	a: .word 3
	b: .word 2
	D: .word 1,2,3,4,5,6,7,8,9
	
	

.text
	lw $s0, a
	lw $s1, b
	la $s2, D
	li $t0, 0
	li $t1, 0
	
outer_loop:
	bge $t0, $s0, koniec_i
	j inner_loop
inner_loop:
	bge $t1, $s1, koniec_j
	add $t2, $t0, $t1
	sll $t3, $t1, 4
	add $t4, $t3, $s2
	sw $t2, 0($t4)
	addi $t1, $t1, 1
	j inner_loop
koniec_j: addi $t0, $t0, 1
	  li $t1, 0
	  j outer_loop
koniec_i: li $v0, 10
	  syscall
	