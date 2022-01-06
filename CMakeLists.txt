cmake_minimum_required(VERSION 3.14)

project(install_demo
LANGUAGES C Fortran
)

# --- auto-ignore build directory
if(NOT EXISTS ${PROJECT_BINARY_DIR}/.gitignore)
  file(WRITE ${PROJECT_BINARY_DIR}/.gitignore "*")
endif()

# --- C target
add_library(c_demo c_demo.c)
target_include_directories(c_demo PUBLIC
$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
$<INSTALL_INTERFACE:include>
)
set_target_properties(c_demo PROPERTIES
PUBLIC_HEADER ${CMAKE_CURRENT_SOURCE_DIR}/include/c_demo.h
)

# --- Fortran target
add_library(fortran_demo f_demo.f90)
target_include_directories(fortran_demo PUBLIC
$<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/include>
$<INSTALL_INTERFACE:include>
)
set_target_properties(fortran_demo PROPERTIES
Fortran_MODULE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/include
)

install(TARGETS c_demo fortran_demo
ARCHIVE LIBRARY PUBLIC_HEADER
)
# installs under CMAKE_INSTALL_PREFIX:
# lib/lib_cdemo.a include/c_demo.h
# libfortran_demo.a

install(FILES ${CMAKE_CURRENT_BINARY_DIR}/include/f_demo.mod
TYPE INCLUDE
)
# installs under CMAKE_INSTALL_PREFIX:
# include/f_demo.mod
