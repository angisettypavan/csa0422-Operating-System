Write a C program to implement the best-fit algorithm and allocate the memory block to each process.
	Test Case:
	Memory partitions: 300 KB, 600 KB, 350 KB, 200 KB, 750 KB, and 125 KB (in order), 
	Show the outcome for the test case with the best-fit algorithms to place processes of size 115 KB, 500 KB, 358 	KB, 200 KB, and 375 KB (in order)



#include <stdio.h>
#include <stdlib.h>

#define NUM_BLOCKS 6

struct block {
    int pid;
    int size;
};

int find_best_fit(struct block memory[], int size) {
    int best_index = -1;
    int best_fit = 1000000;
    for (int i = 0; i < NUM_BLOCKS; i++) {
        if (memory[i].pid == -1 && memory[i].size >= size && memory[i].size < best_fit) {
            best_index = i;
            best_fit = memory[i].size;
        }
    }
    return best_index;
}

void allocate_memory(struct block memory[], int pid, int size) {
    int index = find_best_fit(memory, size);
    if (index == -1) {
        printf("Memory allocation failed for process %d\n", pid);
        return;
    }
    memory[index].pid = pid;
    memory[index].size = size;
    printf("Memory allocated for process %d at block %d with size %d KB\n", pid, index, size);
}

void free_memory(struct block memory[], int pid) {
    for (int i = 0; i < NUM_BLOCKS; i++) {
        if (memory[i].pid == pid) {
            memory[i].pid = -1;
            printf("Memory block %d freed from process %d\n", i, pid);
        }
    }
}

void print_memory(struct block memory[]) {
    printf("Memory status:\n");
    for (int i = 0; i < NUM_BLOCKS; i++) {
        if (memory[i].pid == -1) {
            printf("Block %d: Free\n", i);
        } else {
            printf("Block %d: Process %d, Size %d KB\n", i, memory[i].pid, memory[i].size);
        }
    }
}

int main() {
    struct block memory[NUM_BLOCKS] = {{-1, 300}, {-1, 600}, {-1, 350}, {-1, 200}, {-1, 750}, {-1, 125}};
    allocate_memory(memory, 1, 115);
    allocate_memory(memory, 2, 500);
    allocate_memory(memory, 3, 358);
    allocate_memory(memory, 4, 200);
    allocate_memory(memory, 5, 375);
    print_memory(memory);
    free_memory(memory, 2);
    allocate_memory(memory, 6, 200);
    print_memory(memory);
    free_memory(memory, 3);
    free_memory(memory, 1);
    free_memory(memory, 4);
    free_memory(memory, 5);
    free_memory(memory, 6);
    print_memory(memory);
    return 0;
}


Output:

Memory allocated for process 1 at block 5 with size 115 KB
Memory allocated for process 2 at block 1 with size 500 KB
Memory allocated for process 3 at block 4 with size 358 KB
Memory allocated for process 4 at block 3 with size 200 KB
Memory allocation failed for process 5
Memory status:
Block 0: Free
Block 1: Process 2, Size 500 KB
Block 2: Free
Block 3: Process 4, Size 200 KB
Block 4: Process 3, Size 358 KB
Block 5: Process 1, Size 115 KB
Memory block 1 freed from process 2
Memory allocated for process 6 at block 0 with size 200 KB
Memory status:
Block 0: Process 6, Size 200 KB
Block 1: Free
Block 2: Free
Block 3: Process 4, Size 200 KB
Block 4: Process 3, Size 358 KB
Block 5: Process 1, Size 115 KB
Memory block 4 freed from process 3
Memory block 5 freed from process 1
Memory block 3 freed from process 4
Memory block 0 freed from process 6
Memory status:
Block 0: Free
Block 1: Free
Block 2: Free
Block 3: Free
Block 4: Free
Block 5: Free
