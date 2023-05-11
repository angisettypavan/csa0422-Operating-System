Write a C program to implement the worst-fit algorithm and allocate the memory block to each process.
Test Case:
Memory partitions: 300 KB, 600 KB, 350 KB, 200 KB, 750 KB, and 125 KB (in order), 
Show the outcome for the test case with the worst-fit algorithms to place processes of size 115 KB, 500 KB, 358 KB, 200 KB, and 375 KB (in order)

Code :
#include <stdio.h>

#define MAX_PARTITIONS 10

void worst_fit(int partitions[], int n, int processes[], int m) {
    int i, j, worst_index;
    for (i = 0; i < m; i++) {
        worst_index = -1;
        for (j = 0; j < n; j++) {
            if (processes[i] <= partitions[j]) {
                if (worst_index == -1 || partitions[j] > partitions[worst_index]) {
                    worst_index = j;
                }
            }
        }
        if (worst_index != -1) {
            printf("Process %d allocated to partition %d\n", processes[i], worst_index);
            partitions[worst_index] -= processes[i];
        } else {
            printf("Process %d cannot be allocated\n", processes[i]);
        }
    }
}

int main() {
    int partitions[MAX_PARTITIONS] = {300, 600, 350, 200, 750, 125};
    int processes[] = {115, 500, 358, 200, 375};
    int n = sizeof(partitions) / sizeof(partitions[0]);
    int m = sizeof(processes) / sizeof(processes[0]);
    worst_fit(partitions, n, processes, m);
    return 0;
}

Output :
Process 115 allocated to partition 5
Process 500 allocated to partition 1
Process 358 allocated to partition 1
Process 200 allocated to partition 3
Process 375 allocated to partition 1
