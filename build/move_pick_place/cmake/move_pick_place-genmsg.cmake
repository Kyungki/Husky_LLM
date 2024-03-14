# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "move_pick_place: 0 messages, 1 services")

set(MSG_I_FLAGS "-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(move_pick_place_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/kyungki/workspace/husky_ws/src/move_pick_place/srv/ChatGpt.srv" NAME_WE)
add_custom_target(_move_pick_place_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "move_pick_place" "/home/kyungki/workspace/husky_ws/src/move_pick_place/srv/ChatGpt.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(move_pick_place
  "/home/kyungki/workspace/husky_ws/src/move_pick_place/srv/ChatGpt.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/move_pick_place
)

### Generating Module File
_generate_module_cpp(move_pick_place
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/move_pick_place
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(move_pick_place_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(move_pick_place_generate_messages move_pick_place_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/kyungki/workspace/husky_ws/src/move_pick_place/srv/ChatGpt.srv" NAME_WE)
add_dependencies(move_pick_place_generate_messages_cpp _move_pick_place_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(move_pick_place_gencpp)
add_dependencies(move_pick_place_gencpp move_pick_place_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS move_pick_place_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(move_pick_place
  "/home/kyungki/workspace/husky_ws/src/move_pick_place/srv/ChatGpt.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/move_pick_place
)

### Generating Module File
_generate_module_eus(move_pick_place
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/move_pick_place
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(move_pick_place_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(move_pick_place_generate_messages move_pick_place_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/kyungki/workspace/husky_ws/src/move_pick_place/srv/ChatGpt.srv" NAME_WE)
add_dependencies(move_pick_place_generate_messages_eus _move_pick_place_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(move_pick_place_geneus)
add_dependencies(move_pick_place_geneus move_pick_place_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS move_pick_place_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(move_pick_place
  "/home/kyungki/workspace/husky_ws/src/move_pick_place/srv/ChatGpt.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/move_pick_place
)

### Generating Module File
_generate_module_lisp(move_pick_place
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/move_pick_place
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(move_pick_place_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(move_pick_place_generate_messages move_pick_place_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/kyungki/workspace/husky_ws/src/move_pick_place/srv/ChatGpt.srv" NAME_WE)
add_dependencies(move_pick_place_generate_messages_lisp _move_pick_place_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(move_pick_place_genlisp)
add_dependencies(move_pick_place_genlisp move_pick_place_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS move_pick_place_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(move_pick_place
  "/home/kyungki/workspace/husky_ws/src/move_pick_place/srv/ChatGpt.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/move_pick_place
)

### Generating Module File
_generate_module_nodejs(move_pick_place
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/move_pick_place
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(move_pick_place_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(move_pick_place_generate_messages move_pick_place_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/kyungki/workspace/husky_ws/src/move_pick_place/srv/ChatGpt.srv" NAME_WE)
add_dependencies(move_pick_place_generate_messages_nodejs _move_pick_place_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(move_pick_place_gennodejs)
add_dependencies(move_pick_place_gennodejs move_pick_place_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS move_pick_place_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(move_pick_place
  "/home/kyungki/workspace/husky_ws/src/move_pick_place/srv/ChatGpt.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/move_pick_place
)

### Generating Module File
_generate_module_py(move_pick_place
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/move_pick_place
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(move_pick_place_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(move_pick_place_generate_messages move_pick_place_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/kyungki/workspace/husky_ws/src/move_pick_place/srv/ChatGpt.srv" NAME_WE)
add_dependencies(move_pick_place_generate_messages_py _move_pick_place_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(move_pick_place_genpy)
add_dependencies(move_pick_place_genpy move_pick_place_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS move_pick_place_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/move_pick_place)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/move_pick_place
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(move_pick_place_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/move_pick_place)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/move_pick_place
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(move_pick_place_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/move_pick_place)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/move_pick_place
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(move_pick_place_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/move_pick_place)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/move_pick_place
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(move_pick_place_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/move_pick_place)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/move_pick_place\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/move_pick_place
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(move_pick_place_generate_messages_py std_msgs_generate_messages_py)
endif()
