#include <stdio.h>

int main() {
    int num_processes = 3;
    int process_id[] = {0, 1, 2};
    int burst_time[] = {2, 4, 8};
    int arrival_time[] = {0, 0, 0};
    int completion_time[num_processes];
    int waiting_time[num_processes];
    int turnaround_time[num_processes];
    int total_waiting_time = 0;
    int total_turnaround_time = 0;

    // Calculate completion time of each process
    int current_time = 0;
    for (int i = 0; i < num_processes; i++) {
        if (current_time < arrival_time[i]) {
            current_time = arrival_time[i];
        }
        completion_time[i] = current_time + burst_time[i];
        current_time = completion_time[i];
    }

    // Calculate waiting time and turnaround time of each process
    for (int i = 0; i < num_processes; i++) {
        waiting_time[i] = completion_time[i] - burst_time[i] - arrival_time[i];
        turnaround_time[i] = completion_time[i] - arrival_time[i];
        total_waiting_time += waiting_time[i];
        total_turnaround_time += turnaround_time[i];
    }

    // Calculate average waiting time and average turnaround time
    float avg_waiting_time = (float) total_waiting_time / num_processes;
    float avg_turnaround_time = (float) total_turnaround_time / num_processes;

    // Print the results
    printf("Process\tBurst Time\tArrival Time\tWaiting Time\tTurnaround Time\n");
    for (int i = 0; i < num_processes; i++) {
        printf("%d\t%d\t\t%d\t\t%d\t\t%d\n", process_id[i], burst_time[i], arrival_time[i], waiting_time[i], turnaround_time[i]);
    }
    printf("Average waiting time: %.2f\n", avg_waiting_time);
    printf("Average turnaround time: %.2f\n", avg_turnaround_time);

    return 0;
}
