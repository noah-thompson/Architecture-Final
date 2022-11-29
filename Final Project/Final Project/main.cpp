// main.cpp
#include <iostream>
#include <ostream>
extern "C" int asmMain();
using namespace std;
int main() 
{
	int num = asmMain();
	cout << num;
	return 0;
}