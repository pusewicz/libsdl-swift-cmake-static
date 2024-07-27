cmake_minimum_required(VERSION 3.17)
project(StaticSDLSwift LANGUAGES Swift C)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

include(FetchContent)
FetchContent_Declare(
  SDL2
  GIT_REPOSITORY https://github.com/libsdl-org/SDL.git
  GIT_TAG SDL2)
FetchContent_MakeAvailable(SDL2)

if(NOT DEFINED LINK_STATIC)
  set(LINK_STATIC "Link statically" ON)
endif()

include_directories(${SDL2_INCLUDE_DIRS} ${CMAKE_CURRENT_SOURCE_DIR})
add_executable(StaticSDLSwift main.swift)

if(LINK_STATIC)
  target_link_libraries(StaticSDLSwift PRIVATE SDL2::SDL2-static)
else()
  target_link_libraries(StaticSDLSwift PRIVATE SDL2::SDL2)
endif()
