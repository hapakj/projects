cmake_minimum_required (VERSION 3.10)
project("projects")

add_subdirectory(hcl)

set (HRA_USE_COMMON_LIB_HELPERS ON CACHE BOOL "Use hcl helper" FORCE)
add_subdirectory(hra)

if (WIN32)
    add_subdirectory(test_and_tools)
endif()

