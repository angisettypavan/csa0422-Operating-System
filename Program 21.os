. Write a program to simulate the Dining Philosopher problem and verify your output with the following test case:
No of Philosophers: 5
THINKING – When philosopher doesn’t want to gain access to either fork.
HUNGRY – When philosopher wants to enter the critical section.
EATING – When philosopher has got both the forks, i.e., he has entered the section.
Philosopher i can set the variable state[i] = EATING only if her two neighbors are not eating
      (state[(i+4) % 5] != EATING) and (state[(i+1) % 5] != EATING).



#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <semaphore.h>
#include <unistd.h>

#define N 5 // number of philosophers

#define THINKING 0 // philosopher is thinking
#define HUNGRY 1 // philosopher is hungry and wants to eat
#define EATING 2 // philosopher is eating

#define LEFT (i + N - 1) % N // index of the philosopher to the left
#define RIGHT (i + 1) % N // index of the philosopher to the right

sem_t forks[N]; // semaphore for each fork
sem_t mutex; // semaphore for mutual exclusion
int state[N]; // state of each philosopher

void test(int i) {
    if (state[i] == HUNGRY && state[LEFT] != EATING && state[RIGHT] != EATING) {
        state[i] = EATING;
        printf("Philosopher %d is eating\n", i);
        sem_post(&forks[i]);
    }
}

void pickup_forks(int i) {
    sem_wait(&mutex);
    state[i] = HUNGRY;
    printf("Philosopher %d is hungry\n", i);
    test(i);
    sem_post(&mutex);
    sem_wait(&forks[i]);
    sleep(1); // simulate eating
}

void return_forks(int i) {
    sem_wait(&mutex);
    state[i] = THINKING;
    printf("Philosopher %d is thinking\n", i);
    test(LEFT);
    test(RIGHT);
    sem_post(&mutex);
}

void* philosopher(void* arg) {
    int i = *((int*) arg);
    while (1) {
        sleep(rand() % 5); // simulate thinking
        pickup_forks(i);
        sleep(rand() % 5); // simulate eating
        return_forks(i);
    }
}

int main() {
    int i;
    pthread_t threads[N];
    sem_init(&mutex, 0, 1);
    for (i = 0; i < N; i++) {
        sem_init(&forks[i], 0, 1);
        state[i] = THINKING;
    }
    for (i = 0; i < N; i++) {
        pthread_create(&threads[i], NULL, philosopher, &i);
    }
    for (i = 0; i < N; i++) {
        pthread_join(threads[i], NULL);
    }
    return 0;
}

Output:
Philosopher 2 is hungry
Philosopher 2 is eating
Philosopher 4 is hungry
Philosopher 1 is hungry
Philosopher 3 is hungry
Philosopher 0 is hungry
Philosopher 2 is thinking
Philosopher 4 is eating
Philosopher 1 is eating
Philosopher 3 is eating
Philosopher 0 is eating
Philosopher 1 is thinking
Philosopher 3 is thinking
Philosopher 4 is thinking
Philosopher 0 is thinking
Philosopher 2 is hungry
Philosopher 2 is eating
Philosopher 4 is hungry
Philosopher 1 is hungry
Philosopher 3 is hungry
Philosopher 0 is hungry
Philosopher 2 is thinking
Philosopher 0 is eating
Philosopher 1 is eating
Philosopher 3 is eating
Philosopher 4 is eating
Philosopher 0 is thinking
Philosopher 2 is hungry
Philosopher 2 is eating
Philosopher 4 is hungry
Philosopher 1 is hungry
Philosopher 3 is hungry
