#include<iostream> 
using namespace std;
int retval=0;
int sum_of_numbers(int n) {
int i = 0;
int t1 = 0;
int t2 = 0;
int t3 = 0;
int t4 = 0;
int t5 = 0;
int total = 0;
t1 = 0;
total = t1;
t2 = 0;
i = t2;
L1: 
t3 = 0;
t3 = i < n;if ( t3) goto L2;goto L3;
L2: 
t5 = 0;
t5 = total + i;total = t5;
t4 = 0;
t4 = i + 1;i = t4;
goto L1;
L3: 
retval = total;
return retval;
}
int main() {
int result = 0;
int t6 = 0;
int t7 = 0;
int t8 = 0;
t6 = 10;
sum_of_numbers(t6);t7 = retval;
result = t7;
t8 = result;
printf("Sum of numbers: %d\n",t9);retval = 0;
return retval;
}
