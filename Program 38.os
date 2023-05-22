Consider three processes (process id 0, 1, 2 respectively) with compute time bursts 2, 4 and 8-time units. All processes arrive at time zero. Write a program 
to compute the average waiting time and average turnaround time based on Shortest Job First Scheduling.

#include <stdio.h>

void swap(int *a, int *b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}

void sort(int burst_time[], int process_id[], int num_processes) {
    for (int i = 0; i < num_processes - 1; i++) {
        for (int j = 0; j < num_processes - i - 1; j++) {
            if (burst_time[j] > burst_time[j + 1]) {
                swap(&burst_time[j], &burst_time[j + 1]);
                swap(&process_id[j], &process_id[j + 1]);
            }
        }
    }
}

void calculate_waiting_time(int burst_time[], int waiting_time[], int num_processes) {
    waiting_time[0] = 0;
    for (int i = 1; i < num_processes; i++) {
        waiting_time[i] = burst_time[i - 1] + waiting_time[i - 1];
    }
}

void calculate_turnaround_time(int burst_time[], int waiting_time[], int turnaround_time[], int num_processes) {
    for (int i = 0; i < num_processes; i++) {
        turnaround_time[i] = burst_time[i] + waiting_time[i];
    }
}

void calculate_average_times(int burst_time[], int num_processes) {
    int process_id[] = {0, 1, 2};
    int waiting_time[num_processes], turnaround_time[num_processes];
    float total_waiting_time = 0, total_turnaround_time = 0;

    sort(burst_time, process_id, num_processes);
    calculate_waiting_time(burst_time, waiting_time, num_processes);
    calculate_turnaround_time(burst_time, waiting_time, turnaround_time, num_processes);

    printf("Process\tBurst Time\tWaiting Time\tTurnaround Time\n");

    for (int i = 0; i < num_processes; i++) {
        total_waiting_time += waiting_time[i];
        total_turnaround_time += turnaround_time[i];
        printf("%d\t%d\t\t%d\t\t%d\n", process_id[i], burst_time[i], waiting_time[i], turnaround_time[i]);
    }

    float avg_waiting_time = total_waiting_time / num_processes;
    float avg_turnaround_time = total_turnaround_time / num_processes;

    printf("\nAverage Waiting Time: %.2f\n", avg_waiting_time);
    printf("Average Turnaround Time: %.2f\n", avg_turnaround_time);
}

int main() {
    int burst_time[] = {2, 4, 8};
    int num_processes = sizeof(burst_time) / sizeof(burst_time[0]);

    calculate_average_times(burst_time, num_processes);

    return 0;
}

output :
Process Burst Time      Waiting Time    Turnaround Time
0       2               0               2
1       4               2               6
2       8               6               14

Average Waiting Time: 2.67
Average Turnaround Time: 7.33
