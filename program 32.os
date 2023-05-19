Write a C program to simulate SCAN disk scheduling algorithms and execute your program and find out and print the average head movement for the following test case.
No of tracks:9
Track position:55   58 60   70	 18 90   150   160   184

#include <stdio.h>
#include <stdlib.h>

int abs_diff(int a, int b) {
    return abs(a - b);
}

void scan(int tracks[], int n, int initial_pos) {
    int total_head_movement = 0;
    int current_pos = initial_pos;
    int direction = 1;  // 1 represents moving towards higher track numbers

    // Sort the tracks in ascending order
    for (int i = 0; i < n - 1; i++) {
        for (int j = 0; j < n - i - 1; j++) {
            if (tracks[j] > tracks[j + 1]) {
                int temp = tracks[j];
                tracks[j] = tracks[j + 1];
                tracks[j + 1] = temp;
            }
        }
    }

    // Find the index of initial position in the sorted array
    int initial_pos_index = 0;
    while (tracks[initial_pos_index] < initial_pos && initial_pos_index < n) {
        initial_pos_index++;
    }

    // Move the head towards higher track numbers
    for (int i = initial_pos_index; i < n; i++) {
        total_head_movement += abs_diff(current_pos, tracks[i]);
        current_pos = tracks[i];
    }

    // Move the head towards lower track numbers
    if (initial_pos_index > 0) {
        total_head_movement += abs_diff(current_pos, tracks[initial_pos_index - 1]);
        current_pos = tracks[initial_pos_index - 1];
    }

    for (int i = initial_pos_index - 2; i >= 0; i--) {
        total_head_movement += abs_diff(current_pos, tracks[i]);
        current_pos = tracks[i];
    }

    printf("Average head movement: %.2f\n", (float)total_head_movement / n);
}

int main() {
    int num_tracks;
    printf("Enter the number of tracks: ");
    scanf("%d", &num_tracks);

    int tracks[num_tracks];
    printf("Enter the track positions:\n");
    for (int i = 0; i < num_tracks; i++) {
        scanf("%d", &tracks[i]);
    }

    int initial_position;
    printf("Enter the initial position: ");
    scanf("%d", &initial_position);

    scan(tracks, num_tracks, initial_position);

    return 0;
}
Output :
Enter the number of tracks: 5
Enter the track positions:
5
5

4
4
4
Enter the initial position: 2
Average head movement: 0.60
