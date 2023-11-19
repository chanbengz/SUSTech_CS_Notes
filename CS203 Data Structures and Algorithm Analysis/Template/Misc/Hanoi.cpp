#include <iostream>
using namespace std;

void hanoi(int n, char A,char B,char C){
  if(n==1){
    cout<<A<<" -> "<<C<<endl;//move A to C
  } else{
    hanoi(n-1,A,C,B);// move A to B, using C
    cout<<A<<" -> "<<C<<endl;//then move A to C
    hanoi(n-1,B,A,C);//move B to C, using A
  }
}

int main(){
    int n;
    cin>>n;
    hanoi(n,'A','B','C');
    return 0;
}
