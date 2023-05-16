Write the C program to Calculate how many disk I/O operations are required for contiguous, linked, and indexed (single-level) allocation strategies, if, for one block, 
the following conditions hold in a file currently consisting of 100 blocks. Assume that the file control block (and the index block, in the case of indexed allocation) is
already in memory.
 Test Cases:
a.      The block is added at the beginning.
b.      The block is added in the middle.
c.      The block is added at the end.

Code :
#include <stdio.h>

int main() {
    int file_size, new_block, block_size = 1;
    int cont_start = 0, link_start = 0, link_prev = 0, link_count = 0;
    int index_start = 0, index_count = 0, index_block_size = 10;
    int i, cont_io = 0, link_io = 0, index_io = 0;

    printf("Enter the current file size (in blocks): ");
    scanf("%d", &file_size);

    printf("Enter the new block to be added: ");
    scanf("%d", &new_block);

    // Contiguous allocation
    cont_io = 1;

    if (new_block == cont_start - 1) {
        cont_start = new_block;
    } else if (new_block == file_size) {
        cont_start = new_block;
        file_size++;
    } else {
        cont_io += (file_size - cont_start + 1);
        cont_start = new_block;
    }

    // Linked allocation
    link_io = 1;

    if (link_start == 0) {
        link_start = new_block;
    } else {
        for (i = link_start; i != 0; i = link_prev) {
            link_count++;
            if (i == new_block - 1) {
                link_prev = i;
            } else if (new_block == file_size) {
                link_prev = i;
                link_count++;
            } else {
                link_prev = 0;
                link_count++;
            }
        }

        if (link_count == file_size) {
            link_io = link_count + 2;
        } else {
            link_io = link_count + 3;
        }
    }

    // Indexed allocation
    index_io = 1;

    if (index_start == 0) {
        index_start = file_size;
        file_size++;
        index_count++;
    }

    while (new_block >= index_block_size + index_start) {
        index_io++;
        index_start += index_block_size;
        index_count++;
    }

    if (new_block < index_block_size + index_start) {
        index_io += 2;
    } else {
        index_io += 3;
    }

    printf("Contiguous allocation requires %d disk I/O operations\n", cont_io);
    printf("Linked allocation requires %d disk I/O operations\n", link_io);
    printf("Indexed allocation requires %d disk I/O operations\n", index_io);

    return 0;
}

Output :
Enter the current file size (in blocks): 2
Enter the new block to be added: 1
Contiguous allocation requires 4 disk I/O operations
Linked allocation requires 1 disk I/O operations
Indexed allocation requires 3 disk I/O operations
