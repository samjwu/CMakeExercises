project(example)

set(SOURCES
    main.cpp
)

add_executable(${PROJECT_NAME} ${SOURCES})

set(LIBS
    calculator
    calculator_headeronly
)

target_link_libraries(${PROJECT_NAME}
    PRIVATE
        ${LIBS}
)
