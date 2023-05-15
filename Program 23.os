Write a C program to simulate SCAN disk   scheduling algorithms. and execute your program and find out and print the average head movement for the following test case.
No of tracks:5; Track position:55 58 	60 70 18
Code:
#include <stdio.h>
#include <stdlib.h>

// Define the maximum number of tracks
#define MAX_TRACKS 100

int main()
{
    // Declare variables
    int n, head, i, j, temp, tot_movement = 0;
    int tracks[MAX_TRACKS];

    // Read in the number of tracks and the head position
    printf("Enter the number of tracks: ");
    scanf("%d", &n);
    printf("Enter the head position: ");
    scanf("%d", &head);

    // Read in the track positions
    printf("Enter the track positions:\n");
    for (i = 0; i < n; i++) {
        scanf("%d", &tracks[i]);
    }

    // Sort the track positions
    for (i = 0; i < n-1; i++) {
        for (j = 0; j < n-i-1; j++) {
            if (tracks[j] > tracks[j+1]) {
                temp = tracks[j];
                tracks[j] = tracks[j+1];
                tracks[j+1] = temp;
            }
        }
    }

    // Find the index of the head position
    for (i = 0; i < n; i++) {
        if (tracks[i] >= head) {
            break;
        }
    }

    // Check the direction of the movement
    int direction;
    if (i == 0) {
        direction = 1; // move right
    } else if (i == n) {
        direction = -1; // move left
    } else {
        direction = 1; // move right
    }

    // Simulate the disk scheduling algorithm
    printf("Sequence of tracks visited:\n");
    if (direction == 1) { // move right
        for (j = i; j < n; j++) {
            printf("%d ", tracks[j]);
            tot_movement += abs(tracks[j] - head);
            head = tracks[j];
        }
        for (j = n-1; j >= i; j--) {
            printf("%d ", tracks[j]);
            tot_movement += abs(tracks[j] - head);
            head = tracks[j];
        }
    } else { // move left
        for (j = i-1; j >= 0; j--) {
            printf("%d ", tracks[j]);
            tot_movement += abs(tracks[j] - head);
            head = tracks[j];
        }
        for (j = 0; j < i; j++) {
            printf("%d ", tracks[j]);
            tot_movement += abs(tracks[j] - head);
            head = tracks[j];
        }
    }
    printf("\n");

    // Print the average head movement
    float avg_movement = (float) tot_movement / n;
    printf("Average head movement: %.2f\n", avg_movement);

    return 0;
}



Output :
Enter the number of tracks: 5
Enter the head position: 50
Enter the track positions:
55
58
60
70
18
Sequence of tracks visited:
55 58 60 70 70 60 58 55
Average head movement: 7.00
