Write a C program to illustrate the Optimal  method of page replacement and determine the number of page faults for the following test case:
No of page frames: 3; Page reference sequence: 4, 1, 2, 4, 3, 2, 1 and 5.
#include <stdio.h>
#include <stdbool.h>

// Function to check if a page exists in the page frames
bool is_page_present(int page_frames[], int num_frames, int page) {
    for (int i = 0; i < num_frames; i++) {
        if (page_frames[i] == page) {
            return true;
        }
    }
    return false;
}

// Function to find the index of the page to be replaced with the Optimal method
int find_optimal_index(int page_frames[], int num_frames, int page_sequence[], int start_index, int num_pages) {
    int optimal_index = -1;
    int max_distance = -1;

    for (int i = 0; i < num_frames; i++) {
        int page = page_frames[i];
        int distance = -1;

        for (int j = start_index; j < num_pages; j++) {
            if (page_sequence[j] == page) {
                distance = j - start_index;
                break;
            }
        }

        if (distance == -1) {
            return i; // If a page is not referenced in the future, replace it
        }

        if (distance > max_distance) {
            max_distance = distance;
            optimal_index = i;
        }
    }

    return optimal_index;
}

// Function to simulate the Optimal page replacement algorithm
int optimal_page_replacement(int page_frames[], int num_frames, int page_sequence[], int num_pages) {
    int page_faults = 0;

    for (int i = 0; i < num_pages; i++) {
        int page = page_sequence[i];

        if (!is_page_present(page_frames, num_frames, page)) {
            int index = find_optimal_index(page_frames, num_frames, page_sequence, i + 1, num_pages);
            page_frames[index] = page;
            page_faults++;
        }
    }

    return page_faults;
}

int main() {
    int num_frames;

    printf("Enter the number of page frames: ");
    scanf("%d", &num_frames);

    int page_frames[num_frames];

    printf("Enter the page reference sequence (space-separated): ");
    for (int i = 0; i < num_frames; i++) {
        scanf("%d", &page_frames[i]);
    }

    int num_pages;

    printf("Enter the number of pages in the sequence: ");
    scanf("%d", &num_pages);

    int page_sequence[num_pages];

    printf("Enter the page sequence (space-separated): ");
    for (int i = 0; i < num_pages; i++) {
        scanf("%d", &page_sequence[i]);
    }

    int page_faults = optimal_page_replacement(page_frames, num_frames, page_sequence, num_pages);

    printf("Number of page faults: %d\n", page_faults);

    return 0;
}

output:
Number of page frames: 3
Page reference sequence: 4 1 2 4 3 2 1 5
