cmake_minimum_required(VERSION 2.8)

project(test)

set_property(GLOBAL PROPERTY USE_FOLDERS ON)

message("test paths-ignore")
add_subdirectory(src)
