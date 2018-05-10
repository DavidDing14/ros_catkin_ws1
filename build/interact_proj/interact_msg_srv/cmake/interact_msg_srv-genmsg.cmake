# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "interact_msg_srv: 5 messages, 1 services")

set(MSG_I_FLAGS "-Iinteract_msg_srv:/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/indigo/share/geometry_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/indigo/share/sensor_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(interact_msg_srv_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg/NotifyGesture.msg" NAME_WE)
add_custom_target(_interact_msg_srv_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "interact_msg_srv" "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg/NotifyGesture.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg/AsrResultMsg.msg" NAME_WE)
add_custom_target(_interact_msg_srv_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "interact_msg_srv" "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg/AsrResultMsg.msg" ""
)

get_filename_component(_filename "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg/PointDirection.msg" NAME_WE)
add_custom_target(_interact_msg_srv_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "interact_msg_srv" "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg/PointDirection.msg" "geometry_msgs/Point:std_msgs/Header:geometry_msgs/PointStamped"
)

get_filename_component(_filename "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg/Order.msg" NAME_WE)
add_custom_target(_interact_msg_srv_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "interact_msg_srv" "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg/Order.msg" ""
)

get_filename_component(_filename "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg/OrderList.msg" NAME_WE)
add_custom_target(_interact_msg_srv_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "interact_msg_srv" "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg/OrderList.msg" "interact_msg_srv/Order:std_msgs/Header"
)

