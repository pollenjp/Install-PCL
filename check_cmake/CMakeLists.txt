cmake_minimum_required(VERSION 3.1)

project(check_cmake)

find_package(#[[<package>]] PkgConfig REQUIRED)
message("------FLANN-----------------------------")
pkg_check_modules(#[[<prefix>]] FLANN REQUIRED
                  #[[<moduleSpec>]] flann)
include_directories(${FLANN_INCLUDE_DIRS})
link_directories(${FLANN_LIBRARY_DIRS})
#target_link_libraries(hello ${FLANN_LIBRARIES})
message("FLANN_FOUND          : ${FLANN_FOUND}")
message("FLANN_LIBRARIES      : ${FLANN_LIBRARIES}")
message("FLANN_LINK_LIBRARIES : ${FLANN_LINK_LIBRARIES}")
message("FLANN_LIBRARY_DIRS   : ${FLANN_LIBRARY_DIRS}")
message("FLANN_LDFLAGS        : ${FLANN_LDFLAGS}")
message("FLANN_LDFLAGS_OTHER  : ${FLANN_LDFLAGS_OTHER}")
message("FLANN_INCLUDE_DIRS   : ${FLANN_INCLUDE_DIRS}")
message("FLANN_CFLAGS         : ${FLANN_CFLAGS}")
message("FLANN_CFLAGS_OTHER   : ${FLANN_CFLAGS_OTHER}")


message("-----Eigen3-----------------------------")
#set(CMAKE_PREFIX_PATH "${CMAKE_PREFIX_PATH};/home/pollenjp/.eigen/install/eigen-3.3.7/share/eigen3/cmake")
#message("CMAKE_PREFIX_PATH: ${CMAKE_PREFIX_PATH}")
#find_package(#[[<package>]] Eigen3 REQUIRED)
#message("EIGEN3_ROOT_DIR     : ${EIGEN3_ROOT_DIR}")
#message("EIGEN3_DEFINITIONS  : ${EIGEN3_DEFINITIONS}")
#message("EIGEN3_INCLUDE_DIRS : ${EIGEN3_INCLUDE_DIRS}")
#message("EIGEN3_LIBRARY_DIRS : ${EIGEN3_LIBRARY_DIRS}")
#message("EIGEN3_LIBRARIES    : ${EIGEN3_LIBRARIES}")

pkg_check_modules(#[[<prefix>]] EIGEN3 REQUIRED
                  #[[<moduleSpec>]] eigen3)
message("EIGEN3_FOUND          : ${EIGEN3_FOUND}")
message("EIGEN3_LIBRARIES      : ${EIGEN3_LIBRARIES}")
message("EIGEN3_LINK_LIBRARIES : ${EIGEN3_LINK_LIBRARIES}")
message("EIGEN3_LIBRARY_DIRS   : ${EIGEN3_LIBRARY_DIRS}")
message("EIGEN3_LDFLAGS        : ${EIGEN3_LDFLAGS}")
message("EIGEN3_LDFLAGS_OTHER  : ${EIGEN3_LDFLAGS_OTHER}")
message("EIGEN3_INCLUDE_DIRS   : ${EIGEN3_INCLUDE_DIRS}")
message("EIGEN3_CFLAGS         : ${EIGEN3_CFLAGS}")
message("EIGEN3_CFLAGS_OTHER   : ${EIGEN3_CFLAGS_OTHER}")



message("-----X11----------------------------------------")
find_package(#[[<package>]] X11 REQUIRED)
message("X11_DEFINITIONS  : ${X11_DEFINITIONS}")
message("X11_INCLUDE_DIRS : ${X11_INCLUDE_DIRS}")
message("X11_LIBRARY_DIRS : ${X11_LIBRARY_DIRS}")
message("X11_LIBRARIES    : ${X11_LIBRARIES}")

message("------Boost-----------------------------")
set(CMAKE_PREFIX_PATH "${CMAKE_PREFIX_PATH};/home/pollenjp/.boost/install/boost-1.70.0/static/lib/cmake")
message("CMAKE_PREFIX_PATH: ${CMAKE_PREFIX_PATH}")
set(Boost_USE_STATIC_LIBS ON) 
find_package(#[[<package>]] Boost 1.60 REQUIRED)
message("Boost_DEFINITIONS  : ${Boost_DEFINITIONS}")
message("Boost_INCLUDE_DIRS : ${Boost_INCLUDE_DIRS}")
message("Boost_LIBRARY_DIRS : ${Boost_LIBRARY_DIRS}")
message("Boost_LIBRARIES    : ${Boost_LIBRARIES}")

message("-----VTK--------------------------------")
set(CMAKE_PREFIX_PATH "${CMAKE_PREFIX_PATH};/home/pollenjp/.vtk/install/vtk-8.2.0/shared/lib/cmake")
message("CMAKE_PREFIX_PATH: ${CMAKE_PREFIX_PATH}")
find_package(#[[<package>]] VTK REQUIRED)
message("VTK_ROOT_DIR     : ${VTK_ROOT_DIR}")
message("VTK_DEFINITIONS  : ${VTK_DEFINITIONS}")
message("VTK_FOUND          : ${VTK_FOUND}")
message("VTK_LIBRARIES      : ${VTK_LIBRARIES}")
message("VTK_LINK_LIBRARIES : ${VTK_LINK_LIBRARIES}")
message("VTK_LIBRARY_DIRS   : ${VTK_LIBRARY_DIRS}")
message("VTK_LDFLAGS        : ${VTK_LDFLAGS}")
message("VTK_LDFLAGS_OTHER  : ${VTK_LDFLAGS_OTHER}")
message("VTK_INCLUDE_DIRS   : ${VTK_INCLUDE_DIRS}")
message("VTK_CFLAGS         : ${VTK_CFLAGS}")
message("VTK_CFLAGS_OTHER   : ${VTK_CFLAGS_OTHER}")


message("----------------------------------------")
get_cmake_property(_variableNames VARIABLES)
list (SORT _variableNames)
foreach (_variableName ${_variableNames})
    message(STATUS "${_variableName}=${${_variableName}}")
endforeach()


