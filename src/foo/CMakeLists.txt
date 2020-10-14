set(CODE_FILE_LIST
  ${CMAKE_SOURCE_DIR}/src/foo/foo.h
  ${CMAKE_SOURCE_DIR}/src/foo/foo.cpp
  )

source_group("src" FILES ${CODE_FILE_LIST})

set(LIBRARY_OUTPUT_PATH "${CMAKE_SOURCE_DIR}/output/lib")

add_library(foo STATIC ${CODE_FILE_LIST})

set_target_properties(foo PROPERTIES
    FOLDER main
    )
