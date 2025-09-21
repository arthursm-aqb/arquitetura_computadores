.text 
main:
	add $v0, $zero, 5
	syscall
	add $t0, $zero, $v0
	add $t1, $zero, $t0
	mult $a0, $t0, $t1
	add $v0, $zero, 1
	syscall