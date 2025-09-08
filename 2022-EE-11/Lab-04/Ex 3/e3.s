.section .text
.globl _start
.globl divide

_start: 
        li a0, 57       # Dividend
        li a1, 10       # Divisor

        jal divide      # I jump to divide

        mv t0, a0
        mv t1, a1
    
    # Code to exit for Spike (DONT REMOVE IT)
   	li t0, 1
	la t1, tohost
	sd t0, (t1)

divide:

    mv t0, a0
    mv t1, a1

    li t2, 0    # remainder
    li t3, 32   # counter

loop: 

    slli t2, 1  # Logical left Shift
    srlw t4, t0, 31 # Right shift Logical
    or t2, t2, t4 # Giving the MSB to A.
    slli t0, 1 # Q << 1

    bltz t2, add_set
    bgez t2, sub_set

    subi t3, 1
    beqz t3, rem

add_set:
    add t2, t2, t1
    # Q's LSB remains 0
    ret

sub_set:
    sub t2, t2, t1
    ori t0, 1
    ret

rem:
    bltz t2, add_set

# Loop forever if spike does not exit
1: j 1b

.section .tohost
.align 3
tohost: .dword 0
fromhost: .dword 0


