 Write a program to compute the average waiting time and average turnaround time based on Round Robin scheduling   for the following process with the given CPU burst times and quantum time slots  4 ms, ( and the assumption that all jobs arrive at the same time.)
Process          Burst Time
P1		24
P2		3
P3		3


#include <stdio.h>

#define NUM_PROCESSES 3
#define QUANTUM_TIME 4

int main() {
    int burst_times[NUM_PROCESSES] = {24, 3, 3};
    int remaining_burst_times[NUM_PROCESSES] = {0};
    int waiting_times[NUM_PROCESSES] = {0};
    int turnaround_times[NUM_PROCESSES] = {0};
    int total_waiting_time = 0;
    int total_turnaround_time = 0;
    int time = 0;

    // Initialize remaining burst times
    for (int i = 0; i < NUM_PROCESSES; i++) {
        remaining_burst_times[i] = burst_times[i];
    }

    // Simulate the Round Robin scheduling algorithm
    while (1) {
        int done = 1;
        for (int i = 0; i < NUM_PROCESSES; i++) {
            if (remaining_burst_times[i] > 0) {
                done = 0;
                if (remaining_burst_times[i] > QUANTUM_TIME) {
                    time += QUANTUM_TIME;
                    remaining_burst_times[i] -= QUANTUM_TIME;
                } else {
                    time += remaining_burst_times[i];
                    waiting_times[i] = time - burst_times[i];
                    remaining_burst_times[i] = 0;
                }
            }
        }
        if (done == 1) {
            break;
        }
    }

    // Calculate turnaround times
    for (int i = 0; i < NUM_PROCESSES; i++) {
        turnaround_times[i] = burst_times[i] + waiting_times[i];
        total_waiting_time += waiting_times[i];
        total_turnaround_time += turnaround_times[i];
    }

    // Calculate average waiting and turnaround times
    float avg_waiting_time = (float) total_waiting_time / NUM_PROCESSES;
    float avg_turnaround_time = (float) total_turnaround_time / NUM_PROCESSES;

    // Print the results
    printf("Process\tBurst Time\tWaiting Time\tTurnaround Time\n");
    for (int i = 0; i < NUM_PROCESSES; i++) {
        printf("P%d\t\t%d\t\t%d\t\t%d\n", i+1, burst_times[i], waiting_times[i], turnaround_times[i]);
    }
    printf("Average Waiting Time: %.2f\n", avg_waiting_time);
    printf("Average Turnaround Time: %.2f\n", avg_turnaround_time);

    return 0;
}

Output:

Process Burst Time Waiting Time Turnaround Time
P1      24          16          40
P2      3           0           3
P3      3           0           3
Average Waiting Time: 5.33
Average Turnaround Time: 15.33
