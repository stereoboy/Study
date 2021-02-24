#include<iostream>
#include<stdlib.h>
//#include<conio.h>
using namespace std;
int main()
{
    int count = 0;
    bool reset=false;
    while(1)
    {
        cout<<""<<count<<endl;
        if (reset==true)
            count = 0;

        count++;
        if(count > 15)
            count = 0;

        for(int i=0; i<450000000;i++);

    }
    return 0;
}
