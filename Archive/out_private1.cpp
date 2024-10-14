#include<iostream> 
using namespace std;
int retval=0;
int main() {
int data = 0;
int datagram = 0;
int header_bits80 = 0;
int port = 0;
int socket = 0;
int t1 = 0;
int t2 = 0;
int t3 = 0;
int t4 = 0;
int t5 = 0;
int t6 = 0;
int t7 = 0;
int t8 = 0;
t1 = 192;
socket = t1;
t2 = 9999;
port = t2;
t3 = 64;
datagram = t3;
t4 = 80;
header_bits80 = t4;
t5 = 9;
data = t5;
t6 = 0;
t6 = socket + port;t7 = 0;
t7 = t6 + header_bits80;t8 = 0;
t8 = t7 + data;datagram = t8;
retval = 0;
return retval;
}
