# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/hj/shaobing_ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/hj/shaobing_ws/build

# Utility rule file for new_msgs_generate_messages_cpp.

# Include the progress variables for this target.
include new_msgs/CMakeFiles/new_msgs_generate_messages_cpp.dir/progress.make

new_msgs/CMakeFiles/new_msgs_generate_messages_cpp: /home/hj/shaobing_ws/devel/include/new_msgs/Armor.h
new_msgs/CMakeFiles/new_msgs_generate_messages_cpp: /home/hj/shaobing_ws/devel/include/new_msgs/vector_Armor.h
new_msgs/CMakeFiles/new_msgs_generate_messages_cpp: /home/hj/shaobing_ws/devel/include/new_msgs/barrel.h
new_msgs/CMakeFiles/new_msgs_generate_messages_cpp: /home/hj/shaobing_ws/devel/include/new_msgs/chassis.h


/home/hj/shaobing_ws/devel/include/new_msgs/Armor.h: /opt/ros/noetic/lib/gencpp/gen_cpp.py
/home/hj/shaobing_ws/devel/include/new_msgs/Armor.h: /home/hj/shaobing_ws/src/new_msgs/msg/Armor.msg
/home/hj/shaobing_ws/devel/include/new_msgs/Armor.h: /opt/ros/noetic/share/gencpp/msg.h.template
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/hj/shaobing_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating C++ code from new_msgs/Armor.msg"
	cd /home/hj/shaobing_ws/src/new_msgs && /home/hj/shaobing_ws/build/catkin_generated/env_cached.sh /usr/bin/python3 /opt/ros/noetic/share/gencpp/cmake/../../../lib/gencpp/gen_cpp.py /home/hj/shaobing_ws/src/new_msgs/msg/Armor.msg -Inew_msgs:/home/hj/shaobing_ws/src/new_msgs/msg -Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg -p new_msgs -o /home/hj/shaobing_ws/devel/include/new_msgs -e /opt/ros/noetic/share/gencpp/cmake/..

/home/hj/shaobing_ws/devel/include/new_msgs/vector_Armor.h: /opt/ros/noetic/lib/gencpp/gen_cpp.py
/home/hj/shaobing_ws/devel/include/new_msgs/vector_Armor.h: /home/hj/shaobing_ws/src/new_msgs/msg/vector_Armor.msg
/home/hj/shaobing_ws/devel/include/new_msgs/vector_Armor.h: /opt/ros/noetic/share/gencpp/msg.h.template
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/hj/shaobing_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating C++ code from new_msgs/vector_Armor.msg"
	cd /home/hj/shaobing_ws/src/new_msgs && /home/hj/shaobing_ws/build/catkin_generated/env_cached.sh /usr/bin/python3 /opt/ros/noetic/share/gencpp/cmake/../../../lib/gencpp/gen_cpp.py /home/hj/shaobing_ws/src/new_msgs/msg/vector_Armor.msg -Inew_msgs:/home/hj/shaobing_ws/src/new_msgs/msg -Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg -p new_msgs -o /home/hj/shaobing_ws/devel/include/new_msgs -e /opt/ros/noetic/share/gencpp/cmake/..

/home/hj/shaobing_ws/devel/include/new_msgs/barrel.h: /opt/ros/noetic/lib/gencpp/gen_cpp.py
/home/hj/shaobing_ws/devel/include/new_msgs/barrel.h: /home/hj/shaobing_ws/src/new_msgs/msg/barrel.msg
/home/hj/shaobing_ws/devel/include/new_msgs/barrel.h: /opt/ros/noetic/share/gencpp/msg.h.template
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/hj/shaobing_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Generating C++ code from new_msgs/barrel.msg"
	cd /home/hj/shaobing_ws/src/new_msgs && /home/hj/shaobing_ws/build/catkin_generated/env_cached.sh /usr/bin/python3 /opt/ros/noetic/share/gencpp/cmake/../../../lib/gencpp/gen_cpp.py /home/hj/shaobing_ws/src/new_msgs/msg/barrel.msg -Inew_msgs:/home/hj/shaobing_ws/src/new_msgs/msg -Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg -p new_msgs -o /home/hj/shaobing_ws/devel/include/new_msgs -e /opt/ros/noetic/share/gencpp/cmake/..

/home/hj/shaobing_ws/devel/include/new_msgs/chassis.h: /opt/ros/noetic/lib/gencpp/gen_cpp.py
/home/hj/shaobing_ws/devel/include/new_msgs/chassis.h: /home/hj/shaobing_ws/src/new_msgs/msg/chassis.msg
/home/hj/shaobing_ws/devel/include/new_msgs/chassis.h: /opt/ros/noetic/share/gencpp/msg.h.template
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/hj/shaobing_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Generating C++ code from new_msgs/chassis.msg"
	cd /home/hj/shaobing_ws/src/new_msgs && /home/hj/shaobing_ws/build/catkin_generated/env_cached.sh /usr/bin/python3 /opt/ros/noetic/share/gencpp/cmake/../../../lib/gencpp/gen_cpp.py /home/hj/shaobing_ws/src/new_msgs/msg/chassis.msg -Inew_msgs:/home/hj/shaobing_ws/src/new_msgs/msg -Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg -p new_msgs -o /home/hj/shaobing_ws/devel/include/new_msgs -e /opt/ros/noetic/share/gencpp/cmake/..

new_msgs_generate_messages_cpp: new_msgs/CMakeFiles/new_msgs_generate_messages_cpp
new_msgs_generate_messages_cpp: /home/hj/shaobing_ws/devel/include/new_msgs/Armor.h
new_msgs_generate_messages_cpp: /home/hj/shaobing_ws/devel/include/new_msgs/vector_Armor.h
new_msgs_generate_messages_cpp: /home/hj/shaobing_ws/devel/include/new_msgs/barrel.h
new_msgs_generate_messages_cpp: /home/hj/shaobing_ws/devel/include/new_msgs/chassis.h
new_msgs_generate_messages_cpp: new_msgs/CMakeFiles/new_msgs_generate_messages_cpp.dir/build.make

.PHONY : new_msgs_generate_messages_cpp

# Rule to build all files generated by this target.
new_msgs/CMakeFiles/new_msgs_generate_messages_cpp.dir/build: new_msgs_generate_messages_cpp

.PHONY : new_msgs/CMakeFiles/new_msgs_generate_messages_cpp.dir/build

new_msgs/CMakeFiles/new_msgs_generate_messages_cpp.dir/clean:
	cd /home/hj/shaobing_ws/build/new_msgs && $(CMAKE_COMMAND) -P CMakeFiles/new_msgs_generate_messages_cpp.dir/cmake_clean.cmake
.PHONY : new_msgs/CMakeFiles/new_msgs_generate_messages_cpp.dir/clean

new_msgs/CMakeFiles/new_msgs_generate_messages_cpp.dir/depend:
	cd /home/hj/shaobing_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/hj/shaobing_ws/src /home/hj/shaobing_ws/src/new_msgs /home/hj/shaobing_ws/build /home/hj/shaobing_ws/build/new_msgs /home/hj/shaobing_ws/build/new_msgs/CMakeFiles/new_msgs_generate_messages_cpp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : new_msgs/CMakeFiles/new_msgs_generate_messages_cpp.dir/depend
