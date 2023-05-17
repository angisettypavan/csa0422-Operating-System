Write a C program to implement the first-fit algorithm for memory management.
Test Case:
Memory partitions: 40 KB, 10 KB, 30 KB, 60 KB, (in order) Show the outcome for the test case with first-fit algorithms to place the
processes of size 100 KB.50 KB.30 KB ,120 KB,35 KB (in order)

Code :
#include <stdio.h>
#include <stdbool.h>

#define MAX_PARTITIONS 5

// Memory Partition Structure
struct MemoryPartition {
    int size;
    bool allocated;
};

// Function to allocate memory using first-fit algorithm
void firstFit(struct MemoryPartition partitions[], int numPartitions, int processSize) {
    int i;

    // Iterate through each partition
    for (i = 0; i < numPartitions; i++) {
        // Check if the partition is large enough and not already allocated
        if (partitions[i].size >= processSize && !partitions[i].allocated) {
            partitions[i].allocated = true;
            printf("Process of size %d KB allocated to Partition %d.\n", processSize, i + 1);
            return;
        }
    }

    printf("Process of size %d KB could not be allocated.\n", processSize);
}

int main() {
    struct MemoryPartition partitions[MAX_PARTITIONS] = {
        {40, false},
        {10, false},
        {30, false},
        {60, false}
    };

    int processSizes[] = {100, 50, 30, 120, 35};
    int numProcesses = sizeof(processSizes) / sizeof(processSizes[0]);

    int i;
    for (i = 0; i < numProcesses; i++) {
        printf("\nAllocating process of size %d KB:\n", processSizes[i]);
        firstFit(partitions, MAX_PARTITIONS, processSizes[i]);
    }

    return 0;
}

Output :
Allocating process of size 100 KB:
Process of size 100 KB allocated to Partition 1.

Allocating process of size 50 KB:
Process of size 50 KB allocated to Partition 1.

Allocating process of size 30 KB:
Process of size 30 KB allocated to Partition 2.

Allocating process of size 120 KB:
Process of size 120 KB could not be allocated.

Allocating process of size 35 KB:
Process of size 35 KB allocated to Partition 3.
