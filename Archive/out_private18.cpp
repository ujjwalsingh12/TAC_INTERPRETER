#include<iostream> 
using namespace std;
int retval=0;
int add_two_numbers(int a,int b) {
int t1 = 0;
t1 = 0;
t1 = a + b;retval = t1;
return retval;
}
int multiply_two_numbers(int a,int b) {
int t2 = 0;
t2 = 0;
t2 = a * b;retval = t2;
return retval;
}
int subtract_two_numbers(int a,int b) {
int t3 = 0;
t3 = 0;
t3 = a - b;retval = t3;
return retval;
}
int main() {
int difference = 0;
int product = 0;
int sum = 0;
int t10 = 0;
int t11 = 0;
int t13 = 0;
int t15 = 0;
int t4 = 0;
int t5 = 0;
int t6 = 0;
int t7 = 0;
int t8 = 0;
int t9 = 0;
add_two_numbers(8,12);t4 = retval;
sum = t4;
t5 = 5;
t6 = 4;
multiply_two_numbers(t5,t6);t7 = retval;
product = t7;
t8 = product;
t9 = sum;
subtract_two_numbers(t8,t9);t10 = retval;
difference = t10;
t11 = sum;
printf("Sum: %d\n",t12);t13 = product;
printf("Product: %d\n",t14);t15 = difference;
printf("Difference: %d\n",t16);retval = 0;
return retval;
}
