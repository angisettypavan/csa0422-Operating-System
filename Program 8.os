Write a C program to simulate FCFS disk scheduling algorithm and execute your program and find the average head movement with the following test case: 
No of tracks 5; Track position:55   58    60   70   18      

#include<stdlib.h>
int main()
{
    int RQ[100],i,n,TotalHeadMoment=0,initial;
    printf("Enter the number of Requests\n");
    scanf("%d",&n);
    printf("Enter the Requests sequence\n");
    for(i=0;i<n;i++)
     scanf("%d",&RQ[i]);
    printf("Enter initial head position\n");
    scanf("%d",&initial);
    for(i=0;i<n;i++)
    {
        TotalHeadMoment=TotalHeadMoment+abs(RQ[i]-initial);
        initial=RQ[i];
    }
    
    printf("Total head moment is %d",TotalHeadMoment);
    return 0;
    
}

Output:
Enter the number of Requests
2
Enter the Requests sequence
5
5
Enter initial head position
5
Total head moment is 0
