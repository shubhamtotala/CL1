/*Assignment no.:
Title : Implement Apriori approach for datamining to organize the data items on a shelf using following table of items purchased in a Mall.
Batch:
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

	cout<<"\n No. of unique items ";
	cin>>nui;
	cout<<"\n Enter names of Unique items  :\n";

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
	cout<<"\n Enter minimum support : ";
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
	
	cout<<"------------------------------------------------------------\n";
	return 0;
}


/*------------------Output---------------------------
swl-12@Comp-SWL-12:~$ cd be51
swl-12@Comp-SWL-12:~/be51$ g++ apriori.cpp
swl-12@Comp-SWL-12:~/be51$ ./a.out

 No. of transaction 5

 No. of itemset 6

 Enter items from purchase 1:Mango
onion
jar
key-chain
eggs
chocolates

 Enter items from purchase 2:nuts
onion
jar
key-chain
eggs
chocolates

 Enter items from purchase 3:mango
apple
key-chain
eggs
-
-

 Enter items from purchase 4:mango
toothbrush
corn
key-chain
chocolates
-

 Enter items from purchase 5:corn
onion
onion
key-chain               
knife
eggs

 No. of unique itemset 11

 Enter Unique item set :

Itemset 1: mango

Itemset 2: onion

Itemset 3: jar

Itemset 4: key-chain

Itemset 5: eggs

Itemset 6: chocolates

Itemset 7: nuts

Itemset 8: apple

Itemset 9: toothbrush

Itemset 10: corn

Itemset 11: knife

 Transaction Table :
Transaction   	item 1	item 2	item 3	item 4	item 5	item 6
------------------------------------------------------------
Transaction1   Mango	onion	jar	key-chain	eggs	chocolates	
Transaction2   nuts	onion	jar	key-chain	eggs	chocolates	
Transaction3   mango	apple	key-chain	eggs	-	-	
Transaction4   mango	toothbrush	corn	key-chain	chocolates	-
Transaction5   corn	chocolates	onion	key-chain	knife	eggs	

------------------------------------------------------------

 Enter minimum acceptance level : 3

Support Count of Itemset:

ITEMS		SUPPORT
------------------------------------------------------------
mango			2
onion			3
jar			2
key-chain		5
eggs			4
chocolates		4
nuts			1
apple			1
toothbrush		1
corn			2
knife			1

------------------------------------------------------------
Generating level 1 Itemset:

ITEMS		SUPPORT
------------------------------------------------------------
onion			3
key-chain		5
eggs			4
chocolates		4

------------------------------------------------------------
 Generating Level 2
------------------------------------------------------------
ITEMS			SUPPORT
------------------------------------------------------------
onion	key-chain		3
onion	eggs			3
onion	chocolates		3
key-chain	eggs		4
key-chain	chocolates	3
eggs	chocolates		3
------------------------------------------------------------
swl-12@Comp-SWL-12:~/be51$ 
*/
