cmake_minimum_required(VERSION 3.10)

if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
    message("No build type specified. Setting build type to 'RelWithDebInfo'.")
    set(CMAKE_BUILD_TYPE RelWithDebInfo CACHE STRING "Build type." FORCE)
    set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release" "RelWithDebInfo" "MinSizeRel")
endif()

project(exercise)

set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Werror" CACHE STRING "Set C++ Compiler Flags" FORCE)

configure_file(include/cmake_path.h.in ${PROJECT_BINARY_DIR}/include/cmake_path.h @ONLY)

set (exercise_VERSION_MAJOR 0)
set (exercise_VERSION_MINOR 1)
set (exercise_VERSION_PATCH 0)
set (exercise_VERSION "${exercise_VERSION_MAJOR}.${exercise_VERSION_MINOR}.${exercise_VERSION_PATCH}")

configure_file(include/version.h.in ${PROJECT_BINARY_DIR}/include/version.h)

set(SOURCES
    src/main.cpp
)

add_executable(${PROJECT_NAME}
    ${SOURCES}
)

target_include_directories(${PROJECT_NAME}
    PRIVATE
        ${PROJECT_BINARY_DIR}/include
)
