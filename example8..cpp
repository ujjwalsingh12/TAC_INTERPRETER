#include<iostream> 
using namespace std;
int retval=0;
int factorial(int n) {
int t1 = 0;
int t2 = 0;
int t3 = 0;
t1 = 0;
t1 = n == 0;if ( t1) goto L1;goto L2;
L1: 
retval = 1;
return retval;
goto L3;
L2: 
t2 = 0;
t2 = n - 1;factorial(t2);t3 = 0;
t3 = n * retval;retval = t3;
return retval;
L3: 
}
int main() {
int result = 0;
int t4 = 0;
int t5 = 0;
int t7 = 0;
t4 = 5;
factorial(t4);t5 = retval;
result = t5;
t7 = result;
printf("5! = %d\n",t7);retval = 0;
return retval;
}
