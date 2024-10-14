#include<iostream> 
using namespace std;
int retval=0;
int different_addition(int funkyValue,int oddLimit) {
int funnySum = 0;
int t1 = 0;
int t2 = 0;
int t3 = 0;
int t4 = 0;
int t5 = 0;
int t6 = 0;
int t7 = 0;
int t8 = 0;
t1 = 0;
funnySum = t1;
t2 = 0;
t2 = funkyValue > oddLimit;if ( t2) goto L1;goto L2;
L1: 
t3 = 0;
t3 = funkyValue + oddLimit;t4 = 0;
t4 = t3 + 3;funnySum = t4;
goto L3;
L2: 
t5 = 0;
t5 = funkyValue == oddLimit;if ( t5) goto L4;goto L5;
L4: 
t6 = 0;
t6 = funkyValue * 2;t7 = 0;
t7 = t6 + 5;funnySum = t7;
goto L6;
L5: 
t8 = 0;
t8 = funkyValue + 1;funnySum = t8;
L6: 
L3: 
retval = funnySum;
return retval;
}
int main() {
int result = 0;
int t10 = 0;
int t11 = 0;
int t12 = 0;
int t9 = 0;
t9 = 7;
t10 = 10;
different_addition(t9,t10);t11 = retval;
result = t11;
t12 = result;
printf("different Result: %d\n",t13);retval = 0;
return retval;
}
