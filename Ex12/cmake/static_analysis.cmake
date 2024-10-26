if(NOT CPPCHECK_FOUND)
    find_package(CppCheck)
endif()

#----------------------------------------------------------------------------------------------------------
# Function to add a static analysis target using CppCheck.
# 
# Creates a custom target for performing static analysis on a given set of source files
# using the CppCheck tool. It gathers include directories for the current source directory, appends
# the necessary include flags, and sets up a pre-build command to run CppCheck when the target is invoked.
#
# Variables:
#   _target: The name of the target for which static analysis is being added. This will be used to
#            create a custom target named "${_target}_static_analysis".
#   _sources: A list of source files that are to be analyzed by CppCheck.
#
# Useful for integrating static analysis into the build process.
# To catch potential issues in code before deployment.
#----------------------------------------------------------------------------------------------------------

function(add_static_analysis _target _sources)
    if (CPPCHECK_FOUND)
        message(STATUS "Calling add_static_analysis for target: ${_target}")

        # store list of include directories associated with the current source directory into include_dirs
        get_property(include_dirs DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY INCLUDE_DIRECTORIES)
        foreach(dir ${include_dirs})
            list(APPEND cppcheck_includes "-I${dir}")
        endforeach()
        
        # add new static analysis target
        add_custom_target(${_target}_static_analysis)

        # exclude from default build
        set_target_properties(${_target}_static_analysis PROPERTIES EXCLUDE_FROM_ALL TRUE)

        message(STATUS "ALL_ANALYSIS_TARGETS in function: ${ALL_ANALYSIS_TARGETS}")

        # add new static analysis target to ALL_ANALYSIS_TARGETS list
        list(APPEND ALL_ANALYSIS_TARGETS "${_target}_static_analysis")

        # make ALL_ANALYSIS_TARGETS variable available in parent directory
        set(ALL_ANALYSIS_TARGETS "${ALL_ANALYSIS_TARGETS}" PARENT_SCOPE)

        # split cli arguments from CPPCHECK_ARG into individual components in tmp_args
        separate_arguments(tmp_args UNIX_COMMAND ${CPPCHECK_ARG})

        # add cppcheck command to static analysis target
        add_custom_command(TARGET ${_target}_static_analysis PRE_BUILD
            WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
            COMMAND ${CPPCHECK_BIN} ${tmp_args} ${cppcheck_includes} ${${_sources}}
            DEPENDS ${${_sources}}
            COMMENT "Running cppcheck: ${_target}"
            VERBATIM)
        message("Adding cppcheck static analysis target for ${_target}")
    endif()
endfunction()
