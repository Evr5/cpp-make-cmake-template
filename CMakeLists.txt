cmake_minimum_required(VERSION 3.15)

# Make lsp's aware of libraries
set(CMAKE_EXPORT_COMPILE_COMMANDS True)

if(WIN32)
    add_compile_definitions(_WIN32_WINNT=0x0600)
endif()

# Compile & linking options
if (CMAKE_BUILD_TYPE STREQUAL "Debug")
    message("Debug build.")
    add_compile_options(-std=c++23 -g -pedantic -Wall -Wextra -fsanitize=address,undefined)
    add_link_options(-fsanitize=address,undefined)
else()
    message("Release build.")
    add_compile_options(-std=c++23 -O2 -w)
endif()

# C++ standard
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED True)

project(royal-blocks)

# Enable tests for Debug builds
if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    enable_testing()
    # add_subdirectory(test)
endif()

