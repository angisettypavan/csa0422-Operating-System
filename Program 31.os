Write a C program to simulate CSCAN disk scheduling algorithms and execute your program and find out and print the average head movement for the following test case.
 No of tracks:5; Track position:55   58 60    70    18

#include <stdio.h>
#include <stdlib.h>

int abs_diff(int a, int b) {
    return abs(a - b);
}

void cscan(int tracks[], int n, int initial_pos) {
    int total_head_movement = 0;
    int current_pos = initial_pos;
    int direction = 1;  

    
    for (int i = 0; i < n - 1; i++) {
        for (int j = 0; j < n - i - 1; j++) {
            if (tracks[j] > tracks[j + 1]) {
                int temp = tracks[j];
                tracks[j] = tracks[j + 1];
                tracks[j + 1] = temp;
            }
        }
    }

    
    int initial_pos_index = 0;
    while (tracks[initial_pos_index] < initial_pos && initial_pos_index < n) {
        initial_pos_index++;
    }

    
    for (int i = initial_pos_index; i < n; i++) {
        total_head_movement += abs_diff(current_pos, tracks[i]);
        current_pos = tracks[i];
    }

    
    total_head_movement += abs_diff(current_pos, 0);
    current_pos = 0;

    for (int i = 0; i < initial_pos_index; i++) {
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

    cscan(tracks, num_tracks, initial_position);

    return 0;
}
Output :
Enter the number of tracks: 2
Enter the track positions:
1
2
Enter the initial position: 2
Average head movement: 1.50
