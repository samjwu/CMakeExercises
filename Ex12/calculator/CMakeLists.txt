project(calculator)

set(SOURCES
    src/calculator.cpp
    src/main.cpp
)

include(${CMAKE_SOURCE_DIR}/cmake/static_analysis.cmake)

add_executable(${PROJECT_NAME} ${SOURCES})

add_static_analysis(${PROJECT_NAME} ${SOURCES})

target_include_directories(${PROJECT_NAME}
    PUBLIC
        ${PROJECT_SOURCE_DIR}/include
)
