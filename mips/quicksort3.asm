# quicksort.asm
# Jeron Lau
# Quicksort algorithm on an array of integers.
# Assembly Assignment Six.

.data
################################################################################
##################################### DATA #####################################
################################################################################

list_a: .word 9, 8, 7, 6, 5, 4, 3, 2, 1, 0
list_b: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 0
list_c: .word 5, 4, 6, 3, 7, 2, 8, 1, 0, 9
list_d: .word 9, 1, 7, 7, 6, 5, 4, 4, 2, 0

print_a: .asciiz "list_a: "
print_b: .asciiz "list_b: "
print_c: .asciiz "list_c: "
print_d: .asciiz "list_d: "

newline: .asciiz "\n"
comma: .asciiz ", "


.text
################################################################################
##################################### TEXT #####################################
################################################################################

# Entry point for program
main:
	# Put values on the stack.
	addi $sp, $sp, -4 # (1 registers * -4).
	sw $ra, 0 ($sp) # Return Address (ra).

	# Print list
#	la $a0, print_a
#	la $a1, list_a
#	addi $a2, $zero, 10
#	jal print_array

	# Print list
#	la $a0, print_b
#	la $a1, list_b
#	addi $a2, $zero, 10
#	jal print_array

	# Print list
#	la $a0, print_c
#	la $a1, list_c
#	addi $a2, $zero, 10
#	jal print_array

	# Print list
#	la $a0, print_d
#	la $a1, list_d
#	addi $a2, $zero, 10
#	jal print_array

	# Swap firsts and lasts in array a
#	la $a0, list_a
#	addi $a1, $zero, 0
#	addi $a2, $zero, 1
#	jal swap
#	la $a0, list_a
#	addi $a1, $zero, 8
#	addi $a2, $zero, 9
#	jal swap

	# Print list
#	la $a0, print_a
#	la $a1, list_a
#	addi $a2, $zero, 10
#	jal print_array

	# Call function on multiple input and print results.
	la $a0, list_a # First list as parameter.
	addi $a1, $zero, 0
	addi $a2, $zero, 8
	jal quicksort # sort(list_a, 10);

#	# Exit.
#	addi $v0, $zero, 10
#	syscall

	la $a0, print_a
	la $a1, list_a
	addi $a2, $zero, 10
	jal print_array

#	move $s0, $v0 # s0 = sort(list_a, 10);
#	addi $v0, $zero, 4 # Print String
#	la $a0, print_a # "sort(list_a, 10): "
#	syscall # printf("sort(list_a, 10): ");
#	addi $v0, $zero, 4
#	la $a0, list_a
#	syscall # printf("sort(list_a, 10): %d", sort(list_a, 10));
#	addi $v0, $zero, 4 # Print String
#	la $a0, newline # "\n"
#	syscall # printf("sort(list_a, 10): %d\n", sort(list_a, 10));

	# Exit.
	addi $v0, $zero, 10
	syscall

	la $a0, list_b # First list as parameter.
	addi $a1, $zero, 10
	jal sort # sort(list_b, 10);
	move $s0, $v0 # s0 = sort(list_b, 10);
	addi $v0, $zero, 4 # Print String
	la $a0, print_b # "sort(list_b, 10) length: "
	syscall # printf("sort(list_b, 10): ");
	addi $v0, $zero, 4
	la $a0, lis_b
	syscall # printf("sort(list_b, 10): %d", sort(list_b, 10));
	addi $v0, $zero, 4 # Print String
	la $a0, newline # "\n"
	syscall # printf("sort(list_b, 10): %d\n", sort(list_b, 10));

	la $a0, list_c # First list as parameter.
	addi $a1, $zero, 10
	jal sort # sort(list_c, 10);
	move $s0, $v0 # s0 = sort(list_c, 10);
	addi $v0, $zero, 4 # Print String
	la $a0, print_c # "list_c length: "
	syscall # printf("list_c length: ");
	addi $v0, $zero, 4
	la $a0, list_c
	syscall # printf("list_c length: %d", sort(list_c, 10));
	addi $v0, $zero, 4 # Print String
	la $a0, newline # "\n"
	syscall # printf("list_c length: %d\n", sort(list_c, 10));

	la $a0, list_d # First list as parameter.
	addi $a1, $zero, 10
	jal sort # sort(list_d, 10);
	move $s0, $v0 # s0 = sort(list_d, 10);
	addi $v0, $zero, 4 # Print String
	la $a0, print_d # "list_d length: "
	syscall # printf("list_d length: ");
	addi $v0, $zero, 4
	la $a0, list_d
	syscall # printf("list_d length: %d", sort(list_d, 10));
	addi $v0, $zero, 4 # Print String
	la $a0, newline # "\n"
	syscall # printf("list length: %d\n", sort(list_d, 10));

	# Pop values from the stack.
	lw $ra, 0 ($sp)
	addi $sp, $sp, 4 # Move back up registers

	# Return from this function
	jr $ra

