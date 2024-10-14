#include<iostream> 
using namespace std;
int retval=0;
int main() {
int crazyCounter = 0;
int goofySum = 0;
int hilariousGlobal = 0;
int loopyStep = 0;
int sillyNumber = 0;
int t1 = 0;
int t10 = 0;
int t11 = 0;
int t12 = 0;
int t13 = 0;
int t14 = 0;
int t15 = 0;
int t16 = 0;
int t17 = 0;
int t18 = 0;
int t2 = 0;
int t3 = 0;
int t4 = 0;
int t5 = 0;
int t6 = 0;
int t7 = 0;
int t8 = 0;
int t9 = 0;
int weirdLimit = 0;
t1 = 0;
crazyCounter = t1;
t2 = 4;
sillyNumber = t2;
t3 = 30;
weirdLimit = t3;
t4 = 0;
goofySum = t4;
t5 = 1;
loopyStep = t5;
t6 = 0;
crazyCounter = t6;
L1: 
t7 = 0;
t7 = crazyCounter < weirdLimit;if ( t7) goto L2;goto L3;
L2: 
t9 = 0;
t9 = goofySum + sillyNumber;goofySum = t9;
t8 = 0;
t8 = crazyCounter + 1;crazyCounter = t8;
goto L1;
L3: 
t10 = goofySum;
hilariousGlobal = t10;
t11 = 0;
crazyCounter = t11;
L4: 
t12 = 0;
t12 = crazyCounter < weirdLimit;if ( t12) goto L5;goto L6;
L5: 
t14 = 0;
t14 = goofySum + crazyCounter;goofySum = t14;
t13 = 0;
t13 = crazyCounter + loopyStep;crazyCounter = t13;
goto L4;
L6: 
t15 = 0;
crazyCounter = t15;
L7: 
t16 = 0;
t16 = crazyCounter < goofySum;if ( t16) goto L8;goto L9;
L8: 
t18 = 0;
t18 = hilariousGlobal + crazyCounter;hilariousGlobal = t18;
t17 = 0;
t17 = crazyCounter + loopyStep;crazyCounter = t17;
goto L7;
L9: 
retval = hilariousGlobal;
return retval;
}
