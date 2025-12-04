cmake_minimum_required(VERSION 3.10)
project(adlik LANGUAGES CXX)

# Basic placeholder for Flutter Windows runner.
# For exact runner files use `flutter create .` or let Flutter generate native runner files.
add_subdirectory("${CMAKE_CURRENT_SOURCE_DIR}/../.."
                 ${CMAKE_CURRENT_BINARY_DIR}/flutter_build
                 EXCLUDE_FROM_ALL)
