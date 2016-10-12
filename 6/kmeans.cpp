Assignment No.:
Title: Implement a simple approach for k-means clustering using C++. 
Batch :
**********************************************************************
#include<iostream>
using namespace std;
  static int count1,count2,count3;
  static int d[20];
  static int k[20][20];
  static int tempk[20][20];
  static double m[20];
  static double diff[20];
  static int n,p;

 

  static int cal_diff(int a) // This method will determine the cluster in which an element go at a particular step.
   {
	int temp1=0;
	for(int i=0;i<p;++i)
	  {
		if(a>m[i])
			diff[i]=a-m[i];
		else
			diff[i]=m[i]-a;
	  }
	
	int val=0;
	double temp=diff[0];
	for(int i=0;i<p;++i)
	  {
		if(diff[i]<temp)
  		  {
			temp=diff[i];
			val=i;
		  }
	  }
	return val;
   }

static void cal_mean() // This method will determine intermediate mean values
  {
	for(int i=0;i<p;++i)
		m[i]=0; // initializing means to 0
	int cnt=0;
	for(int i=0;i<p;++i)
	  {
  		cnt=0;
		for(int j=0;j<n-1;++j)
		  {
			if(k[i][j]!=-1)
			  {
				m[i]+=k[i][j];
				++cnt;
			  }
		  }
		m[i]=m[i]/cnt;
	  }
  }

static int check1() // This checks if previous k ie. tempk and current k are same.Used as terminating case.
  {
	for(int i=0;i<p;++i)
		for(int j=0;j<n;++j)
			if(tempk[i][j]!=k[i][j])
			{
				return 0;
			}
			return 1;
  }

 main()
{

	/* Accepting number of elements */
	cout<<"\nEnter the number of elements ";
	cin>>n;
	/* Accepting elements */
	cout<<"\nEnter "<<n<<" elements: ";
	for(int i=0;i<n;++i)
		cin>>d[i];
	/* Accepting num of clusters */
	cout<<"\nEnter the number of clusters: ";
	cin>>p;
	/* Initialising arrays */
	/* Initializing m */
	for(int i=0;i<p;++i)
		m[i]=d[i];

	int temp=0;
	int flag=0;
	do
	{
		for(int i=0;i<p;++i)
			for(int j=0;j<n;++j)
			{
				k[i][j]=-1;
			}
	  	for(int i=0;i<n;++i) // for loop will cal cal_diff(int) for every element.
		{
			temp=cal_diff(d[i]);
			if(temp==0)
				k[temp][count1++]=d[i];
			else
				if(temp==1)
					k[temp][count2++]=d[i];
				else
					if(temp==2)
						k[temp][count3++]=d[i]; 
		}
		cal_mean(); // call to method which will calculate mean at this step.
		flag=check1(); // check if terminating condition is satisfied.
		if(flag!=1) /*Take backup of k in tempk so that you can check for equivalence in next step*/
			for(int i=0;i<p;++i)
				for(int j=0;j<n;++j)
					tempk[i][j]=k[i][j];

		cout<<"\n\nAt this step";
		cout<<"\nValue of clusters";
		for(int i=0;i<p;++i)
		{
			cout<<"\nK"<<(i+1)<<" ={ ";
			for(int j=0;k[i][j]!=-1 && j<n-1;++j)
				cout<<k[i][j]<<" ";
			cout<<"}";
		}//end of for loop
		cout<<"\nValue of m\n ";
		for(int i=0;i<p;++i)
			cout<<"m"<<(i+1)<<"="<<m[i]<<"  ";

		count1=0;count2=0;count3=0;
	}while(flag==0);

	cout<<"\n\n\nThe Final Clusters By Kmeans are as follows: ";
	for(int i=0;i<p;++i)
	{
		cout<<"\nK"<<(i+1)<<" ={ ";
		for(int j=0;k[i][j]!=-1 && j<n-1;++j)
			cout<<k[i][j]<<" ";
		cout<<"}";
	}
}

**********************************************************************
Output :-
swl-12@Comp-SWL-12:~/be51$ g++ kmeans.cpp
swl-12@Comp-SWL-12:~/be51$ ./a.out

Enter the number of elements 9

Enter 9 elements: 2
3
4
5
12
13
14
15
16

Enter the number of clusters: 3


At this step
Value of clusters
K1 ={ 2 }
K2 ={ 3 }
K3 ={ 4 5 12 13 14 15 16 }
Value of m
 m1=2  m2=3  m3=11.2857  

At this step
Value of clusters
K1 ={ 2 }
K2 ={ 3 4 5 }
K3 ={ 12 13 14 15 16 }
Value of m
 m1=2  m2=4  m3=14  

At this step
Value of clusters
K1 ={ 2 3 }
K2 ={ 4 5 }
K3 ={ 12 13 14 15 16 }
Value of m
 m1=2.5  m2=4.5  m3=14  

At this step
Value of clusters
K1 ={ 2 3 }
K2 ={ 4 5 }
K3 ={ 12 13 14 15 16 }
Value of m
 m1=2.5  m2=4.5  m3=14  


The Final Clusters By Kmeans are as follows: 
K1 ={ 2 3 }
K2 ={ 4 5 }
K3 ={ 12 13 14 15 16 }
swl-12@Comp-SWL-12:~/be51$ 


*/
