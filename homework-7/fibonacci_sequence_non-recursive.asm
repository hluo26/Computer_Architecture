
caller:		addi 	$a0, $zero, 15		# initialize argument register $a0 with n = 15
jal	fib_seq			# call fib_seq
next:		j	exit

##############################################################################
# This routine generates Fibonacci sequence fib(0), fib(1), fib(2), ... fib(n)
# and stores it into the data segment starting at address 0x10010000

fib_seq:	
####################### Insert Your Code Here ################################
	beq  $a0,$0,return0 	#if n=0,return fib(0)
	addi $t0,$0,1		#set $t0=1
	beq  $a0,$t0,return1	#if n=1,return fib(1)
	add $t1,$0,$0		#initialize sum of two fibs $t1 = 0
	add $t2,$0,$0		#initialize fib(n-2)=0
	addi $t3,$0,1		#initialize fib(n-1)=1
	addi $t4,$0,1		#initialize iterator from 1
	lui $t5, 0x1001		#upper part of address 0x10010000
	sw $t2,0($t5)		#when n>=2,save fib(0) in first data segment
	addi $t5, $t5, 4	#pc+4
	sw $t3,0($t5)		#when n>=2,save fib(1) in second data segment
	addi $t5, $t5, 4	#pc+4
	add $a0,$a0,-1		#corresponding with next bgt instruction

loop:	bgt $t4,$a0,exit	#if iterator>n, exit
	add $t1,$t2,$t3		#else,start loop,fib(n)=fib(n-1)+fib(n-2)
	move $t2,$t3   		#save fib(n-1) as the next fib(n-2)
	move $t3,$t1		#save fib(n) as the next fib(n-1)
	sw $t1,0($t5)		#save fib(n) in $t5
	addi $t4,$t4,1		#iterator++
	addi $t5, $t5, 4	#pc+4
	j loop
	

return1:addi $t1,$0,1		#when n=1,set $t1=1
	sw $t1,0($t5)		#save $t1 into $t5
	addi $t5, $t5, 4	#pc+4
	j exit			#exit
	
return0:addi $t1,$0,0		#when n=0,set $t1=0
	sw $t1,0($t5)		#save $t1 into $t5
	addi $t5, $t5, 4	#pc+4
	j exit			#exit

##############################################################################

exit:		
