Write a C program to implement the worst-fit algorithm and allocate the memory block to each process.
Test Case:
Memory partitions: 40 KB, 10 KB. 30 KB, .60 KB (in order)

#include <stdio.h>

#define MAX_PARTITIONS 100

// Structure to represent a memory partition
struct Partition {
    int size;
    int allocated;
};

// Function to allocate memory using worst-fit algorithm
void worst_fit_allocation(struct Partition partitions[], int num_partitions, int process_sizes[], int num_processes) {
    int i, j, worst_fit_index;

    // Iterate through each process
    for (i = 0; i < num_processes; i++) {
        worst_fit_index = -1;

        // Find the largest partition that can accommodate the current process
        for (j = 0; j < num_partitions; j++) {
            if (partitions[j].allocated == 0 && partitions[j].size >= process_sizes[i]) {
                if (worst_fit_index == -1 || partitions[j].size > partitions[worst_fit_index].size) {
                    worst_fit_index = j;
                }
            }
        }

        // Allocate the partition to the process
        if (worst_fit_index != -1) {
            partitions[worst_fit_index].allocated = 1;
            printf("Allocated Process %d to Partition %d\n", i + 1, worst_fit_index + 1);
        } else {
            printf("Cannot allocate Process %d\n", i + 1);
        }
    }
}

int main() {
    int num_partitions, num_processes;

    printf("Enter the number of memory partitions: ");
    scanf("%d", &num_partitions);

    printf("Enter the sizes of memory partitions (in KB):\n");
    struct Partition partitions[MAX_PARTITIONS];
    for (int i = 0; i < num_partitions; i++) {
        scanf("%d", &partitions[i].size);
        partitions[i].allocated = 0;
    }

    printf("Enter the number of processes: ");
    scanf("%d", &num_processes);

    printf("Enter the sizes of processes (in KB):\n");
    int process_sizes[MAX_PARTITIONS];
    for (int i = 0; i < num_processes; i++) {
        scanf("%d", &process_sizes[i]);
    }

    worst_fit_allocation(partitions, num_partitions, process_sizes, num_processes);

    return 0;
}

Output :
Enter the number of memory partitions: 5
Enter the sizes of memory partitions (in KB):
2
4
4
7
5
Enter the number of processes: 2
Enter the sizes of processes (in KB):
2
5
Allocated Process 1 to Partition 4
Allocated Process 2 to Partition 5
