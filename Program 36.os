Write a C program to simulate SSTF disk scheduling algorithm and execute your program and find the average head movement with the following test case: 
No of tracks 5; Track position:55   58    60   70   18      
#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#include <math.h>

// Function to find the index of the track with the shortest seek time
int find_closest_track(int tracks[], int num_tracks, int current_track) {
    int min_distance = INT_MAX;
    int closest_index = -1;

    for (int i = 0; i < num_tracks; i++) {
        int distance = abs(current_track - tracks[i]);
        if (distance < min_distance) {
            min_distance = distance;
            closest_index = i;
        }
    }

    return closest_index;
}

// Function to calculate the average head movement
float calculate_average_head_movement(int tracks[], int num_tracks, int start_track) {
    int current_track = start_track;
    int total_head_movement = 0;

    for (int i = 0; i < num_tracks; i++) {
        int closest_index = find_closest_track(tracks, num_tracks, current_track);
        int closest_track = tracks[closest_index];

        total_head_movement += abs(current_track - closest_track);

        // Move the current track to the closest track
        current_track = closest_track;

        // Remove the closest track from the list
        for (int j = closest_index; j < num_tracks - 1; j++) {
            tracks[j] = tracks[j + 1];
        }

        num_tracks--;
    }

    return (float)total_head_movement / num_tracks;
}

int main() {
    int num_tracks;

    printf("Enter the number of tracks: ");
    scanf("%d", &num_tracks);

    printf("Enter the track positions:\n");
    int tracks[num_tracks];
    for (int i = 0; i < num_tracks; i++) {
        scanf("%d", &tracks[i]);
    }

    int start_track;

    printf("Enter the starting track: ");
    scanf("%d", &start_track);

    float avg_head_movement = calculate_average_head_movement(tracks, num_tracks, start_track);

    printf("Average head movement: %.2f\n", avg_head_movement);

    return 0;
}

output:
Number of tracks: 5
Track positions: 55 58 60 70 18
Starting track: 50
