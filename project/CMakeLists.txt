cmake_minimum_required(VERSION 2.8)
# set(CMAKE_VERBOSE_MAKEFILE ON)
project(Project)

set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake_modules" ${CMAKE_MODULE_PATH})
find_package(SFML REQUIRED COMPONENTS audio network graphics window system)

add_executable(${PROJECT_NAME} "main.cpp")

if(SFML_FOUND)
  include_directories(${SFML_INCLUDE_DIR})
  target_link_libraries(${PROJECT_NAME} sfml-graphics sfml-window sfml-system)
else()
    message("\n SFML not found")
endif()

target_compile_options(${PROJECT_NAME}
  PRIVATE
    -march=native
    -std=c++17
    -O
    -g3
    -m64
    -Werror
    -Wfatal-errors
    -pedantic-errors
    -Wall
    -Wextra
)