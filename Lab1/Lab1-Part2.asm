.data
inputText: .space 50 #up to 50 character allowed
inputPrompt: .asciiz "Input a string of up to 50 characters: "
.text

li $v0, 4
la $a0, inputPrompt
syscall #output instructions

la $a0, inputText
li $a1, 50 #allow up to 50 characters
li $v0, 8
syscall #input the string

move $s0, $a0 #move the string into s0

jal STR_LEN #get the string length
addi $s0, $s0, -1 #eliminate null character
addi $v1, $v1, -1 #decrement length to correspond with elimination of removal of null character
jal REVERSE #print the string backwards
li $v0, 10
syscall #end program

STR_LEN:
	lb $a0, 0($s0) #load current character into a0 from the string
	beqz $a0,RETURN #if current character is null character then return
	addi $s0, $s0, 1 #iterate through string
	addi $v1, $v1, 1 #counter for length
	j STR_LEN #loop back again

RETURN: 
	jr $ra #return to main

REVERSE: 
	addi $s0, $s0, -1 #iterate through string backward by decrementing
	addi $v1, $v1, -1 #decrement counter
	lb $a0, 0($s0) #load current character into a0
	li $v0, 11 #allow output character
	syscall #output string backward one character at a time
	beqz $v1, RETURN #return to main if counter is down to 0
	j REVERSE #loop through reverse printing	
