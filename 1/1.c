#include<stdio.h>
void main()
{
int f=0,n;
printf("enter the array size");
scanf("%d",&n);
int a[n];

printf("enter the array");
	for(int i=0;i<n;i++)
		{
			scanf("%d",&a[i]);
		}
	
printf("you are having following array");
for(int i=0;i<n;i++)
		{
			printf("\n %d",a[i]);
		}
int h=9,l=0,m;
int k;
printf("\n enter the number to search");
scanf("%d",&k);
while(h>=l)
{
	m=(h+l)/2;
	if(k==a[m])
	{
		f=1;
		printf("\nelement found at position%d",m+1);
		break;
	}

	if(k<a[m])
	h=m-1;
	if(k>a[m])
	l=m+1;
}
if(f==0)
printf("\nelement not found\n");
}

