.text 
main:
	add $v0, $zero, 5
	syscall
	add $t0, $zero, $v0
	add $v0, $zero, 5
	syscall
	add $t1, $zero, $v0
	mult  $t0, $t1
	add $v0, $zero, 1
	mfhi $a0
	syscall
	mflo $a0
	syscall
	add $v0, $zero, 10
	syscall
