Write a C program to create a file using the system call. Read the data from the user and write the same in the file. Also, Read the data from the file and print 
the same in the consoleenter the text.press cntrl Z:
#include <stdio.h>
#include <stdlib.h>

int main() {
    FILE *file;
    char data[100];

    // Open file for writing
    file = fopen("example.txt", "w");
    if (file == NULL) {
        printf("Unable to create the file.\n");
        return 1;
    }

    // Read data from the user and write it to the file
    printf("Enter data: ");
    fgets(data, sizeof(data), stdin);
    fprintf(file, "%s", data);
    printf("Data written to the file successfully.\n");

    // Close the file
    fclose(file);

    // Open the file for reading
    file = fopen("example.txt", "r");
    if (file == NULL) {
        printf("Unable to open the file.\n");
        return 1;
    }

    // Read data from the file and print it to the console
    printf("Contents of the file:\n");
    while (fgets(data, sizeof(data), file) != NULL) {
        printf("%s", data);
    }

    // Close the file
    fclose(file);

    return 0;
}

Output:
Name,Item,Price
Bhanu,1,23.4
Priya,2,45.6
^Z
text on the file:
Name    Item    Price
Bhanu    1      23.4
Priya    2      45.6
