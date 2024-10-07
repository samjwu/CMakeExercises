#include <iostream>

#include "calculator.h"

int main() {
   int a, b;

   std::cin >> a >> b;

   Calculator calculator;

   std::cout << calculator.Add(a, b) << std::endl;

   return 0;
}
