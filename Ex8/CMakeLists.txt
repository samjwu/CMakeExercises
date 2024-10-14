cmake_minimum_required(VERSION 3.10)

if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
    message("No build type specified. Setting build type to 'RelWithDebInfo'.")
    set(CMAKE_BUILD_TYPE RelWithDebInfo CACHE STRING "Build type." FORCE)
    set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release" "RelWithDebInfo" "MinSizeRel")
endif()

project (exercise)

find_package(Boost 1.86.0 REQUIRED COMPONENTS filesystem)

if(Boost_FOUND)
    message ("Found Boost")
    include_directories(${Boost_INCLUDE_DIRS})
else()
    message (FATAL_ERROR "Cannot find Boost")
endif()

set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Werror" CACHE STRING "Set C++ Compiler Flags" FORCE)

add_library(exercise SHARED
    src/boost_util.cpp
)

target_compile_features(exercise PRIVATE cxx_std_11) 

target_include_directories(exercise
    PUBLIC
        ${PROJECT_SOURCE_DIR}/include
)

set(SOURCES
    src/main.cpp
)

add_executable(main ${SOURCES})

target_link_libraries(main
    PRIVATE
        Boost::filesystem
        Boost::system
        exercise
)

if(WIN32)
    set(CMAKE_INSTALL_PREFIX "C:/Users/Public/exercise")
endif()

install(DIRECTORY ${PROJECT_SOURCE_DIR}/include/ 
    DESTINATION include)

install(TARGETS exercise
    LIBRARY DESTINATION lib
    RUNTIME DESTINATION bin)

install(TARGETS main
    DESTINATION bin)
