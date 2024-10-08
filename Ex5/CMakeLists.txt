cmake_minimum_required(VERSION 3.10)

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

install(DIRECTORY ${PROJECT_SOURCE_DIR}/include/ 
    DESTINATION include)

install(TARGETS calculator
    DESTINATION lib)

install(TARGETS addition
    DESTINATION bin)
