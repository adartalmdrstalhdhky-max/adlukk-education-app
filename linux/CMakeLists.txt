cmake_minimum_required(VERSION 3.10)
project(adlik LANGUAGES C CXX)

set(FLUTTER_ROOT "${CMAKE_CURRENT_SOURCE_DIR}/flutter")
# Standard Flutter-generated CMakeLists for Linux. For normal use, Flutter creates this automatically.
# This file is a safe placeholder. Use `flutter create .` to regenerate exact files.
add_subdirectory("${CMAKE_CURRENT_SOURCE_DIR}/../.."
                 ${CMAKE_CURRENT_BINARY_DIR}/flutter_build
                 EXCLUDE_FROM_ALL)
