#li $t2, 10
#add $t1, $t2, 2
#li $v0, 1
#move $a0, $t1
#syscall

.data
numPrompt: .asciiz "How many numbers? (N)"
multiplier: .asciiz "\nMultiplier? (y)"
sumText: .asciiz "\nSum = "
testText: .asciiz "Testing subroutine\n"	
	.text
	
main:	li $v0, 4 #allow output string
	la $a0, numPrompt
	syscall #output string
	li $v0, 5 #allow input integer
	syscall #input integer
	move $t0, $v0 #move input value of N into $t0
	
	li $v0, 4 #allow output string
	la $a0, multiplier
	syscall
	li $v0, 5 #allow input integer
	syscall #input integer
	move $t1, $v0 #move input value of y into $t1
	
	add $a0,$zero,$t0
	add $a1, $zero, $t1 
	jal summation #jump to summation
	
	li      $v0, 10              # terminate program run and
	syscall
summation:
	jr $ra
