#li $t2, 10
#add $t1, $t2, 2
#li $v0, 1
#move $a0, $t1
#syscall

.data
numPrompt: .asciiz "How many numbers? (N)"
multiplier: .asciiz "\nMultiplier? (y)"
sumText: .asciiz "\nSum = "
	.text
main:	li $v0, 4 #allow output string
	la $a0, numPrompt
	syscall
	li $v0, 5 #allow input integer
	syscall
	move $t0, $v0 #move input value of N into $t0
	
	li $v0, 4 #allow output string
	la $a0, multiplier
	li $v0, 5 #allow input integer
	syscall
	move $t1, $v0 #move input value of y into $t1
	
	syscall
	
	
