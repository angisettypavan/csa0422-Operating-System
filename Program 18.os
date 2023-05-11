. Write a program for solving the producer consumer problem with the following scenario: The producer should produce data only when the buffer is not full. Data can only be consumed by the consumer if and only if the memory buffer is not empty.
Test Case:
Buffer Size: 3
Consume an item in the beginning and show that the buffer is EMPTY
Produce 4 items and show that the buffer is FULL


#include <stdio.h>
#include <pthread.h>

#define BUFFER_SIZE 3

int buffer[BUFFER_SIZE];
int count = 0, in = 0, out = 0;

pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
pthread_cond_t buffer_not_full = PTHREAD_COND_INITIALIZER;
pthread_cond_t buffer_not_empty = PTHREAD_COND_INITIALIZER;

void *producer(void *arg)
{
    int i, data;

    for (i = 0; i < 4; i++) {
        data = i + 1;

        pthread_mutex_lock(&mutex);
        while (count == BUFFER_SIZE) {
            printf("Buffer is full. Producer waiting...\n");
            pthread_cond_wait(&buffer_not_full, &mutex);
        }

        buffer[in] = data;
        in = (in + 1) % BUFFER_SIZE;
        count++;

        printf("Produced item: %d\n", data);

        pthread_cond_signal(&buffer_not_empty);
        pthread_mutex_unlock(&mutex);
    }

    pthread_exit(NULL);
}

void *consumer(void *arg)
{
    int i, data;

    for (i = 0; i < 1; i++) {
        pthread_mutex_lock(&mutex);
        while (count == 0) {
            printf("Buffer is empty. Consumer waiting...\n");
            pthread_cond_wait(&buffer_not_empty, &mutex);
        }

        data = buffer[out];
        out = (out + 1) % BUFFER_SIZE;
        count--;

        printf("Consumed item: %d\n", data);

        pthread_cond_signal(&buffer_not_full);
        pthread_mutex_unlock(&mutex);
    }

    pthread_exit(NULL);
}

int main()
{
    pthread_t producer_thread, consumer_thread;

    // Initialize buffer with all zeros
    for (int i = 0; i < BUFFER_SIZE; i++) {
        buffer[i] = 0;
    }

    // Consume an item in the beginning
    pthread_create(&consumer_thread, NULL, consumer, NULL);
    pthread_join(consumer_thread, NULL);

    // Produce 4 items
    pthread_create(&producer_thread, NULL, producer, NULL);
    pthread_join(producer_thread, NULL);

    return 0;
}

Output:
Buffer is empty. Consumer waiting...
