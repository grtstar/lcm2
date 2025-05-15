# Install script for directory: /home/grt/ls/reality/depends/third_party/lcm2/liblcm-test

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/grt/ls/reality/depends/rk1106/common/arm32")
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

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/home/grt/ls/reality/depends/third_party/lcm2/build_rk1106/liblcm-test/lcm-sink")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/lcm-sink" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/lcm-sink")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/home/grt/ls/reality/depends/rk1106/common/arm-buildroot-linux-gnueabihf_sdk-buildroot/bin/arm-linux-strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/lcm-sink")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/home/grt/ls/reality/depends/third_party/lcm2/build_rk1106/liblcm-test/lcm-source")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/lcm-source" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/lcm-source")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/home/grt/ls/reality/depends/rk1106/common/arm-buildroot-linux-gnueabihf_sdk-buildroot/bin/arm-linux-strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/lcm-source")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/home/grt/ls/reality/depends/third_party/lcm2/build_rk1106/liblcm-test/lcm-tester")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/lcm-tester" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/lcm-tester")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/home/grt/ls/reality/depends/rk1106/common/arm-buildroot-linux-gnueabihf_sdk-buildroot/bin/arm-linux-strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/lcm-tester")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/home/grt/ls/reality/depends/third_party/lcm2/build_rk1106/liblcm-test/lcm-example")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/lcm-example" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/lcm-example")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/home/grt/ls/reality/depends/rk1106/common/arm-buildroot-linux-gnueabihf_sdk-buildroot/bin/arm-linux-strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/lcm-example")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/home/grt/ls/reality/depends/third_party/lcm2/build_rk1106/liblcm-test/lcm-logfilter")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/lcm-logfilter" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/lcm-logfilter")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/home/grt/ls/reality/depends/rk1106/common/arm-buildroot-linux-gnueabihf_sdk-buildroot/bin/arm-linux-strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/lcm-logfilter")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/man/man1" TYPE FILE FILES
    "/home/grt/ls/reality/depends/third_party/lcm2/liblcm-test/lcm-example.1"
    "/home/grt/ls/reality/depends/third_party/lcm2/liblcm-test/lcm-sink.1"
    "/home/grt/ls/reality/depends/third_party/lcm2/liblcm-test/lcm-source.1"
    "/home/grt/ls/reality/depends/third_party/lcm2/liblcm-test/lcm-tester.1"
    )
endif()

