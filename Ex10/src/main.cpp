#include <iostream>

#include "cmake_path.h"
#include "version.h"

int main() {
    std::cout << "Version: " << version << std::endl;
    std::cout << "Path: " << cmake_path << std::endl;
}
