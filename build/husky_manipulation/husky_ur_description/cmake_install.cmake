# Install script for directory: /home/kyungki/workspace/husky_ws/src/husky_manipulation/husky_ur_description

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/kyungki/workspace/husky_ws/install")
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/kyungki/workspace/husky_ws/build/husky_manipulation/husky_ur_description/catkin_generated/installspace/husky_ur_description.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/husky_ur_description/cmake" TYPE FILE FILES
    "/home/kyungki/workspace/husky_ws/build/husky_manipulation/husky_ur_description/catkin_generated/installspace/husky_ur_descriptionConfig.cmake"
    "/home/kyungki/workspace/husky_ws/build/husky_manipulation/husky_ur_description/catkin_generated/installspace/husky_ur_descriptionConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/husky_ur_description" TYPE FILE FILES "/home/kyungki/workspace/husky_ws/src/husky_manipulation/husky_ur_description/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/husky_ur_description" TYPE DIRECTORY FILES
    "/home/kyungki/workspace/husky_ws/src/husky_manipulation/husky_ur_description/meshes"
    "/home/kyungki/workspace/husky_ws/src/husky_manipulation/husky_ur_description/urdf"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/husky_ur_description" TYPE PROGRAM FILES
    "/home/kyungki/workspace/husky_ws/src/husky_manipulation/husky_ur_description/scripts/setup_husky_dual_ur3_e_envar"
    "/home/kyungki/workspace/husky_ws/src/husky_manipulation/husky_ur_description/scripts/setup_husky_dual_ur3_envar"
    "/home/kyungki/workspace/husky_ws/src/husky_manipulation/husky_ur_description/scripts/setup_husky_dual_ur5_e_envar"
    "/home/kyungki/workspace/husky_ws/src/husky_manipulation/husky_ur_description/scripts/setup_husky_dual_ur5_envar"
    "/home/kyungki/workspace/husky_ws/src/husky_manipulation/husky_ur_description/scripts/setup_husky_ur3_e_envar"
    "/home/kyungki/workspace/husky_ws/src/husky_manipulation/husky_ur_description/scripts/setup_husky_ur3_envar"
    "/home/kyungki/workspace/husky_ws/src/husky_manipulation/husky_ur_description/scripts/setup_husky_ur5_e_envar"
    "/home/kyungki/workspace/husky_ws/src/husky_manipulation/husky_ur_description/scripts/setup_husky_ur5_envar"
    "/home/kyungki/workspace/husky_ws/src/husky_manipulation/husky_ur_description/scripts/setup_husky_ur_envar"
    )
endif()

