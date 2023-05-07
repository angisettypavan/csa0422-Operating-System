Write a C program to illustrate the page replacement method where the page which is not in demand for the longest future time is replaced by the new page and determine the number of page faults for the following test case: 
No. of page frames: 3; Page reference sequence 7,0,1,2,0,3,0,4,2,3,0,3,2,1,2,0,1,7,0 and 1.

#include <stdio.h>

#define MAX_FRAMES 3
#define MAX_REFERENCES 19

int main() {
    int frames[MAX_FRAMES];
    int references[MAX_REFERENCES] = {7, 0, 1, 2, 0, 3, 0, 4, 2, 3, 0, 3, 2, 1, 2, 0, 1, 7, 0, 1};
    int num_references = MAX_REFERENCES;
    int num_frames = MAX_FRAMES;
    int page_faults = 0;

    for (int i = 0; i < num_frames; i++) {
        frames[i] = -1;  // initialize all frames to -1
    }

    for (int i = 0; i < num_references; i++) {
        int page = references[i];
        int found = 0;

        // Check if page is already in frames
        for (int j = 0; j < num_frames; j++) {
            if (frames[j] == page) {
                found = 1;
                break;
            }
        }

        // If page is not in frames, replace page that will not be used for longest time
        if (!found) {
            int replace = -1;
            int farthest = i + 1;
            for (int j = 0; j < num_frames; j++) {
                int k;
                for (k = i + 1; k < num_references; k++) {
                    if (frames[j] == references[k]) {
                        if (k > farthest) {
                            farthest = k;
                            replace = j;
                        }
                        break;
                    }
                }
                if (k == num_references) {
                    replace = j;
                    break;
                }
            }
            frames[replace] = page;
            page_faults++;
        }
    }

    printf("Number of page faults: %d\n", page_faults);

    return 0;
}

Output:
Number of page faults: 9

