	addi	$t0, $zero, 5	# Instruction 00 --> Address (00 + x"00400000") = x"00400000"
	addi	$t1, $zero, 7	# Instruction 01 --> Address (04 + x"00400000") = x"00400004"
start:	sw	$t0,  0($sp)	# Instruction 02 --> Address (08 + x"00400000") = x"00400008"
	sw	$t1, -4($sp)	# Instruction 03 --> Address (12 + x"00400000") = x"0040000C"
	lw	$s0,  0($sp)	# Instruction 04 --> Address (16 + x"00400000") = x"00400010"
	lw	$s1, -4($sp)	# Instruction 05 --> Address (20 + x"00400000") = x"00400014"
	beq	$s0, $s1, Else	# Instruction 06 --> Address (24 + x"00400000") = x"00400018"
	add	$s3, $s0, $s1	# Instruction 07 --> Address (28 + x"00400000") = x"0040001C"
	j	Exit		# Instruction 08 --> Address (32 + x"00400000") = x"00400020"
Else:	sub	$s3, $s0, $s1	# Instruction 09 --> Address (36 + x"00400000") = x"00400024"
Exit:	add	$s0, $s0, $s3	# Instruction 10 --> Address (40 + x"00400000") = x"00400028"
	or	$s1, $s1, $s3	# Instruction 11 --> Address (44 + x"00400000") = x"0040002C"
	addi	$t0, $t0,  3	# Instruction 12 --> Address (48 + x"00400000") = x"00400030"
	addi	$t1, $t1,  3	# Instruction 13 --> Address (52 + x"00400000") = x"00400034"
	addi	$sp, $sp, -8	# Instruction 14 --> Address (56 + x"00400000") = x"00400038"
        j	start		# Instruction 15 --> Address (60 + x"00400000") = x"0040003C"
