cmake_minimum_required(VERSION 3.10)  
project(SFML)                     

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED True)

if (CMAKE_BUILD_TYPE STREQUAL "Debug")
    message("Debug build")
    add_compile_options(-std=c++20 -g -pedantic -Wall -Wextra)
else(CMAKE_BUILD_TYPE STREQUAL "Release")
    message("Release build")
    add_compile_options(-std=c++20 -O2 -pedantic -Wall -Wextra)
endif()

if (CMAKE_SYSTEM_NAME STREQUAL "Windows")
    set(EXECUTABLE_SUFFIX ".exe")

else()
    set(EXECUTABLE_SUFFIX "")
endif()

find_package(SFML 2.5 COMPONENTS system window graphics audio network REQUIRED)

file(GLOB_RECURSE SOURCES ${CMAKE_SOURCE_DIR}/src/*.cpp)

if (CMAKE_SYSTEM_NAME STREQUAL "Windows")
    add_executable(${PROJECT_NAME} WIN32 ${SOURCES})
else()
    add_executable(${PROJECT_NAME} ${SOURCES})
endif()

target_link_libraries(${PROJECT_NAME}${EXECUTABLE_SUFFIX}
    sfml-system
    sfml-window
    sfml-graphics
    sfml-audio
    sfml-network
)

message("Building for platform: ${CMAKE_SYSTEM_NAME}")
message("C++ Standard: ${CMAKE_CXX_STANDARD}")