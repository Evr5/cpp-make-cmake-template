cmake_minimum_required(VERSION 3.10)

option(BUILD_STATIC "Link standard libs statically" OFF)

# Make lsp's aware of libraries
set(CMAKE_EXPORT_COMPILE_COMMANDS True)

# C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

if(WIN32)
    add_compile_definitions(_WIN32_WINNT=0x0600)
endif()

# Static linking flags
if(BUILD_STATIC)
    message(STATUS "Static linking of libstdc++/libgcc enabled")
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -static-libgcc -static-libstdc++")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -static-libstdc++ -static-libgcc")
endif()

# Build type
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release)
endif()

# Compile & linking options
if (CMAKE_BUILD_TYPE STREQUAL "Debug")
    message("Debug build.")
    add_compile_options(-g -pedantic -Wall -Wextra -fsanitize=address,undefined)
    add_link_options(-fsanitize=address,undefined)
else()
    message("Release build.")
    add_compile_options(-O3 -DNDEBUG)
endif()

# Set project name
project(MyProject)

# Source files
file(GLOB_RECURSE SOURCES CONFIGURE_DEPENDS src/*.cpp)

# Build executable
add_executable(${PROJECT_NAME} ${SOURCES})

# Enable tests for Debug builds
if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    enable_testing()
    # add_subdirectory(test)
endif()