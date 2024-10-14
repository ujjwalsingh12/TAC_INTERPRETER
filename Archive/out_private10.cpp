#include<iostream> 
using namespace std;
int retval=0;
int main() {
int i = 0;
int limit = 0;
int number = 0;
int step = 0;
int sum = 0;
int t1 = 0;
int t10 = 0;
int t2 = 0;
int t3 = 0;
int t4 = 0;
int t5 = 0;
int t6 = 0;
int t7 = 0;
int t8 = 0;
int t9 = 0;
int var = 0;
t1 = 0;
i = t1;
t2 = 5;
number = t2;
t3 = 25;
limit = t3;
t4 = 0;
sum = t4;
t5 = 1;
step = t5;
t6 = 0;
i = t6;
L1: 
t7 = 0;
t7 = i < limit;if ( t7) goto L2;goto L3;
L2: 
t9 = 0;
t9 = sum + number;sum = t9;
t8 = 0;
t8 = i + step;i = t8;
goto L1;
L3: 
t10 = sum;
var = t10;
retval = var;
return retval;
}
