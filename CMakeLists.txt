cmake_minimum_required(VERSION 2.8)

project(test)

set(CODE_FILE_LIST
  ${CMAKE_SOURCE_DIR}/src/test.cpp
  )

source_group("src" FILES ${CODE_FILE_LIST})

set(EXECUTABLE_OUTPUT_PATH "${CMAKE_SOURCE_DIR}/output/bin")

add_executable(test ${CODE_FILE_LIST})