# Print out an array of integers.
# print(text, array, len)
print_array:
	# Put values on the stack.
	addi $sp, $sp, -24 # (6 registers * -4).
	sw $ra, 0 ($sp) # Return Address (ra).
	sw $s0, 4 ($sp) # s0
	sw $s1, 8 ($sp) # s1
	sw $s2, 12 ($sp) # s2
	sw $s3, 16 ($sp) # s3
	sw $s4, 20 ($sp) # s4

	# Set s registers
	move $s0, $a1 # i (pointer begin)
	sll $s1, $a2, 2 # len (pointer end)
	add $s1, $s1, $s0 # len (pointer end)
	move $s2, $a1 # array
	move $s3, $a0 # text

	# Print Text.
	addi $v0, $zero, 4
	move $a0, $s3
	syscall

	# Loop through
	print_loop:
		# Load int
		lw $s4, 0 ($s0)

		# Print int
		addi $v0, $zero, 1 
		move $a0, $s4
		syscall

		# i += 4
		addi $s0, $s0, 4

		# if i == len { break }
		beq $s0, $s1, print_exit

		# Print comma
		addi $v0, $zero, 4
		la $a0, comma
		syscall

		j print_loop

	print_exit:
	# Print Newline
	addi $v0, $zero, 4
	la $a0, newline
	syscall

	# Pop values from the stack.
	lw $ra, 0 ($sp)
	lw $s0, 4 ($sp)
	lw $s1, 8 ($sp)
	lw $s2, 12 ($sp)
	lw $s3, 16 ($sp)
	lw $s4, 20 ($sp)
	addi $sp, $sp, 24 # Move back up registers

	# Return from this function
	jr $ra

# void quicksort(int[] array, int p, int r)
quicksort:
	# Put values on the stack.
	addi $sp, $sp, -20 # (5 registers * -4).
	sw $ra, 0 ($sp) # Return Address (ra).
	sw $s0, 4 ($sp) # array
	sw $s1, 8 ($sp) # p
	sw $s2, 12 ($sp) # r
	sw $s3, 16 ($sp)

	# Get array p and r into sRegisters.
	move $s0, $a0 # array
	move $s1, $a1 # p
	move $s2, $a2 # r

	# If p < r
	slt $s3, $s1, $s2             # s3 = p < r
	beq $s3, $zero, quicksort_end # if s3 == false { return; }

	# int q = partition(array, p, r);
	move $a0, $s0
	move $a1, $s1
	move $a2, $s2
	jal partition
	move $s3, $v0

	# quicksort(array, p, q - 1);
	move $a0, $s0
	move $a1, $s1
	addi $a2, $s3, -1
	jal quicksort

	# quicksort( array, q + 1, r);
	move $a0, $s0
	addi $a1, $s3, 1
	move $a2, $s2
	jal quicksort

	quicksort_end:

	# Pop values from the stack.
	lw $ra, 0 ($sp)
	lw $s0, 4 ($sp)
	lw $s1, 8 ($sp)
	lw $s2, 12 ($sp)
	lw $s3, 16 ($sp)
	addi $sp, $sp, 20 # Move back up registers

	# Return from this function
	jr $ra

