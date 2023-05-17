. Write a C Program to create two threads and print even numbers with one thread and odd numbers   with another thread

Code :
#include <stdio.h>
#include <pthread.h>

// Function to print even numbers
void *printEvenNumbers(void *arg) {
    int i;
    for (i = 0; i <= 10; i += 2) {
        printf("Even Number: %d\n", i);
    }
    return NULL;
}

// Function to print odd numbers
void *printOddNumbers(void *arg) {
    int i;
    for (i = 1; i <= 10; i += 2) {
        printf("Odd Number: %d\n", i);
    }
    return NULL;
}

int main() {
    pthread_t thread1, thread2;

    // Create thread to print even numbers
    if (pthread_create(&thread1, NULL, printEvenNumbers, NULL) != 0) {
        printf("Failed to create thread1.\n");
        return 1;
    }

    // Create thread to print odd numbers
    if (pthread_create(&thread2, NULL, printOddNumbers, NULL) != 0) {
        printf("Failed to create thread2.\n");
        return 1;
    }

    // Wait for both threads to finish
    pthread_join(thread1, NULL);
    pthread_join(thread2, NULL);

    return 0;
}

Output :
Even Number: 0
Odd Number: 1
Even Number: 2
Odd Number: 3
Even Number: 4
Odd Number: 5
Even Number: 6
Odd Number: 7
Even Number: 8
Odd Number: 9
Even Number: 10

