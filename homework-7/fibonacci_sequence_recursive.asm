
caller:		addi 	$a0, $zero, 15		# initialize argument register $a0 with n = 15
		jal	fib_seq			# call fib_seq
next:		j	exit

##############################################################################
# This routine generates Fibonacci sequence fib(0), fib(1), fib(2), ... fib(n)
# and stores it into the data segment starting at address 0x10010000

fib_seq:	lui $t1, 0x1001		#upper part of address 0x10010000
		addi $t2,$0,0 		#int a = 0
		move $t3,$a0 		#int n = arg
		
loop:		bgt $t2,$t3,exit 	# if a > n then exit
		move $a0,$t2 		# arg1 = a
		addi $sp,$sp,-8		# make room on stack
		sw $t2, 4($sp)		# push $t2
		sw $t1, 0($sp)		# push $t1
		jal fib			# call fib procedure
		lw $t2, 4($sp)		# pop $t2
		lw $t1,0($sp)		# pop $t1
		sw $v0,0($t1)		# save returned value v0 into regtister $t1
		addi $sp,$sp,8		# restore sp
		addi $t1, $t1, 4	# pc+4
		addi $t2,$t2,1		# iterator++
		j loop			# loop continue
		


####################### Insert Your Code Here ################################
fib:		addi 	$sp, $sp, -12		# make room on stack
		sw 	$ra, 8($sp) 		# push $ra
		sw 	$s0, 4($sp)		# push $s0
		sw 	$a0, 0($sp)		# push $a0 (N)
		slt	$at,  $0, $a0
		bne	$at,  $0, test2		# if n>0, test if n=1
		addi    $v0, $0,0  		# else fib(0) = 0
		j 	rtn 			#

test2: 		addi 	$t0, $0, 1 		# test if n=1
		bne 	$t0, $a0, gen 		# if n>1, gen
		addi	$v0, $0,1  		# else fib(1) = 1
		j 	rtn

gen: 		
		addi 	$a0, $a0, -1 		# n-1
		jal 	fib			# call fib(n-1)
		add 	$s0, $v0, $0 		# copy fib(n-1))
		addi 	$a0, $a0, -1 		# n-2
		jal 	fib			# call fib(n-2)
		add     $s1,$v0,$0
		add 	$v0, $s1, $s0 		# fib(n-1)+fib(n-2)

rtn: 		
		lw 	$a0, 0($sp)		# pop $a0
		lw 	$s0, 4($sp) 		# pop $s0
		lw 	$ra, 8($sp) 		# pop $ra
		addi 	$sp, $sp, 12		# restore sp
		jr 	$ra
##############################################################################

exit:		
