cmake_minimum_required(VERSION 2.8.3)
project(gesture_recog)

add_compile_options(-std=c++11 -O3 -Werror)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  message_generation #如果要定义消息，则添加
  interact_msg_srv
  geometry_msgs
  sensor_msgs
)

#find_package(yaml-cpp REQUIRED)
generate_messages(
 DEPENDENCIES
 geometry_msgs
 sensor_msgs
)

#generate_messages必须在catkin_package前面
catkin_package(
  #INCLUDE_DIRS
  #include
  CATKIN_DEPENDS
  message_runtime #设置message运行依赖
  #roscpp
  #std_msgs

)

include_directories(
  include
  ${catkin_INCLUDE_DIRS}
  #${YAML_CPP_INCLUDE_DIR}
)

#add_library(my_lib #定义自己的lib库
#  src/....cpp
#)

#target_link_libraries(my_lib//自己的lib库需要链接的其他库
  #other_lib
  #${catkin_LIBRARIES}
  #${YAML_CPP_LIBRARIES}
#)

#add_executable(order2navi
#  src/order2navi.cpp
#)

#target_link_libraries(order2navi
  #other_lib
#  ${catkin_LIBRARIES}
#)
