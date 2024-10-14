#include<iostream> 
using namespace std;
int retval=0;
int multiply_funny(int giggleFactor,int chuckleLimit) {
int funnyCounter = 0;
int laughMeter = 0;
int t1 = 0;
int t2 = 0;
int t3 = 0;
int t4 = 0;
int t5 = 0;
t1 = 0;
laughMeter = t1;
t2 = 0;
funnyCounter = t2;
L1: 
t3 = 0;
t3 = funnyCounter < chuckleLimit;if ( t3) goto L2;goto L3;
L2: 
t4 = 0;
t4 = laughMeter + giggleFactor;laughMeter = t4;
t5 = 0;
t5 = funnyCounter + 1;funnyCounter = t5;
goto L1;
L3: 
retval = laughMeter;
return retval;
}
int main() {
int result = 0;
int t6 = 0;
int t7 = 0;
int t8 = 0;
int t9 = 0;
t6 = 4;
t7 = 6;
multiply_funny(t6,t7);t8 = retval;
result = t8;
t9 = result;
printf("Result: %d\n",t10);retval = 0;
return retval;
}
