
```shell
user@pc%
mkdir build && cd build
user@pc%
PKG_CONFIG_PATH=/home/pollenjp/.flann/install/flann-1.8.5/lib/pkgconfig:/home/pollenjp/.eigen/install/eigen-3.3.7/share/pkgconfig \
    /home/pollenjp/.cmake/download/cmake-3.13.4-Linux-x86_64/bin/cmake \
    -D CMAKE_BUILD_TYPE=Debug \
    -D CMAKE_PREFIX_PATH="/home/pollenjp/.vtk/install/vtk-8.2.0/shared/lib/cmake;/home/pollenjp/.pcl/install/pcl-1.9.1/shared/share/pcl-1.9" \
    -D BOOST_ROOT=/home/pollenjp/.boost/install/boost-1.70.0/shared \
    ..
user@pc%
make
user@pc%
LD_LIBRARY_PATH="${HOME}/.vtk/install/vtk-8.2.0/shared/lib:${LD_LIBRARY_PATH}" \
    ./pcd_write
Saved 5 data points to test_pcd.pcd.
    0.352222 -0.151883 -0.106395
    -0.397406 -0.473106 0.292602
    -0.731898 0.667105 0.441304
    -0.734766 0.854581 -0.0361733
    -0.4607 -0.277468 -0.916762
```