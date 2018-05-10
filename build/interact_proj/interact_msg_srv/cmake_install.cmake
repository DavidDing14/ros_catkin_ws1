# Install script for directory: /home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/oslab/catkin_ws1/install")
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

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/interact_msg_srv/msg" TYPE FILE FILES
    "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg/AsrResultMsg.msg"
    "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg/Order.msg"
    "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg/OrderList.msg"
    "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg/NotifyGesture.msg"
    "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg/PointDirection.msg"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/interact_msg_srv/srv" TYPE FILE FILES "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/srv/PointCloud.srv")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/interact_msg_srv/cmake" TYPE FILE FILES "/home/oslab/catkin_ws1/build/interact_proj/interact_msg_srv/catkin_generated/installspace/interact_msg_srv-msg-paths.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/oslab/catkin_ws1/devel/include/interact_msg_srv")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/oslab/catkin_ws1/devel/share/common-lisp/ros/interact_msg_srv")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/local/bin/python" -m compileall "/home/oslab/catkin_ws1/devel/lib/python2.7/dist-packages/interact_msg_srv")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/oslab/catkin_ws1/devel/lib/python2.7/dist-packages/interact_msg_srv")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/oslab/catkin_ws1/build/interact_proj/interact_msg_srv/catkin_generated/installspace/interact_msg_srv.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/interact_msg_srv/cmake" TYPE FILE FILES "/home/oslab/catkin_ws1/build/interact_proj/interact_msg_srv/catkin_generated/installspace/interact_msg_srv-msg-extras.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/interact_msg_srv/cmake" TYPE FILE FILES
    "/home/oslab/catkin_ws1/build/interact_proj/interact_msg_srv/catkin_generated/installspace/interact_msg_srvConfig.cmake"
    "/home/oslab/catkin_ws1/build/interact_proj/interact_msg_srv/catkin_generated/installspace/interact_msg_srvConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/interact_msg_srv" TYPE FILE FILES "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/package.xml")
endif()

