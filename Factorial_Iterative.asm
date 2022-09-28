.include "./cs47_macro.asm"

.data
msg1: .asciiz "Enter a number ? "
msg2: .asciiz "Factorial of the number is "
charCR: .asciiz "\n"

.text
.globl main
main:	print_str(msg1)
	read_int($t0)
	
# Write body of the iterative
# factorial program here
# Store the factorial result into 
# register $s0
#
# DON'T IMPLEMENT RECURSIVE ROUTINE 
# WE NEED AN ITERATIVE IMPLEMENTATION 
# RIGHT AT THIS POSITION. 
# DONT USE 'jal' AS IN PROCEDURAL /
# RECURSIVE IMPLEMENTATION.

	move $s0,$t0 #set $s0 to $t0
loop:
    sub $t0,$t0,1            #$t0 = $t0 - 1 
    blez $t0,end #if $t0 <= 0, exit loop
    mul $s0,$t0,$s0            #$s0 = $s0*$t0
    j loop                    #repeat
    
end:    print_str(msg2)
	print_reg_int($s0)
	print_str(charCR)
	
	exit
	
