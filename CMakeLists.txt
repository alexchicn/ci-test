cmake_minimum_required(VERSION 2.8)

project(test)

set(CODE_FILE_LIST
  ${CMAKE_SOURCE_DIR}/src/test.cpp
  )

source_group("src" FILES ${CODE_FILE_LIST})

add_library(test STATIC ${CODE_FILE_LIST})

set_target_properties(test PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/output/bin"
    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/output/lib"
    )
