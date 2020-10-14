set(CODE_FILE_LIST
  ${CMAKE_SOURCE_DIR}/src/test/test.cpp
  )

source_group("src" FILES ${CODE_FILE_LIST})

set(EXECUTABLE_OUTPUT_PATH "${CMAKE_SOURCE_DIR}/output/bin")

add_executable(test ${CODE_FILE_LIST})

target_include_directories(test PRIVATE
    "${CMAKE_SOURCE_DIR}/src/foo"
    )

target_link_libraries(test
    foo
    )

set_target_properties(test PROPERTIES
    FOLDER main
    )
