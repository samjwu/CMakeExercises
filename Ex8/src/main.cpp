#include "boost_util.h"

#include <iostream>

int main() {
   BoostUtil boost_util;

   std::cout << boost_util.DoesFileExist("Test.txt");

   return 0;
}
