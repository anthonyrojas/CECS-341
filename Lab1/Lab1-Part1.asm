.data
numPrompt: .asciiz "How many numbers? (N)"
multiplier: .asciiz "\nMultiplier? (y)"
sumText: .asciiz "\nSum = "
testText: .asciiz "Testing subroutine\n"	
	.text
	
MAIN:	li $v0, 4 #allow output string
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
	
	add $a0,$zero,$t0 #a0=N
	add $a1, $zero, $t1 #a1=y
	li $a2, 0
	#addi $a2, $zero, 0 #a2=i initalize with 1
	addi $a3, $zero, 0 #sum
	j SUMMATION #jump to summation
	
SUMMATION:
	addi $a2, $a2, 1 #increment i
	mul $t0, $a1, $a2 #t0=y*i
	add $a3, $a3, $t0 #sum of prod and current summation
	
	bne $a2, $a0, SUMMATION #if(i!=N) then loop summation algorithm
	j END
	
END:
	li $v0, 1
	move $a0, $a3
	syscall #output final sum
	
	li      $v0, 10              # terminate program run and
	syscall
