#include<iostream> 
using namespace std;
int retval=0;
int mysterious_counter(int limit) {
int funValue = 0;
int laughTracker = 0;
int t1 = 0;
int t2 = 0;
int t3 = 0;
int t4 = 0;
int t5 = 0;
int t6 = 0;
int t7 = 0;
t1 = 2;
funValue = t1;
t2 = 0;
laughTracker = t2;
L1: 
t3 = 0;
t3 = laughTracker < limit;if ( t3) goto L2;goto L3;
L2: 
t4 = 0;
t4 = funValue < 10;if ( t4) goto L4;goto L5;
L4: 
t5 = 0;
t5 = funValue + 4;funValue = t5;
goto L6;
L5: 
t6 = 0;
t6 = funValue + 2;funValue = t6;
L6: 
t7 = 0;
t7 = laughTracker + 1;laughTracker = t7;
goto L1;
L3: 
retval = funValue;
return retval;
}
int main() {
int result = 0;
int t10 = 0;
int t8 = 0;
int t9 = 0;
t8 = 12;
mysterious_counter(t8);t9 = retval;
result = t9;
t10 = result;
printf("mysterious Result: %d\n",t11);retval = 0;
return retval;
}
