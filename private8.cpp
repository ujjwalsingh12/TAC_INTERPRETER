#include<iostream> 
using namespace std;
int retval=0;
int main() {
int bizarreSum = 0;
int funkyCounter = 0;
int goofyGlobal = 0;
int loopyControl = 0;
int oddIncrement = 0;
int sillyLimit = 0;
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
int t19 = 0;
int t2 = 0;
int t20 = 0;
int t21 = 0;
int t22 = 0;
int t23 = 0;
int t24 = 0;
int t26 = 0;
int t3 = 0;
int t4 = 0;
int t5 = 0;
int t6 = 0;
int t7 = 0;
int t8 = 0;
int t9 = 0;
int weirdNumber = 0;
t1 = 1;
funkyCounter = t1;
t2 = 5;
weirdNumber = t2;
t3 = 20;
sillyLimit = t3;
t4 = 0;
bizarreSum = t4;
t5 = 2;
loopyControl = t5;
t6 = 3;
oddIncrement = t6;
L1: 
t7 = 0;
t7 = funkyCounter < sillyLimit;if ( t7) goto L2;goto L3;
L2: 
t8 = 0;
t8 = weirdNumber * loopyControl;t9 = 0;
t9 = bizarreSum + t8;bizarreSum = t9;
t10 = 0;
t10 = funkyCounter + loopyControl;funkyCounter = t10;
t11 = 0;
t11 = loopyControl + oddIncrement;loopyControl = t11;
goto L1;
L3: 
t12 = bizarreSum;
goofyGlobal = t12;
t13 = 1;
funkyCounter = t13;
t14 = 1;
loopyControl = t14;
L4: 
t15 = 0;
t15 = funkyCounter < sillyLimit;if ( t15) goto L5;goto L6;
L5: 
t16 = 0;
t16 = goofyGlobal / loopyControl;t17 = 0;
t17 = bizarreSum + t16;bizarreSum = t17;
t18 = 0;
t18 = loopyControl + oddIncrement;loopyControl = t18;
t19 = 0;
t19 = funkyCounter + oddIncrement;funkyCounter = t19;
goto L4;
L6: 
L7: 
t20 = 0;
t20 = sillyLimit > 0;if ( t20) goto L8;goto L9;
L8: 
t21 = 0;
t21 = funkyCounter * oddIncrement;t22 = 0;
t22 = goofyGlobal + t21;goofyGlobal = t22;
t23 = 0;
t23 = funkyCounter - 1;funkyCounter = t23;
t24 = 0;
t24 = sillyLimit - 2;sillyLimit = t24;
goto L7;
L9: 
t26 = goofyGlobal;
printf("This is Goofy: %d\n",t26);retval = 0;
return retval;
}
