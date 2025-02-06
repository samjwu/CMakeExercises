#-----------------------------------------------------------------------------
# Find the cppcheck binary and set up arguments for it.
#
# Searches for the 'cppcheck' program and sets up the necessary 
# arguments to configure its usage in the project. It also utilizes 
# FindPackageHandleStandardArgs to handle standard package finding behavior.
#
# Variables:
#   - CPPCHECK_BIN: The path to the cppcheck binary found on the system.
#   - CPPCHECK_THREADS: Argument to specify the number of threads/cores 
#     for cppcheck. Default is set to "-j 4".
#   - CPPCHECK_ARG: Additional arguments to pass to cppcheck. If set, it 
#     will overwrite CPPCHECK_THREADS.
#
# Usage:
#   Include this script in CMakeLists.txt to enable cppcheck support.
# 
# This file also marks the relevant variables as advanced, which affects how
# they are displayed in GUI-based CMake configuration tools.
#-----------------------------------------------------------------------------

find_program(CPPCHECK_BIN NAMES cppcheck)

set(CPPCHECK_THREADS "-j 4" CACHE STRING "Number of threads/cores for cppcheck to use.")

set(CPPCHECK_ARG "${CPPCHECK_THREADS}" CACHE STRING "Additional arguments to pass to cppcheck. If set will overwrite CPPCHECK_THREADS")

include(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(
    CPPCHECK 
    DEFAULT_MSG 
    CPPCHECK_BIN
    CPPCHECK_THREADS
    CPPCHECK_ARG
)

mark_as_advanced(
    CPPCHECK_BIN  
    CPPCHECK_THREADS
    CPPCHECK_ARG
)
