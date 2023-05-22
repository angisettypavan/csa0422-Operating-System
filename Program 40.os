Write a C program to simulate CLOOK disk   scheduling algorithms. and execute your program and find out and print the average head movement for the following test case.
No of tracks:5; Track position:55 58 	60 70 18

#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#include <stdbool.h>

// Function to calculate the absolute difference between two numbers
int abs_difference(int a, int b) {
    return abs(a - b);
}

// Function to check if a track exists in the track sequence
bool is_track_present(int track_sequence[], int num_tracks, int track) {
    for (int i = 0; i < num_tracks; i++) {
        if (track_sequence[i] == track) {
            return true;
        }
    }
    return false;
}

// Function to simulate the CLOOK disk scheduling algorithm
int simulate_clook(int track_sequence[], int num_tracks, int start_track) {
    int total_head_movement = 0;
    int current_track = start_track;
    int min_track = INT_MAX;
    int max_track = INT_MIN;

    // Find the minimum and maximum tracks in the sequence
    for (int i = 0; i < num_tracks; i++) {
        if (track_sequence[i] < min_track) {
            min_track = track_sequence[i];
        }
        if (track_sequence[i] > max_track) {
            max_track = track_sequence[i];
        }
    }

    // Move towards higher track numbers until the maximum track is reached
    while (current_track < max_track) {
        // Find the next track in the sequence
        int next_track = INT_MAX;
        for (int i = 0; i < num_tracks; i++) {
            if (track_sequence[i] > current_track && track_sequence[i] < next_track) {
                next_track = track_sequence[i];
            }
        }

        // If no next track is found, wrap around to the minimum track
        if (next_track == INT_MAX) {
            next_track = min_track;
        }

        // Move to the next track
        total_head_movement += abs_difference(current_track, next_track);
        current_track = next_track;
    }

    // Move towards lower track numbers from the minimum track to the starting track
    while (current_track > start_track) {
        // Find the next track in the sequence
        int next_track = INT_MIN;
        for (int i = 0; i < num_tracks; i++) {
            if (track_sequence[i] < current_track && track_sequence[i] > next_track) {
                next_track = track_sequence[i];
            }
        }

        // If no next track is found, wrap around to the maximum track
        if (next_track == INT_MIN) {
            next_track = max_track;
        }

        // Move to the next track
        total_head_movement += abs_difference(current_track, next_track);
        current_track = next_track;
    }

    return total_head_movement;
}

int main() {
    int num_tracks;

    printf("Enter the number of tracks: ");
    scanf("%d", &num_tracks);

    printf("Enter the track positions:\n");
    int track_sequence[num_tracks];
    for (int i = 0; i < num_tracks; i++) {
        scanf("%d", &track_sequence[i]);
    }

    int start_track;

    printf("Enter the starting track: ");
    scanf("%d", &start_track);

    int average_head_movement = simulate_clook(track_sequence, num_tracks, start_track) / num_tracks;

    printf("Average head movement: %d\n", average_head_movement);

    return 0;
}

output:
Enter the number of tracks: 5
Enter the track positions:
1
2
3
4
5
Enter the starting track: 2
Average head movement: 1
