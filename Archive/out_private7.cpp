#include<iostream> 
using namespace std;
int retval=0;
int main() {
int cleverCounter = 0;
int funnyNumber = 0;
int hilariousSum = 0;
int loopingControl = 0;
int quirkyLimit = 0;
int t1 = 0;
int t10 = 0;
int t11 = 0;
int t12 = 0;
int t13 = 0;
int t14 = 0;
int t15 = 0;
int t16 = 0;
int t17 = 0;
int t2 = 0;
int t3 = 0;
int t4 = 0;
int t5 = 0;
int t6 = 0;
int t7 = 0;
int t8 = 0;
int t9 = 0;
t1 = 0;
cleverCounter = t1;
t2 = 7;
funnyNumber = t2;
t3 = 15;
quirkyLimit = t3;
t4 = 0;
hilariousSum = t4;
t5 = 1;
loopingControl = t5;
L1: 
t6 = 0;
t6 = cleverCounter < quirkyLimit;if ( t6) goto L2;goto L3;
L2: 
t7 = 0;
t7 = funnyNumber * loopingControl;t8 = 0;
t8 = hilariousSum + t7;hilariousSum = t8;
t9 = 0;
t9 = loopingControl * 2;t10 = 0;
t10 = loopingControl - t9;loopingControl = t10;
t11 = 0;
t11 = cleverCounter + 1;cleverCounter = t11;
goto L1;
L3: 
t12 = 0;
t12 = hilariousSum > 0;if ( t12) goto L4;goto L5;
L4: 
t13 = 0;
t13 = hilariousSum + quirkyLimit;hilariousSum = t13;
goto L6;
L5: 
t14 = 0;
t14 = hilariousSum - quirkyLimit;hilariousSum = t14;
L6: 
L7: 
t15 = 0;
t15 = quirkyLimit > 0;if ( t15) goto L8;goto L9;
L8: 
t16 = 0;
t16 = hilariousSum + quirkyLimit;hilariousSum = t16;
t17 = 0;
t17 = quirkyLimit - 1;quirkyLimit = t17;
goto L7;
L9: 
retval = hilariousSum;
return retval;
}
