cmake_minimum_required (VERSION 3.10)
project("projects")

add_library(glm INTERFACE)
target_include_directories(glm INTERFACE 3rdparty/glm/)

add_subdirectory(hcl)

set (HRA_USE_COMMON_LIB_HELPERS ON CACHE BOOL "Use hcl helper" FORCE)
add_subdirectory(hra)

if (WIN32)
    add_subdirectory(test_and_tools)
    add_subdirectory(sandbox)
endif()

