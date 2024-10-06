cmake_minimum_required(VERSION 3.10)

project (calculator)

set(SOURCES
    src/main.cpp
    src/calculator.cpp
)

add_executable(calculator ${SOURCES})

target_include_directories(calculator
    PRIVATE
        ${PROJECT_SOURCE_DIR}/include
)
