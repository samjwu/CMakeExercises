cmake_minimum_required(VERSION 3.10)

if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
    message("No build type specified. Setting build type to 'RelWithDebInfo'.")
    set(CMAKE_BUILD_TYPE RelWithDebInfo CACHE STRING "Build type." FORCE)
    set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release" "RelWithDebInfo" "MinSizeRel")
endif()

project (calculator)

add_library(calculator SHARED
    src/calculator.cpp
)

target_include_directories(calculator
    PUBLIC
        ${PROJECT_SOURCE_DIR}/include
)

set(SOURCES
    src/main.cpp
)

add_executable(addition ${SOURCES})

target_link_libraries(addition
    PRIVATE
        calculator
)

if(WIN32)
    set(CMAKE_INSTALL_PREFIX "C:/Users/Public/calculator")
endif()

install(DIRECTORY ${PROJECT_SOURCE_DIR}/include/ 
    DESTINATION include)

install(TARGETS calculator
    LIBRARY DESTINATION lib
    RUNTIME DESTINATION bin)

install(TARGETS addition
    DESTINATION bin)
