cmake_minimum_required(VERSION 3.10)

if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
    message("No build type specified. Setting build type to 'RelWithDebInfo'.")
    set(CMAKE_BUILD_TYPE RelWithDebInfo CACHE STRING "Build type." FORCE)
    set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release" "RelWithDebInfo" "MinSizeRel")
endif()

project(exercise)

# add custom directory to module path
set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake/modules ${CMAKE_MODULE_PATH})

find_package(CppCheck)

# declare var to be defined in custom module
set(ALL_ANALYSIS_TARGETS)

add_subdirectory(calculator)

if(CPPCHECK_FOUND)
    add_custom_target(static_analysis)
    ADD_DEPENDENCIES(static_analysis ${ALL_ANALYSIS_TARGETS})
    set_target_properties(static_analysis PROPERTIES EXCLUDE_FROM_ALL TRUE)
endif()
