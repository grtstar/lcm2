# Install script for directory: /home/grt/ls/reality/depends/third_party/lcm2

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/grt/ls/reality/depends/x64/common")
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
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/lcm/cmake/lcmTargets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/lcm/cmake/lcmTargets.cmake"
         "/home/grt/ls/reality/depends/third_party/lcm2/build_x64/CMakeFiles/Export/lib/lcm/cmake/lcmTargets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/lcm/cmake/lcmTargets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/lcm/cmake/lcmTargets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/lcm/cmake" TYPE FILE FILES "/home/grt/ls/reality/depends/third_party/lcm2/build_x64/CMakeFiles/Export/lib/lcm/cmake/lcmTargets.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/lcm/cmake" TYPE FILE FILES "/home/grt/ls/reality/depends/third_party/lcm2/build_x64/CMakeFiles/Export/lib/lcm/cmake/lcmTargets-noconfig.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/lcm/cmake" TYPE FILE FILES
    "/home/grt/ls/reality/depends/third_party/lcm2/build_x64/lcmConfig.cmake"
    "/home/grt/ls/reality/depends/third_party/lcm2/build_x64/lcmConfigVersion.cmake"
    "/home/grt/ls/reality/depends/third_party/lcm2/build_x64/lcmUtilities.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/grt/ls/reality/depends/third_party/lcm2/build_x64/lcm/cmake_install.cmake")
  include("/home/grt/ls/reality/depends/third_party/lcm2/build_x64/lcmgen/cmake_install.cmake")
  include("/home/grt/ls/reality/depends/third_party/lcm2/build_x64/lcm-logger/cmake_install.cmake")
  include("/home/grt/ls/reality/depends/third_party/lcm2/build_x64/liblcm-test/cmake_install.cmake")
  include("/home/grt/ls/reality/depends/third_party/lcm2/build_x64/docs/cmake_install.cmake")
  include("/home/grt/ls/reality/depends/third_party/lcm2/build_x64/lcm-python/cmake_install.cmake")
  include("/home/grt/ls/reality/depends/third_party/lcm2/build_x64/lcm-lua/cmake_install.cmake")
  include("/home/grt/ls/reality/depends/third_party/lcm2/build_x64/test/cmake_install.cmake")
  include("/home/grt/ls/reality/depends/third_party/lcm2/build_x64/m4macros/cmake_install.cmake")
  include("/home/grt/ls/reality/depends/third_party/lcm2/build_x64/lcm-pkgconfig/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/grt/ls/reality/depends/third_party/lcm2/build_x64/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
