Write a C program to implement the two-level directory system. 
Test Case: 
3 user directories have to be created with name of user1, user2, user3 and also to create 3 files with user1 directory,2 files with user2 and user3 directory

Code :
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_USERS 10
#define MAX_FILES 10
#define MAX_NAME_LEN 20

struct file {
    char name[MAX_NAME_LEN];
};

struct user {
    char name[MAX_NAME_LEN];
    struct file files[MAX_FILES];
    int num_files;
};

struct directory {
    struct user users[MAX_USERS];
    int num_users;
};

struct directory root;

struct user* find_user(char* username) {
    int i;
    for (i = 0; i < root.num_users; i++) {
        if (strcmp(root.users[i].name, username) == 0) {
            return &root.users[i];
        }
    }
    return NULL;
}

int create_user(char* username) {
    if (root.num_users >= MAX_USERS) {
        printf("Error: Maximum number of users reached\n");
        return 0;
    }
    if (find_user(username) != NULL) {
        printf("Error: User '%s' already exists\n", username);
        return 0;
    }
    struct user user = {0};
    strcpy(user.name, username);
    root.users[root.num_users++] = user;
    return 1;
}

struct file* find_file(char* username, char* filename) {
    struct user* user = find_user(username);
    if (user == NULL) {
        printf("Error: User '%s' not found\n", username);
        return NULL;
    }
    int i;
    for (i = 0; i < user->num_files; i++) {
        if (strcmp(user->files[i].name, filename) == 0) {
            return &user->files[i];
        }
    }
    return NULL;
}

int create_file(char* username, char* filename) {
    struct user* user = find_user(username);
    if (user == NULL) {
        printf("Error: User '%s' not found\n", username);
        return 0;
    }
    if (user->num_files >= MAX_FILES) {
        printf("Error: Maximum number of files reached for user '%s'\n", username);
        return 0;
    }
    if (find_file(username, filename) != NULL) {
        printf("Error: File '%s' already exists for user '%s'\n", filename, username);
        return 0;
    }
    struct file file = {0};
    strcpy(file.name, filename);
    user->files[user->num_files++] = file;
    return 1;
}

void list_files(char* username) {
    struct user* user = find_user(username);
    if (user == NULL) {
        printf("Error: User '%s' not found\n", username);
        return;
    }
    int i;
    for (i = 0; i < user->num_files; i++) {
        printf("%s\n", user->files[i].name);
    }
}

int main() {
    create_user("user1");
    create_user("user2");
    create_user("user3");
    create_file("user1", "file1");
    create_file("user1", "file2");
    create_file("user1", "file3");
    create_file("user2", "file4");
    create_file("user2", "file5");
    create_file("user3", "file6");
    list_files("user1");
    list_files("user2");
    list_files("user3");
    return 0;
}

Output:
file1
file2
file3
file4
file5
