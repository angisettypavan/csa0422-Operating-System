Write a C program to create two threads to access shared memory which is an integer in a synchronized fashion using semaphore. In the first thread print the doubled the integer
data after reading from the shared memory. In the second thread, print the five times of the integer data after reading from the shared memory
Program :
#include <stdio.h>
#include <pthread.h>
#include <semaphore.h>

int shared_data;
sem_t semaphore;

void *thread1(void *arg)
{
    int local_data;

    // Read shared data
    sem_wait(&semaphore);
    local_data = shared_data;
    sem_post(&semaphore);

    // Double the data
    local_data *= 2;

    // Print the result
    printf("Thread 1: Doubled data = %d\n", local_data);

    pthread_exit(NULL);
}

void *thread2(void *arg)
{
    int local_data;

    // Read shared data
    sem_wait(&semaphore);
    local_data = shared_data;
    sem_post(&semaphore);

    // Multiply the data by 5
    local_data *= 5;

    // Print the result
    printf("Thread 2: Five times data = %d\n", local_data);

    pthread_exit(NULL);
}

int main()
{
    pthread_t tid1, tid2;

    // Initialize shared data and semaphore
    shared_data = 10;
    sem_init(&semaphore, 0, 1);

    // Create threads
    pthread_create(&tid1, NULL, thread1, NULL);
    pthread_create(&tid2, NULL, thread2, NULL);

    // Wait for threads to complete
    pthread_join(tid1, NULL);
    pthread_join(tid2, NULL);

    // Destroy semaphore
    sem_destroy(&semaphore);

    return 0;
}


Output :
Thread 1: Doubled data = 20
Thread 2: Five times data = 50
