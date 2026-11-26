cmake_minimum_required(VERSION 3.20)

# Self-contained lesson project: builds every Ex*/Ex*.cpp here and checks each one
# against its tests/<case>.in -> tests/<case>.out pairs. This file is also the test runner:
#   cmake -DEXE=<exe> -DINPUT=<file.in> -DEXPECTED=<file.out> -P CMakeLists.txt
if(CMAKE_SCRIPT_MODE_FILE)
  function(normalize var)
    string(REPLACE "\r\n" "\n" text "${${var}}")
    string(REGEX REPLACE "[ \t]+\n" "\n" text "${text}")
    string(STRIP "${text}" text)
    set(${var} "${text}" PARENT_SCOPE)
  endfunction()

  # Write to a file and read only its start, so an infinite loop cannot flood memory before the timeout.
  string(MD5 id "${INPUT}")
  set(actual_file "${EXE}.${id}.actual")
  execute_process(COMMAND "${EXE}" INPUT_FILE "${INPUT}" OUTPUT_FILE "${actual_file}"
                  RESULT_VARIABLE rc TIMEOUT 2)
  file(READ "${actual_file}" actual LIMIT 65536)
  file(REMOVE "${actual_file}")
  file(READ "${EXPECTED}" expected)
  normalize(actual)
  normalize(expected)

  if(NOT rc EQUAL 0)
    message(FATAL_ERROR "Program failed (${rc})\n--- expected ---\n${expected}\n--- actual ---\n${actual}")
  endif()
  if(NOT actual STREQUAL expected)
    message(FATAL_ERROR "Output mismatch\n--- expected ---\n${expected}\n--- actual ---\n${actual}")
  endif()
  return()
endif()

get_filename_component(lesson "${CMAKE_CURRENT_SOURCE_DIR}" NAME)
string(REPLACE "-" "_" lesson_id "${lesson}")

project(${lesson_id} LANGUAGES CXX)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
enable_testing()

# One executable per Ex*/ folder; every tests/<case>.in next to it becomes one test.
file(GLOB exercises LIST_DIRECTORIES true CONFIGURE_DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/Ex*")
foreach(dir ${exercises})
  get_filename_component(exercise "${dir}" NAME)
  add_executable(${exercise} ${dir}/${exercise}.cpp)

  file(GLOB inputs CONFIGURE_DEPENDS "${dir}/tests/*.in")
  foreach(input ${inputs})
    get_filename_component(case "${input}" NAME_WE)
    add_test(NAME ${exercise}.${case}
             COMMAND ${CMAKE_COMMAND} -DEXE=$<TARGET_FILE:${exercise}> -DINPUT=${input}
                     -DEXPECTED=${dir}/tests/${case}.out -P ${CMAKE_CURRENT_LIST_FILE})
  endforeach()
endforeach()
