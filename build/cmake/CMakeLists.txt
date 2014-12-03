cmake_minimum_required(VERSION 2.8)

project(demo)

if(USE_COVERALLS)
  set(CMAKE_C_FLAGS "-fprofile-arcs -ftest-coverage -Wall -fPIC -std=c++11")
  set(CMAKE_CXX_FLAGS "-fprofile-arcs -ftest-coverage -Wall -fPIC -std=c++11")
  set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -fprofile-arcs -lgcov")
  add_definitions(-DBUILD_COVERALLS)
endif()

set(ROOT_PATH
  "${demo_SOURCE_DIR}/../.."
  )

set(CODE_FILE_LIST
  ${ROOT_PATH}/code/demo.cpp
  )

source_group("src" FILES ${CODE_FILE_LIST})

set(EXECUTABLE_OUTPUT_PATH
  "${ROOT_PATH}/out/bin"
  )

add_executable(demo ${CODE_FILE_LIST})

