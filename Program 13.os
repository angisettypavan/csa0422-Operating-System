Write a C program to implement single-level directory system. In which all the files are placed in one directory   and there are no sub directories. 
Test Case: Create one directory with the name of CSE and Add 3 files(A,B,C) in to that directory

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_FILES 100
#define MAX_FILENAME_LENGTH 20
#define MAX_DIRECTORY_NAME_LENGTH 20

struct file {
    char name[MAX_FILENAME_LENGTH];
    int size;
};

struct directory {
    char name[MAX_DIRECTORY_NAME_LENGTH];
    struct file files[MAX_FILES];
    int num_files;
};

int create_directory(struct directory *dir, char *name) {
    if (strlen(name) >= MAX_DIRECTORY_NAME_LENGTH) {
        printf("Directory name too long\n");
        return 0;
    }
    strcpy(dir->name, name);
    dir->num_files = 0;
    return 1;
}

int add_file(struct directory *dir, char *name, int size) {
    if (strlen(name) >= MAX_FILENAME_LENGTH) {
        printf("Filename too long\n");
        return 0;
    }
    if (dir->num_files >= MAX_FILES) {
        printf("Too many files in directory\n");
        return 0;
    }
    strcpy(dir->files[dir->num_files].name, name);
    dir->files[dir->num_files].size = size;
    dir->num_files++;
    return 1;
}

int main() {
    struct directory cse_directory;
    create_directory(&cse_directory, "CSE");
    add_file(&cse_directory, "A", 100);
    add_file(&cse_directory, "B", 200);
    add_file(&cse_directory, "C", 300);

    printf("Directory: %s\n", cse_directory.name);
    printf("Files:\n");
    for (int i = 0; i < cse_directory.num_files; i++) {
        printf("%s (%d KB)\n", cse_directory.files[i].name, cse_directory.files[i].size);
    }
    return 0;
}
Output:
Directory: CSE
Files:
A (100 KB)
B (200 KB)
C (300 KB)
