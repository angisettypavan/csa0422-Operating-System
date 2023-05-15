. Write a C Program to find the maximum size of a file that can be stored in the below file system that uses inodes to represent files. Disk blocks are 8 KB in size, and a pointer to a disk block requires 4 bytes. This file system has 12 direct disk blocks, as well as single, double, and triple indirect disk blocks.
 Test Case:
●	 Check that the start blocks and the required contiguous blocks are free. 
●	If free, allocate those blocks to the file. 
●	If not free, find the next available contiguous blocks.

Code :

#include <stdio.h>
#include <stdlib.h>

// Define constants
#define BLOCK_SIZE 8192 // 8 KB
#define BLOCK_PTR_SIZE 4 // 4 bytes for a block pointer
#define NUM_DIRECT_BLOCKS 12
#define NUM_INDIRECT_BLOCKS 256

int main()
{
    int num_blocks;
    printf("Enter the number of contiguous blocks required by the file: ");
    scanf("%d", &num_blocks);

    // Calculate the maximum file size in bytes
    int max_file_size = NUM_DIRECT_BLOCKS * BLOCK_SIZE;

    // Calculate the size of an indirect block in bytes
    int indirect_block_size = BLOCK_SIZE / BLOCK_PTR_SIZE;

    // Calculate the maximum number of single indirect blocks
    int max_single_indirect_blocks = NUM_INDIRECT_BLOCKS;

    // Calculate the maximum number of double indirect blocks
    int max_double_indirect_blocks = NUM_INDIRECT_BLOCKS * NUM_INDIRECT_BLOCKS;

    // Calculate the maximum number of triple indirect blocks
    int max_triple_indirect_blocks = NUM_INDIRECT_BLOCKS * NUM_INDIRECT_BLOCKS * NUM_INDIRECT_BLOCKS;

    // Check if the required contiguous blocks can be allocated in the direct blocks
    if (num_blocks <= NUM_DIRECT_BLOCKS) {
        max_file_size = num_blocks * BLOCK_SIZE;
    }
    // Check if the required contiguous blocks can be allocated in the single indirect blocks
    else if (num_blocks <= NUM_DIRECT_BLOCKS + max_single_indirect_blocks) {
        int remaining_blocks = num_blocks - NUM_DIRECT_BLOCKS;
        max_file_size = NUM_DIRECT_BLOCKS * BLOCK_SIZE + remaining_blocks * BLOCK_SIZE;
    }
    // Check if the required contiguous blocks can be allocated in the double indirect blocks
    else if (num_blocks <= NUM_DIRECT_BLOCKS + max_single_indirect_blocks + max_double_indirect_blocks) {
        int remaining_blocks = num_blocks - NUM_DIRECT_BLOCKS - max_single_indirect_blocks;
        max_file_size = NUM_DIRECT_BLOCKS * BLOCK_SIZE + max_single_indirect_blocks * BLOCK_SIZE
            + remaining_blocks * BLOCK_SIZE * BLOCK_PTR_SIZE;
    }
    // Check if the required contiguous blocks can be allocated in the triple indirect blocks
    else if (num_blocks <= NUM_DIRECT_BLOCKS + max_single_indirect_blocks + max_double_indirect_blocks + max_triple_indirect_blocks) {
        int remaining_blocks = num_blocks - NUM_DIRECT_BLOCKS - max_single_indirect_blocks - max_double_indirect_blocks;
        max_file_size = NUM_DIRECT_BLOCKS * BLOCK_SIZE + max_single_indirect_blocks * BLOCK_SIZE
            + max_double_indirect_blocks * BLOCK_SIZE * BLOCK_PTR_SIZE
            + remaining_blocks * BLOCK_SIZE * BLOCK_PTR_SIZE * BLOCK_PTR_SIZE;
    }
    // Otherwise, the file is too large to be stored in this file system
    else {
        printf("File too large to be stored in this file system\n");
        return 0;
    }

    // Print the maximum file size in bytes
    printf("Maximum file size: %d bytes\n", max_file_size);

    return 0;
}

Output :
Enter the number of contiguous blocks required by the file: 5
Maximum file size: 40960 bytes
