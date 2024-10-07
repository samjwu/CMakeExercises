cmake_minimum_required(VERSION 3.10)

project (calculator)

add_library(calculator STATIC
    src/calculator.cpp
)

target_include_directories(calculator
    PUBLIC
        ${PROJECT_SOURCE_DIR}/include
)

set(SOURCES
    src/main.cpp
)

add_executable(add ${SOURCES})

target_link_libraries(add
    PRIVATE
        calculator
)
