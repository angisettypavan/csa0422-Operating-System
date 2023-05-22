Write a C program to simulate LOOK disk   scheduling algorithms. and execute your program and find out and print the average head movement for the following test case.
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

// Function to simulate the LOOK disk scheduling algorithm
int simulate_look(int track_sequence[], int num_tracks, int start_track) {
    int total_head_movement = 0;
    int current_track = start_track;
    int direction = 1; // 1 for moving towards higher track numbers, -1 for moving towards lower track numbers

    while (true) {
        total_head_movement += abs_difference(current_track, track_sequence[0]);

        // Move to the next track in the same direction
        current_track = track_sequence[0];

        // Remove the current track from the sequence
        for (int i = 0; i < num_tracks - 1; i++) {
            track_sequence[i] = track_sequence[i + 1];
        }
        num_tracks--;

        // Check if all tracks have been visited
        if (num_tracks == 0) {
            break;
        }

        // Change direction if the next track is not present in the sequence
        if (!is_track_present(track_sequence, num_tracks, current_track + direction)) {
            direction *= -1;
        }

        // Move to the next track in the changed direction
        current_track += direction;
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

    int average_head_movement = simulate_look(track_sequence, num_tracks, start_track) / num_tracks;

    printf("Average head movement: %d\n", average_head_movement);

    return 0;
}

output :
Number of tracks: 5
Track positions: 55 58 60 70 18
Starting track: 50
