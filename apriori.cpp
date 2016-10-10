/*Assignment Title : Implement Apriori approach for datamining to organize the data items on a shelf using following table of items purchased in a Mall.

*/

#include<iostream>
#include<cstring>
using namespace std;

int main()
{
	int i,j,k,l,f1,f2,f3,g1,g2,g3,nt=5,ni=6,nui=12;       // nt=No. of transaction ,ni=No. of itm set, nui= No. of unique itemset
	//Initial item-purchase
	char a[nt][ni][15],itmset[nui][15];
	char l1itmset[nui][15];
	int support[nui];  //support value

	cout<<"\n No. of transaction ";
	cin>>nt;
	cout<<"\n No. of itemset ";
	cin>>ni;

	cin.clear();

	for(i=0;i<nt;i++)
	{
		cout<<"\n Enter items from purchase "<<i+1<<":";
		for(j=0;j<ni;j++)
		{
			cin>>a[i][j];
			cin.clear();
		}
		cin.clear();
	}

//Initialization of support 

	for(i=0;i<nui;i++)
	{
		support[i]=0;
	}

	cout<<"\n No. of unique itemset ";
	cin>>nui;
	cout<<"\n Enter Unique item set :\n";

	for(j=0;j<nui;j++)
	{
		cout<<"\nItemset "<<j+1<<": ";
		cin>>itmset[j];
		cin.clear();
	}

	cout<<"\n Transaction Table :\n";
	cout<<"Transaction   ";
	
	for(i=0;i<ni;i++)
	{
		cout<<"\titem "<<i+1;
	}
	
	cout<<"\n------------------------------------------------------------\n";
	
	for(i=0;i<nt;i++)
	{
		cout<<"Transaction"<<i+1<<"   ";
		
		for(j=0;j<ni;j++)
		{
			cout<<a[i][j]<<"\t";
		}
		cout<<endl;
	}

	cout<<"\n------------------------------------------------------------\n";

	//Defining minimum level for acceptence
	
	int min;
	cout<<"\n Enter minimum acceptance level : ";
	cin>>min;
	
	for(i=0;i<nt;i++)
	{
		for(j=0;j<ni;j++)
		{
			for(k=0;k<nui;k++)
			{
				if(strcmp(a[i][j],itmset[k])==0)
				{
					support[k]++;
				}	
			}
		}
	}
	
	//disp
	cout<<"\nSupport Count of Itemset:\n";
	cout<<"\nITEMS\t\tSUPPORT\n------------------------------------------------------------\n";

	for(j=0;j<nui;j++)
	{
		cout<<itmset[j]<<"\t\t"<<support[j]<<"\n";
	}
	
	cout<<"\n------------------------------------------------------------\n";
	int count=0,cnt=0;
	cout<<"Generating level 1 Itemset:\n\n";
	cout<<"ITEMS\t\tSUPPORT\n------------------------------------------------------------\n";

	for(i=0;i<nui;i++)
	{
		if(support[i]>=min)
		{
			strcpy(l1itmset[count],itmset[i]);
			cout<<itmset[i]<<"\t\t"<<support[i]<<endl;
			count++;
		}
	}
	
	cout<<"\n------------------------------------------------------------";
	cout<<"\n Generating Level 2";
	cout<<"\n------------------------------------------------------------";
	cout<<"\nITEMS\t\tSUPPORT\n------------------------------------------------------------\n";

	for(i=0;i<count;i++)
	{
		   for(j=i+1;j<count;j++)
		   {
			cnt=0;	    // cout<<l1itmset[i]<<"   "<<l1itmset[j]<<"\n";
			for(k=0;k<nt;k++)
			{
				f1=0;f2=0;
				for(l=0;l<ni;l++)
				{
					if(strcmp(l1itmset[i],a[k][l])==0)
					{
						f1=1;
					}
					if((strcmp(l1itmset[j],a[k][l]))==0)
					{
						f2=1;
					}
					if(f1==1 && f2==1)
					{
						cnt++;
						f1=0;f2=0;
					}
				}
			}    		
		        cout<<l1itmset[i]<<"\t"<<l1itmset[j]<<"\t"<<cnt<<"\n";
   		   }
	}
	cout<<"\n------------------------------------------------------------";
	cout<<"\n Generating Level 3";
	cout<<"\n------------------------------------------------------------";
	cout<<"\nITEMS\t\tSUPPORT\n------------------------------------------------------------\n";

	for(i=0;i<count;i++)
	{
		   for(j=i+1;j<count;j++)
		   {
			cnt=0;	    // cout<<l1itmset[i]<<"   "<<l1itmset[j]<<"\n";
			for(k=0;k<nt;k++)
			{
				g1=0;g2=0;g3=0;
				for(l=0;l<ni;l++)
				{
					if(strcmp(l1itmset[i],a[k][l])==0)
					{
						g1=1;
					}
					if((strcmp(l1itmset[j],a[k][l]))==0)
					{
						g2=1;
					}
					if((strcmp(l1itmset[j],a[k][l]))==0)
					{
						g3=1;
					}
					int h= f1==1 && f2==1;
					if(h && f3==1)
					{
						cnt++;
						f1=0;f2=0;
					}
				}
			}    		
		        cout<<l1itmset[i]<<"\t"<<l1itmset[j]<<"\t"<<cnt<<"\n";
   		   }
	}

	cout<<"------------------------------------------------------------\n";
	return 0;
}


/*------------------Output---------------------------
swl-12@Comp-SWL-12:~$ cd be51
swl-12@Comp-SWL-12:~/be51$ g++ apriori.cpp
swl-12@Comp-SWL-12:~/be51$ ./a.out

 No. of transaction 4

 No. of itemset 4

 Enter items from purchase 1:a
b
c
-

 Enter items from purchase 2:a
c
-
-

 Enter items from purchase 3:a
d
-
-

 Enter items from purchase 4:b
e
f
-

 No. of unique itemset 6

 Enter Unique item set :

Itemset 1: a

Itemset 2: b

Itemset 3: c

Itemset 4: d

Itemset 5: e

Itemset 6: f

 Transaction Table :
Trancaction   	item 1	item 2	item 3	item 4
------------------------------------------------------------
Transaction1   a	b	c	-	
Transaction2   a	c	-	-	
Transaction3   a	d	-	-	
Transaction4   b	e	f	-	

------------------------------------------------------------

 Enter minimum acceptance level : 2

Support Count of Itemset:

ITEMS		SUPPORT
------------------------------------------------------------
a		3
b		2
c		2
d		1
e		1
f		1

------------------------------------------------------------
Generating level 1 Itemset:

ITEMS		SUPPORT
------------------------------------------------------------
a		3
b		2
c		2

------------------------------------------------------------
 Generating Level 2
------------------------------------------------------------
ITEMS		SUPPORT
------------------------------------------------------------
a	b	1
a	c	2
b	c	1
------------------------------------------------------------
swl-12@Comp-SWL-12:~/be51$ 


*/
