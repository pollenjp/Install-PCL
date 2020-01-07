cmake_minimum_required(VERSION 3.13)

project(#[[<PROJECT-NAME>]] sample_visualization)

find_package(PCL 1.9 REQUIRED)

include_directories(${PCL_INCLUDE_DIRS})
link_directories(${PCL_LIBRARY_DIRS})
add_definitions(${PCL_DEFINITIONS})

add_executable(#[[<name>]] sample_visualization
               #[[source]] sample_visualization.cpp)
target_link_libraries(#[[<target>]] sample_visualization
                      #[[<item>]] ${PCL_LIBRARIES})
