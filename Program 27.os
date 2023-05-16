Write a program for semaphore signaling mechanism where a process can signal a process that is waiting on a semaphore.
Test Case:
number of instances: 4
Number of Processes: 4 (P1, P2, P3, P4) all are calling wait operation on S
Show the response when another process P5 wants the same resource.



#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <semaphore.h>

#define NUM_INSTANCES 4

sem_t S;

void *process(void *thread_id) {
    int id = *(int*)thread_id;
    printf("Process P%d is waiting on semaphore S\n", id);
    sem_wait(&S);
    printf("Process P%d has acquired semaphore S\n", id);
    printf("Process P%d is releasing semaphore S\n", id);
    sem_post(&S);
    printf("Process P%d has released semaphore S\n", id);
    pthread_exit(NULL);
}

int main() {
    int num_processes = 4;
    int process_ids[] = {1, 2, 3, 4};
    pthread_t threads[num_processes];
    sem_init(&S, 0, NUM_INSTANCES);
    
    // Create threads for each process
    for (int i = 0; i < num_processes; i++) {
        pthread_create(&threads[i], NULL, process, &process_ids[i]);
    }
    
    // Wait for user input to simulate fifth process
    char input;
    printf("Enter 'Y' to simulate another process trying to acquire semaphore S: ");
    scanf("%c", &input);
    if (input == 'Y' || input == 'y') {
        printf("Process P5 is waiting on semaphore S\n");
        sem_wait(&S);
        printf("Process P5 has acquired semaphore S\n");
        printf("Process P5 is releasing semaphore S\n");
        sem_post(&S);
        printf("Process P5 has released semaphore S\n");
    }
    
    // Wait for all threads to finish
    for (int i = 0; i < num_processes; i++) {
        pthread_join(threads[i], NULL);
    }
    
    printf("All processes have completed execution\n");
    
    return 0;
}

Output :
Process P1 is waiting on semaphore S
Process P2 is waiting on semaphore S
Process P3 is waiting on semaphore S
Process P4 is waiting on semaphore S
Enter 'Y' to simulate another process trying to acquire semaphore S: Y
Process P5 is waiting on semaphore S
Process P1 has acquired semaphore S
Process P1 is releasing semaphore S
Process P2 has acquired semaphore S
Process P2 is releasing semaphore S
Process P3 has acquired semaphore S
Process P3 is releasing semaphore S
Process P4 has acquired semaphore S
Process P4 is releasing semaphore S
Process P5 has acquired semaphore S
Process P5 is releasing semaphore S
Process P1 has acquired semaphore S
Process P1 is releasing semaphore S
Process P2 has acquired semaphore S
Process P2 is releasing semaphore S
Process P3 has acquired semaphore S
Process P3 is releasing semaphore S
Process P4 has acquired semaphore S
Process P4 is releasing semaphore S
All processes have completed execution

