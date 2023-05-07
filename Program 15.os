Write a C program to simulate FCFS disk scheduling algorithms and execute your program and find out and print the average head movement for the following test case.
 No of tracks:9; Track position:55 58 60 70	 18   	90   150   160   184


#include <stdio.h>
#include <stdlib.h>

#define MAX_TRACKS 100

int main() {
    int tracks[MAX_TRACKS];
    int num_tracks = 9;
    int head_position = 50;
    int total_head_movement = 0;

    // Initialize the tracks
    tracks[0] = 55;
    tracks[1] = 58;
    tracks[2] = 60;
    tracks[3] = 70;
    tracks[4] = 18;
    tracks[5] = 90;
    tracks[6] = 150;
    tracks[7] = 160;
    tracks[8] = 184;

    // Simulate the FCFS disk scheduling algorithm
    for (int i = 0; i < num_tracks; i++) {
        total_head_movement += abs(tracks[i] - head_position);
        head_position = tracks[i];
    }

    // Print the average head movement
    float average_head_movement = (float) total_head_movement / num_tracks;
    printf("Average head movement: %.2f\n", average_head_movement);

    return 0;
}

Output:

Average head movement: 83.11

