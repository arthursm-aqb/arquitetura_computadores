.text 
main:
	addi $v0, $zero, 5
	syscall
	add $t0, $zero, $v0
	addi $v0, $zero, 5
	syscall
	add $t1, $zero, $v0
	add $t2, $t1, $t0
	addi $t3, $zero, 2
	divu $t2, $t3
	mflo $a0
	addi $v0, $zero, 1
	syscall
	addi $v0, $zero, 10
	syscall
	