get_filename_component(_filename "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/srv/PointCloud.srv" NAME_WE)
add_custom_target(_interact_msg_srv_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "interact_msg_srv" "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/srv/PointCloud.srv" "sensor_msgs/PointField:sensor_msgs/PointCloud2:std_msgs/Header:sensor_msgs/Image"
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(interact_msg_srv
  "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg/Order.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/interact_msg_srv
)
_generate_msg_cpp(interact_msg_srv
  "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg/AsrResultMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/interact_msg_srv
)
_generate_msg_cpp(interact_msg_srv
  "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg/NotifyGesture.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/interact_msg_srv
)
_generate_msg_cpp(interact_msg_srv
  "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg/PointDirection.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/PointStamped.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/interact_msg_srv
)
_generate_msg_cpp(interact_msg_srv
  "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg/OrderList.msg"
  "${MSG_I_FLAGS}"
  "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg/Order.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/interact_msg_srv
)

### Generating Services
_generate_srv_cpp(interact_msg_srv
  "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/srv/PointCloud.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/interact_msg_srv
)

### Generating Module File
_generate_module_cpp(interact_msg_srv
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/interact_msg_srv
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(interact_msg_srv_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(interact_msg_srv_generate_messages interact_msg_srv_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg/NotifyGesture.msg" NAME_WE)
add_dependencies(interact_msg_srv_generate_messages_cpp _interact_msg_srv_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg/AsrResultMsg.msg" NAME_WE)
add_dependencies(interact_msg_srv_generate_messages_cpp _interact_msg_srv_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg/PointDirection.msg" NAME_WE)
add_dependencies(interact_msg_srv_generate_messages_cpp _interact_msg_srv_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg/Order.msg" NAME_WE)
add_dependencies(interact_msg_srv_generate_messages_cpp _interact_msg_srv_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg/OrderList.msg" NAME_WE)
add_dependencies(interact_msg_srv_generate_messages_cpp _interact_msg_srv_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/srv/PointCloud.srv" NAME_WE)
add_dependencies(interact_msg_srv_generate_messages_cpp _interact_msg_srv_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(interact_msg_srv_gencpp)
add_dependencies(interact_msg_srv_gencpp interact_msg_srv_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS interact_msg_srv_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(interact_msg_srv
  "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg/Order.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/interact_msg_srv
)
_generate_msg_lisp(interact_msg_srv
  "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg/AsrResultMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/interact_msg_srv
)
_generate_msg_lisp(interact_msg_srv
  "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg/NotifyGesture.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/interact_msg_srv
)
_generate_msg_lisp(interact_msg_srv
  "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg/PointDirection.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/PointStamped.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/interact_msg_srv
)
_generate_msg_lisp(interact_msg_srv
  "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg/OrderList.msg"
  "${MSG_I_FLAGS}"
  "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg/Order.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/interact_msg_srv
)

### Generating Services
_generate_srv_lisp(interact_msg_srv
  "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/srv/PointCloud.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/interact_msg_srv
)

### Generating Module File
_generate_module_lisp(interact_msg_srv
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/interact_msg_srv
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(interact_msg_srv_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(interact_msg_srv_generate_messages interact_msg_srv_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg/NotifyGesture.msg" NAME_WE)
add_dependencies(interact_msg_srv_generate_messages_lisp _interact_msg_srv_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg/AsrResultMsg.msg" NAME_WE)
add_dependencies(interact_msg_srv_generate_messages_lisp _interact_msg_srv_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg/PointDirection.msg" NAME_WE)
add_dependencies(interact_msg_srv_generate_messages_lisp _interact_msg_srv_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg/Order.msg" NAME_WE)
add_dependencies(interact_msg_srv_generate_messages_lisp _interact_msg_srv_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg/OrderList.msg" NAME_WE)
add_dependencies(interact_msg_srv_generate_messages_lisp _interact_msg_srv_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/srv/PointCloud.srv" NAME_WE)
add_dependencies(interact_msg_srv_generate_messages_lisp _interact_msg_srv_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(interact_msg_srv_genlisp)
add_dependencies(interact_msg_srv_genlisp interact_msg_srv_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS interact_msg_srv_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(interact_msg_srv
  "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg/Order.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/interact_msg_srv
)
_generate_msg_py(interact_msg_srv
  "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg/AsrResultMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/interact_msg_srv
)
_generate_msg_py(interact_msg_srv
  "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg/NotifyGesture.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/interact_msg_srv
)
_generate_msg_py(interact_msg_srv
  "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg/PointDirection.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/PointStamped.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/interact_msg_srv
)
_generate_msg_py(interact_msg_srv
  "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg/OrderList.msg"
  "${MSG_I_FLAGS}"
  "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg/Order.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/interact_msg_srv
)

### Generating Services
_generate_srv_py(interact_msg_srv
  "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/srv/PointCloud.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/interact_msg_srv
)

### Generating Module File
_generate_module_py(interact_msg_srv
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/interact_msg_srv
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(interact_msg_srv_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(interact_msg_srv_generate_messages interact_msg_srv_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg/NotifyGesture.msg" NAME_WE)
add_dependencies(interact_msg_srv_generate_messages_py _interact_msg_srv_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg/AsrResultMsg.msg" NAME_WE)
add_dependencies(interact_msg_srv_generate_messages_py _interact_msg_srv_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg/PointDirection.msg" NAME_WE)
add_dependencies(interact_msg_srv_generate_messages_py _interact_msg_srv_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg/Order.msg" NAME_WE)
add_dependencies(interact_msg_srv_generate_messages_py _interact_msg_srv_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/msg/OrderList.msg" NAME_WE)
add_dependencies(interact_msg_srv_generate_messages_py _interact_msg_srv_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/oslab/catkin_ws1/src/interact_proj/interact_msg_srv/srv/PointCloud.srv" NAME_WE)
add_dependencies(interact_msg_srv_generate_messages_py _interact_msg_srv_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(interact_msg_srv_genpy)
add_dependencies(interact_msg_srv_genpy interact_msg_srv_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS interact_msg_srv_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/interact_msg_srv)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/interact_msg_srv
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(interact_msg_srv_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(interact_msg_srv_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(interact_msg_srv_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/interact_msg_srv)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/interact_msg_srv
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(interact_msg_srv_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(interact_msg_srv_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(interact_msg_srv_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/interact_msg_srv)
  install(CODE "execute_process(COMMAND \"/usr/local/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/interact_msg_srv\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/interact_msg_srv
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(interact_msg_srv_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(interact_msg_srv_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(interact_msg_srv_generate_messages_py sensor_msgs_generate_messages_py)
endif()
