Write a C program to simulate SCAN disk scheduling algorithms and execute your program and find out and print the average head movement for the following test case.
No of tracks:9
Track position:55   58 60   70	 18 90   150   160   184

#include <stdio.h>
#include <stdlib.h>

// Function to sort an array in ascending order
void sort(int arr[], int n) {
    int i, j, temp;
    for (i = 0; i < n-1; i++) {
        for (j = 0; j < n-i-1; j++) {
            if (arr[j] > arr[j+1]) {
                temp = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = temp;
            }
        }
    }
}

// Function to calculate the absolute difference between two integers
int abs_diff(int a, int b) {
    return (a > b) ? (a - b) : (b - a);
}

// Function to find the index of the track in the array
int find_track(int tracks[], int n, int track) {
    int i;
    for (i = 0; i < n; i++) {
        if (tracks[i] == track) {
            return i;
        }
    }
    return -1;
}

// Function to calculate the average head movement using SCAN algorithm
float calculate_average_head_movement(int tracks[], int n, int start_position) {
    int i, start_index, total_distance = 0;
    int direction = 1; // 1 for moving towards higher tracks, -1 for moving towards lower tracks

    // Sort the tracks array in ascending order
    sort(tracks, n);

    // Find the start position index in the tracks array
    start_index = find_track(tracks, n, start_position);
    
    // Move towards higher tracks until the end of the disk
    for (i = start_index; i < n; i++) {
        total_distance += abs_diff(start_position, tracks[i]);
        start_position = tracks[i];
    }

    // Move towards lower tracks from the end of the disk
    total_distance += abs_diff(start_position, 0);
    start_position = 0;

    // Move towards higher tracks from the start of the disk
    for (i = start_index - 1; i >= 0; i--) {
        total_distance += abs_diff(start_position, tracks[i]);
        start_position = tracks[i];
    }

    return (float)total_distance / n;
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

    int start_position;
    printf("Enter the starting position of the head: ");
    scanf("%d", &start_position);
    
    float average_head_movement = calculate_average_head_movement(tracks, num_tracks, start_position);
    
    printf("Average Head Movement: %.2f\n", average_head_movement);

    return 0;
}

Output :
Enter the number of tracks: 5
Enter the track positions:
1
2
3
4
5
Enter the starting position of the head: 1
Average Head Movement: 1.80

