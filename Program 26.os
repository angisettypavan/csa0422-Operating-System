Write a program to compute the average waiting time and average turnaround time based on Priority scheduling   for the following process with the given CPU burst times (and the assumption that all jobs arrive at the same time.)
Process          Burst Time      Priority 
P1		30 		2
P2		5		1
P3		12		3

Code :
#include <stdio.h>

int main() {
    int n = 3; // number of processes
    int burst_time[] = {30, 5, 12};
    int priority[] = {2, 1, 3};
    int waiting_time[n], turnaround_time[n], completion_time[n];
    float avg_waiting_time = 0, avg_turnaround_time = 0;

    // Calculate completion time of each process
    completion_time[0] = burst_time[0];
    for (int i = 1; i < n; i++) {
        completion_time[i] = completion_time[i-1] + burst_time[i];
    }

    // Calculate waiting time and turnaround time of each process
    for (int i = 0; i < n; i++) {
        waiting_time[i] = completion_time[i] - burst_time[i];
        turnaround_time[i] = completion_time[i];
    }


    // Calculate average waiting time and average turnaround time
    for (int i = 0; i < n; i++) {
        avg_waiting_time += waiting_time[i];
        avg_turnaround_time += turnaround_time[i];
    }
    avg_waiting_time /= n;
    avg_turnaround_time /= n;

    // Print results
    printf("Process\tBurst Time\tPriority\tCompletion Time\tWaiting Time\tTurnaround Time\n");
    for (int i = 0; i < n; i++) {
        printf("P%d\t\t%d\t\t%d\t\t%d\t\t%d\t\t%d\n", i+1, burst_time[i], priority[i], completion_time[i], waiting_time[i], turnaround_time[i]);
    }
    printf("\nAverage Waiting Time = %.2f\n", avg_waiting_time);
    printf("Average Turnaround Time = %.2f\n", avg_turnaround_time);

    return 0;
}

Output :
Process Burst Time      Priority        Completion Time Waiting Time    Turnaround Time
P1              30              2               30              0               30
P2              5               1               35              30              35
P3              12              3               47              35              47

Average Waiting Time = 21.67
Average Turnaround Time = 37.33

