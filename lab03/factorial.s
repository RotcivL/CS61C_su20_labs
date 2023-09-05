.globl factorial

.data
n: .word 8

.text
main:
    la t0, n
    lw a0, 0(t0)
    jal ra, factorial

    addi a1, a0, 0
    addi a0, x0, 1
    ecall # Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10
    ecall # Exit

# c code
#if (n == 1) {
#        return 1
#    }
#   return factorial(n-1) * n
factorial:
    # YOUR CODE HERE
    # check for base case n == 1
    li t0, 1
    beq a0, t0, end  # jump to end if n == 1, a0=1 already

    # prologue save retaddr, current n
    addi sp, sp, -8
    sw ra, 4(sp)
    sw a0, 0(sp)

    # recursive call
    addi a0, a0, -1
    jal ra, factorial

    # epilogue
    lw t0, 0(sp)  # get n
    lw ra, 4(sp)
    addi sp, sp, 8

    # factorial(n-1)*n
    mul a0, a0, t0
end:
    ret