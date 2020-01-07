#!/bin/bash -eux

# [bash - What's a concise way to check that environment variables are set in a Unix shell script? - Stack Overflow](https://stackoverflow.com/a/307735/9316234)
#PCL_VERSION=1.70.0
: "${PCL_VERSION:?Need to be set. (ex: '$ PCL_VERSION=8.2.0 ./xxx.sh')}"
# 'shared' or 'static'
: "${PCL_LIBS:?Need to be set. 'static' or 'shared' (ex: '$ PCL_LIBS=shared ./xxx.sh')}"

if [ ${PCL_LIBS} == "static" ]; then
    BUILD_SHARED_LIBS=OFF
elif [ ${PCL_LIBS} == "shared" ]; then
    BUILD_SHARED_LIBS=ON
else
    printf "\e[101m %s \e[0m \n" "Variable PCL_LIBS should be 'static' or 'shared'."
    exit 1
fi

PCL_DIR=${HOME}/.pcl
CMAKE_INSTALL_PREFIX=${PCL_DIR}/install/pcl-${PCL_VERSION}/${PCL_LIBS}
if [ -d "${CMAKE_INSTALL_PREFIX}" ]; then
  rm -rf ${CMAKE_INSTALL_PREFIX}
fi
# current working directory
CWD=$(pwd)


#=======================================
# if a directory or a symbolic link does not exist
if [ ! -d ${PCL_DIR} ] && [ ! -L ${PCL_DIR} ]; then
  mkdir ${PCL_DIR}
fi

#=======================================
# clone pcl
cd ${PCL_DIR}
if [ ! -d "${PCL_DIR}/pcl" ]; then
  git clone https://gitlab.kitware.com/pcl/pcl.git
fi

cd "${PCL_DIR}/pcl"
git checkout master
git fetch
git pull --all
git checkout "v${PCL_VERSION}"
cd ${PCL_DIR}

#=======================================
# build
directory1=${PCL_DIR}/pcl/build
if [ -d "${directory1}" ]; then
  rm -rf ${directory1}
fi
mkdir ${directory1}
cd ${directory1}
echo ${directory1}

#=======================================
cmake \
    -D CMAKE_BUILD_TYPE:STRING=Release \
    -D BUILD_SHARED_LIBS=${BUILD_SHARED_LIBS} \
    -D CMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX} \
    ..

if [ -d "${CMAKE_INSTALL_PREFIX}" ]; then
  rm -rf ${CMAKE_INSTALL_PREFIX}
fi
make -j4
make install

#===============================================================================
# Back to working directory
cd ${CWD}