Write a C program to implement single-level directory system. In which all the files are placed in one directory   and there are no sub directories. 
Test Case: Create one directory with the name of CSE and Add 3 files(A,B,C) in to that directory



#include<stdio.h>
#include<conio.h>
#include<string.hEnter the directory name:sss
Enter the number of files:3
Enter file name to be created:aaa
Do you want to enter another file(yes - 1 or no - 0):1
Enter file name to be created:bbb
Do you want to enter another file(yes - 1 or no - 0):1
Enter file name to be created:ccc
Do you want to enter another file(yes - 1 or no - 0):0
Directory name is:sss
Files names are:
aaa
bbb
ccc
void main()
{
int nf=0,i=0,j=0,ch;
char mdname[10],fname[10][10],name[10];
clrscr();
printf("Enter the directory name:");
scanf("%s",mdname);
printf("Enter the number of files:");
scanf("%d",&nf);
do
{
printf("Enter file name to be created:");
scanf("%s",name);
for(i=0;i<nf;i++)
{
if(!strcmp(name,fname[i]))
break;
}
if(i==nf)
{
strcpy(fname[j++],name);
nf++;
}
else
printf("There is already %s\n",name);
printf("Do you want to enter another file(yes - 1 or no - 0):");
scanf("%d",&ch);
}
while(ch==1);
printf("Directory name is:%s\n",mdname);
printf("Files names are:");
for(i=0;i<j;i++)
printf("\n%s",fname[i]);
getch();
}

 Output:
 
 Enter the directory name:sss
Enter the number of files:3
Enter file name to be created:aaa
Do you want to enter another file(yes - 1 or no - 0):1
Enter file name to be created:bbb
Do you want to enter another file(yes - 1 or no - 0):1
Enter file name to be created:ccc
Do you want to enter another file(yes - 1 or no - 0):0
Directory name is:sss
Files names are:
aaa
bbb
ccc
