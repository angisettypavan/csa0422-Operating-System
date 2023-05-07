Write a program to compute the average waiting time and average turnaround time based on First Come First Serve for the following process with the given CPU burst times, (and the assumption that all jobs arrive at the same time.)
	Process    Burst Time
	P1 		10
	P2		 15
	P3		25


#include <stdio.h>

#define NUM_PROCESSES 3

int main() {
    int burst_times[NUM_PROCESSES] = {10, 15, 25};
    int waiting_times[NUM_PROCESSES] = {0};
    int turnaround_times[NUM_PROCESSES] = {0};
    int total_waiting_time = 0;
    int total_turnaround_time = 0;

    // Calculate waiting and turnaround times for each process
    for (int i = 0; i < NUM_PROCESSES; i++) {
        if (i == 0) {
            waiting_times[i] = 0;
        } else {
            waiting_times[i] = waiting_times[i-1] + burst_times[i-1];
        }
        turnaround_times[i] = waiting_times[i] + burst_times[i];
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


Output :
Process Burst Time Waiting Time Turnaround Time
P1      10          0           10
P2      15          10          25
P3      25          25          50
Average Waiting Time: 11.67
Average Turnaround Time: 28.33
