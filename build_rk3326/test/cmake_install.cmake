# Install script for directory: /home/grt/ls/reality/depends/third_party/lcm2/test

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/grt/ls/reality/depends/rk3266/common/arm64")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "TRUE")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/grt/ls/reality/depends/third_party/lcm2/build_rk3326/test/gtest/cmake_install.cmake")
  include("/home/grt/ls/reality/depends/third_party/lcm2/build_rk3326/test/types/cmake_install.cmake")
  include("/home/grt/ls/reality/depends/third_party/lcm2/build_rk3326/test/c/cmake_install.cmake")
  include("/home/grt/ls/reality/depends/third_party/lcm2/build_rk3326/test/cpp/cmake_install.cmake")
  include("/home/grt/ls/reality/depends/third_party/lcm2/build_rk3326/test/python/cmake_install.cmake")
  include("/home/grt/ls/reality/depends/third_party/lcm2/build_rk3326/test/lua/cmake_install.cmake")

endif()

