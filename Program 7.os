Write a C program to illustrate the page replacement method where the current least recently used element is replaced and determine the number of page faults for the following test case:
No. of page frames: 3; Page reference sequence 1,2,3,2,1,5,2,1,6,2,5,6,3,1,3,6,1,2,4 and 3.


#include<stdio.h>
int main()
{
    int i,j,k,n,fault=0;
    printf("Enter no of pages:");
    scanf("%d",&n);
    int p[n];
    printf("Enter page reference sequence:");
    for(i=0;i<n;i++)
        scanf("%d",&p[i]);
    printf("Enter no of page frames:");
    scanf("%d",&k);
    int f[k],count[k];
    for(i=0;i<k;i++)
        f[i]=-1;
    for(i=0;i<k;i++)
        count[i]=0;
    for(i=0;i<n;i++)
    {
        int flag=0;
        for(j=0;j<k;j++)
        {
            if(f[j]==p[i])
            {
                flag=1;
                count[j]++;
                break;
            }
        }
        if(flag==0)
        {
            int min=count[0],pos=0;
            for(j=1;j<k;j++)
            {
                if(count[j]<min)
                {
                    min=count[j];
                    pos=j;
                }
            }
            f[pos]=p[i];
            count[pos]=1;
            fault++;
        }
    }
    printf("Number of page faults:%d",fault);
}

Output:
Enter no of pages:19
Enter page reference sequence:1 2 3 2 1 5 2 1 6 2 5 6 3 1 3 6 1 2 4
Enter no of page frames:3
Number of page faults:11
