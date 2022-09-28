#<------------------ MACRO DEFINITIONS ---------------------->#
        # Macro : print_str
        # Usage: print_str(<address of the string>)
        .macro print_str($arg)
	li	$v0, 4     # System call code for print_str  
	la	$a0, $arg   # Address of the string to print
	syscall            # Print the string        
	.end_macro
	
	# Macro : print_int
        # Usage: print_int(<val>)
        .macro print_int($arg)
	li 	$v0, 1     # System call code for print_int
	li	$a0, $arg  # Integer to print
	syscall            # Print the integer
	.end_macro
	
	# Macro : read_int
	# Usage : read an integer value from STDIO into the given register
	.macro read_int($reg)
	li     $v0, 5        # System call code
	syscall            # executes system call
	move   $reg, $v0   # integer stored in specified register
	.end_macro
	
	# Macro : print_reg_int
	# Usage : print integer value given in STDIO
	.macro print_reg_int($reg)
	li     $v0, 1       # system call code
	move   $a0, $reg  # integer to print
	syscall           # print integer
	.end_macro
	
	# Macro : swap_hi_lo 
	# Usage : swap Hi and Lo values using temporary registers
	.macro swap_hi_lo ($temp1, $temp2)
	mfhi $temp1  # hi value -> temp var 1
	mflo $temp2   # lo value -> temp var 2
	mthi $temp2   # switch values using temp var 1
	mtlo $temp1   # switch values using temp var 2
	syscall
	.end_macro
	
	# Macro : print_hi_lo 
	# Usage: prints Hi and Lo values using format "Hi = <val>, Lo = <val>"
	.macro print_hi_lo ($strHi, $strEqual, $strComma, $strLo) 
	li	$v0, 4     # System call code for print_str  
	la	$a0, $strHi  # Address of the string to print
	syscall            # Print the string   
	
	li	$v0, 4     # System call code for print_str  
	la	$a0, $strEqual   # Address of the string to print
	syscall            # Print the string   
	
	#print hi val
	li 	$v0, 1     # System call code for print_int
	mfhi	$a0  # Integer to print
	syscall 
	
	li	$v0, 4     # System call code for print_str  
	la	$a0, $strComma   # Address of the string to print
	syscall            # Print the string        
	
	li	$v0, 4     # System call code for print_str  
	la	$a0, $strLo   # Address of the string to print
	syscall            # Print the string                                  
	
	li	$v0, 4     # System call code for print_str  
	la	$a0, $strEqual   # Address of the string to print
	syscall            # Print the string    
	
       #print low val
        li 	$v0, 1     # System call code for print_int
	mflo	$a0        # Integer to print
	syscall 
	.end_macro
	
	# Macro : lwi 
	# Usage : takes two 16-bit immediate values and puts them into higher bits and lower bits of $reg
	.macro lwi ($reg, $ui, $li) 
	lui  $reg, $ui #loads higher order bits in $reg
	ori  $reg, $reg, $li #loads lower order bits in $reg
	.end_macro
	
	# Macro : push
	# Usage : Push data in register $reg into stack.
	.macro push($reg)
	sw $reg, 0x0($sp) #stores data
	addi $sp, $sp, -4 #decreases stack pointer by 4
	.end_macro
	
	# Macro : pop
	# Usage : Pop from stack into $reg
	.macro pop($reg)
	addi $sp, $sp, +4 # increases stack pointer by 4
	lw $reg, 0x0($sp) #loads contents of stack into $reg
	.end_macro
	    
	# Macro : exit
        # Usage: exit
        .macro exit
	li 	$v0, 10 
	syscall
	.end_macro
	
