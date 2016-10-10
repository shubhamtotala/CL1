#include <iostream>
#include<stdlib.h>
#include <omp.h>
using namespace std;

class quick_sort
{
	int a[1000];
	int n;
	
	public:
	void get_array()
	{
		cout<<"enter n\n";
		cin>>n;
		//cout<<"enter array\n";
		for(int i=0;i<n;i++)
			a[i]=rand()%1000;
	}

	void disp_array()
	{
		cout<<"array is\n";
		for(int i=0;i<n;i++)
			cout<<a[i]<<" ";
	}

int partition(int p, int r)
{
    int lt[r-p];
    int gt[r-p];
    int i;
    int j;
    int key = a[r];
    int lt_n = 0;
    int gt_n = 0;

#pragma omp parallel for
    for(i = p; i < r; i++){
        if(a[i] < key){
            lt[lt_n++] = a[i];
        }else{
            gt[gt_n++] = a[i];
        }   
    }   
#pragma omp parallel for
    for(i = 0; i < lt_n; i++){
        a[p + i] = lt[i];
    }   

    a[p + lt_n] = key;
#pragma omp parallel for
    for(j = 0; j < gt_n; j++){
        a[p + lt_n + j + 1] = gt[j];
    }   

    return p + lt_n;
}

void quicksort()
{
	quicksort(0,n-1);
}

void quicksort(int p, int r)
{
    int div;

    if(p < r){ 
        div = partition(p, r); 
#pragma omp parallel sections
        {   
#pragma omp section
{
cout<<"\nthread is "<<omp_get_thread_num()<<endl;
            quicksort(p, div - 1); 
}
#pragma omp section
{
cout<<"\nthread is "<<omp_get_thread_num()<<endl;
            quicksort(div + 1, r); 
}
        }
    }
}

};

int main(void)
{
	quick_sort q;

	q.get_array();
	q.quicksort();
	q.disp_array();
	return 0;
} 
