#include<iostream> 
using namespace std;
int retval=0;
int calculate_sum(int n) {
int i = 0;
int sum = 0;
int t1 = 0;
int t2 = 0;
int t3 = 0;
int t4 = 0;
int t5 = 0;
int t6 = 0;
int t7 = 0;
int t8 = 0;
t1 = 0;
sum = t1;
t2 = 0;
i = t2;
L1: 
t3 = 0;
t3 = i < n;if ( t3) goto L2;goto L3;
L2: 
t5 = 0;
t5 = i < 5;if ( t5) goto L4;goto L5;
L4: 
t6 = 0;
t6 = sum + i;sum = t6;
goto L6;
L5: 
t7 = 0;
t7 = i + 10;t8 = 0;
t8 = sum + t7;sum = t8;
L6: 
t4 = 0;
t4 = i + 1;i = t4;
goto L1;
L3: 
retval = sum;
return retval;
}
int main() {
int limit = 0;
int result = 0;
int t10 = 0;
int t11 = 0;
int t12 = 0;
int t9 = 0;
t9 = 10;
limit = t9;
t10 = limit;
calculate_sum(t10);t11 = retval;
result = t11;
t12 = result;
printf("Final Sum: %d\n",t13);retval = 0;
return retval;
}
