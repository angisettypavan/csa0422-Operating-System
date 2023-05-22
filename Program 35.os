. Write a C program to simulate the sequential file allocation in a very simple file system with a disk of 16 blocks, each block is of 1 KB size and first 8 blocks (0 to 7) are allocated to the “iNodes” and can’t be used by the file system. Blocks available for allocation are from block 8 to block 16. Minimum file size is 1 KB. Check that the start blocks and the required contiguous blocks are free. If free, allocate those blocks to the file. If not free, find the next available contiguous blocks.
Test Case: If there are not enough contiguous blocks available for a file, the program must exit ()
#include <stdio.h>
#include <stdbool.h>

#define NUM_BLOCKS 16
#define INODE_BLOCKS 8
#define MIN_FILE_SIZE 1

// Function to check if the given blocks are free
bool are_blocks_free(bool blocks[], int start_block, int num_blocks) {
    for (int i = start_block; i < start_block + num_blocks; i++) {
        if (blocks[i]) {
            return false;
        }
    }
    return true;
}

// Function to allocate blocks to a file
void allocate_blocks(bool blocks[], int start_block, int num_blocks) {
    for (int i = start_block; i < start_block + num_blocks; i++) {
        blocks[i] = true;
    }
}

int main() {
    bool blocks[NUM_BLOCKS] = { false };

    // Initialize iNodes blocks as allocated
    for (int i = 0; i < INODE_BLOCKS; i++) {
        blocks[i] = true;
    }

    int start_block, num_blocks;

    printf("Enter the starting block for the file: ");
    scanf("%d", &start_block);

    printf("Enter the number of blocks required for the file: ");
    scanf("%d", &num_blocks);

    // Check if start block and contiguous blocks are free
    if (start_block >= 0 && start_block < NUM_BLOCKS && start_block + num_blocks <= NUM_BLOCKS) {
        if (are_blocks_free(blocks, start_block, num_blocks)) {
            // Allocate blocks to the file
            allocate_blocks(blocks, start_block, num_blocks);
            printf("Blocks allocated to the file: %d to %d\n", start_block, start_block + num_blocks - 1);
        } else {
            printf("Blocks are not free\n");
        }
    } else {
        printf("Invalid start block or number of blocks\n");
    }

    return 0;
}

output:
Enter the starting block for the file: 8
Enter the number of blocks required for the file: 9
Invalid start block or number of blocks