## Swap data at indices `i` and `j` in `array`.
# void swap(int[] array, int i, int j)
swap:
	# Put values on the stack.
	addi $sp, $sp, -20 # (5 registers * -4).
	sw $ra, 0 ($sp) # Return Address (ra).
	sw $s0, 4 ($sp) # One swap value.
	sw $s1, 8 ($sp) # Value from array[i].
	sw $s2, 12 ($sp) # Value array[j].
	sw $s3, 16 ($sp) # Another swap value.

	# Load arguments into s registers.
	sll $s1, $a1, 2 # s1 is (i >> 4)
	add $s1, $a0, $s1 # s1 is (array + (i * 4)) or &array[i]

	sll $s2, $a2, 2 # s2 is (i >> 4)
	add $s2, $a0, $s2 # s2 is (array + (i * 4)) or &array[n]

	# Swap
	lw $s0, 0 ($s1)
	lw $s3, 0 ($s2)
	sw $s3, 0 ($s1)
	sw $s0, 0 ($s2)

	# Pop values from the stack.
	lw $ra, 0 ($sp)
	lw $s0, 4 ($sp)
	lw $s1, 8 ($sp)
	lw $s2, 12 ($sp)
	lw $s3, 16 ($sp)
	addi $sp, $sp, 20 # Move back up registers

	# Return from this function
	jr $ra

## Partition the array.
# int partition(int[] array, int p, int r)
partition:
	# Put values on the stack.
	addi $sp, $sp, -32 # (8 registers * -4).
	sw $ra, 0 ($sp) # Return Address (ra).
	sw $s0, 4 ($sp) # array
	sw $s1, 8 ($sp) # p
	sw $s2, 12 ($sp) # r
	sw $s3, 16 ($sp) # pivot
	sw $s4, 20 ($sp) # i
	sw $s5, 24 ($sp) # j
	sw $s6, 28 ($sp) # array_j

    # Put arguments into s registers.
    move $s0, $a0
    move $s1, $a1
    move $s2, $a2

    #  int pivot = array[ r];
    sll $s2, $s2, 2
    add $s3, $s2, $s0
    la $s3, 0 ($s3)

    #  int i = p -1;
    addi $s4, $s1, -1

    #  for( int j = p, j < r; j++) {
    move $s5, $s1
    partition_loop:
        slt $t0, $s5, $s2
        beq $t0, $zero, partition_done

    #    if( array[ j] <= pivot) {
        sll $t0, $s5, 2
        add $t0, $t0, $s0
        la $t0, 0 ($t0)
        slt $t0, $t0, $s3
        beq $t0, $zero, partition_continue

    #      i = i + 1;
        addi $s4, $s4, 1

    #      swap( array, i, j);
        move $a0, $s0
        move $a1, $s4
        move $a2, $s5
        jal swap

    #    }

        partition_continue:

        addi $s5, $s5, 1
        j partition_loop

    partition_done:
    #  }

    #  swap( array, i + 1, r);
    move $a0, $s0
    addi $a1, $s4, 1
    move $a2, $s2
    jal swap

    #  return( i + 1);
    addi $v0, $s4, 1

	# Pop values from the stack.
	lw $ra, 0 ($sp)
	lw $s0, 4 ($sp)
	lw $s1, 8 ($sp)
	lw $s2, 12 ($sp)
	lw $s3, 16 ($sp)
	lw $s4, 20 ($sp)
	lw $s5, 24 ($sp)
	lw $s6, 28 ($sp)
	addi $sp, $sp, 32 # Move back up registers

	# Return from this function
	jr $ra
