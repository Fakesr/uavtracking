# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

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
CMAKE_SOURCE_DIR = /home/dov1s/catkin_ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/dov1s/catkin_ws/build

# Include any dependencies generated for this target.
include fv_tracking/CMakeFiles/tracker_kcf.dir/depend.make

# Include the progress variables for this target.
include fv_tracking/CMakeFiles/tracker_kcf.dir/progress.make

# Include the compile flags for this target's objects.
include fv_tracking/CMakeFiles/tracker_kcf.dir/flags.make

fv_tracking/CMakeFiles/tracker_kcf.dir/nodes/tracker_kcf.cpp.o: fv_tracking/CMakeFiles/tracker_kcf.dir/flags.make
fv_tracking/CMakeFiles/tracker_kcf.dir/nodes/tracker_kcf.cpp.o: /home/dov1s/catkin_ws/src/fv_tracking/nodes/tracker_kcf.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/dov1s/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object fv_tracking/CMakeFiles/tracker_kcf.dir/nodes/tracker_kcf.cpp.o"
	cd /home/dov1s/catkin_ws/build/fv_tracking && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/tracker_kcf.dir/nodes/tracker_kcf.cpp.o -c /home/dov1s/catkin_ws/src/fv_tracking/nodes/tracker_kcf.cpp

fv_tracking/CMakeFiles/tracker_kcf.dir/nodes/tracker_kcf.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tracker_kcf.dir/nodes/tracker_kcf.cpp.i"
	cd /home/dov1s/catkin_ws/build/fv_tracking && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/dov1s/catkin_ws/src/fv_tracking/nodes/tracker_kcf.cpp > CMakeFiles/tracker_kcf.dir/nodes/tracker_kcf.cpp.i

fv_tracking/CMakeFiles/tracker_kcf.dir/nodes/tracker_kcf.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tracker_kcf.dir/nodes/tracker_kcf.cpp.s"
	cd /home/dov1s/catkin_ws/build/fv_tracking && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/dov1s/catkin_ws/src/fv_tracking/nodes/tracker_kcf.cpp -o CMakeFiles/tracker_kcf.dir/nodes/tracker_kcf.cpp.s

fv_tracking/CMakeFiles/tracker_kcf.dir/nodes/tracker_kcf.cpp.o.requires:

.PHONY : fv_tracking/CMakeFiles/tracker_kcf.dir/nodes/tracker_kcf.cpp.o.requires

fv_tracking/CMakeFiles/tracker_kcf.dir/nodes/tracker_kcf.cpp.o.provides: fv_tracking/CMakeFiles/tracker_kcf.dir/nodes/tracker_kcf.cpp.o.requires
	$(MAKE) -f fv_tracking/CMakeFiles/tracker_kcf.dir/build.make fv_tracking/CMakeFiles/tracker_kcf.dir/nodes/tracker_kcf.cpp.o.provides.build
.PHONY : fv_tracking/CMakeFiles/tracker_kcf.dir/nodes/tracker_kcf.cpp.o.provides

fv_tracking/CMakeFiles/tracker_kcf.dir/nodes/tracker_kcf.cpp.o.provides.build: fv_tracking/CMakeFiles/tracker_kcf.dir/nodes/tracker_kcf.cpp.o


# Object files for target tracker_kcf
tracker_kcf_OBJECTS = \
"CMakeFiles/tracker_kcf.dir/nodes/tracker_kcf.cpp.o"

# External object files for target tracker_kcf
tracker_kcf_EXTERNAL_OBJECTS =

/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: fv_tracking/CMakeFiles/tracker_kcf.dir/nodes/tracker_kcf.cpp.o
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: fv_tracking/CMakeFiles/tracker_kcf.dir/build.make
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /opt/ros/kinetic/lib/libimage_transport.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /opt/ros/kinetic/lib/libmessage_filters.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/lib/x86_64-linux-gnu/libtinyxml2.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /opt/ros/kinetic/lib/libclass_loader.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/lib/libPocoFoundation.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/lib/x86_64-linux-gnu/libdl.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /opt/ros/kinetic/lib/libroscpp.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/lib/x86_64-linux-gnu/libboost_signals.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /opt/ros/kinetic/lib/libxmlrpcpp.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /opt/ros/kinetic/lib/libroslib.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /opt/ros/kinetic/lib/librospack.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/lib/x86_64-linux-gnu/libpython2.7.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/lib/x86_64-linux-gnu/libboost_program_options.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/lib/x86_64-linux-gnu/libtinyxml.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/cv_bridge340/lib/libcv_bridge.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_core.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_imgproc.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_imgcodecs.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /opt/ros/kinetic/lib/librosconsole.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /opt/ros/kinetic/lib/librosconsole_log4cxx.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /opt/ros/kinetic/lib/librosconsole_backend_interface.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/lib/x86_64-linux-gnu/liblog4cxx.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/lib/x86_64-linux-gnu/libboost_regex.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /opt/ros/kinetic/lib/libroscpp_serialization.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /opt/ros/kinetic/lib/librostime.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /opt/ros/kinetic/lib/libcpp_common.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/lib/x86_64-linux-gnu/libboost_system.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/lib/x86_64-linux-gnu/libboost_thread.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/lib/x86_64-linux-gnu/libboost_chrono.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/lib/x86_64-linux-gnu/libboost_atomic.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/lib/x86_64-linux-gnu/libboost_thread.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/lib/x86_64-linux-gnu/libboost_chrono.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/lib/x86_64-linux-gnu/libboost_system.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/lib/x86_64-linux-gnu/libboost_atomic.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /home/dov1s/catkin_ws/devel/lib/libkcftracker.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /opt/ros/kinetic/lib/libimage_transport.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /opt/ros/kinetic/lib/libmessage_filters.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/lib/x86_64-linux-gnu/libtinyxml2.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /opt/ros/kinetic/lib/libclass_loader.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/lib/libPocoFoundation.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/lib/x86_64-linux-gnu/libdl.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /opt/ros/kinetic/lib/libroscpp.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/lib/x86_64-linux-gnu/libboost_signals.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /opt/ros/kinetic/lib/libxmlrpcpp.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /opt/ros/kinetic/lib/libroslib.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /opt/ros/kinetic/lib/librospack.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/lib/x86_64-linux-gnu/libpython2.7.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/lib/x86_64-linux-gnu/libboost_program_options.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/lib/x86_64-linux-gnu/libtinyxml.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/cv_bridge340/lib/libcv_bridge.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_core.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_imgproc.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_imgcodecs.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /opt/ros/kinetic/lib/librosconsole.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /opt/ros/kinetic/lib/librosconsole_log4cxx.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /opt/ros/kinetic/lib/librosconsole_backend_interface.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/lib/x86_64-linux-gnu/liblog4cxx.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/lib/x86_64-linux-gnu/libboost_regex.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /opt/ros/kinetic/lib/libroscpp_serialization.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /opt/ros/kinetic/lib/librostime.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /opt/ros/kinetic/lib/libcpp_common.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/lib/x86_64-linux-gnu/libboost_system.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/lib/x86_64-linux-gnu/libboost_thread.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/lib/x86_64-linux-gnu/libboost_chrono.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/lib/x86_64-linux-gnu/libboost_atomic.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/lib/x86_64-linux-gnu/libboost_system.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/lib/x86_64-linux-gnu/libboost_thread.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/lib/x86_64-linux-gnu/libboost_chrono.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/lib/x86_64-linux-gnu/libboost_atomic.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_videostab.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_superres.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_stitching.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_bgsegm.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_xfeatures2d.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_shape.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_hfs.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_ccalib.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_structured_light.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_phase_unwrapping.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_freetype.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_dpm.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_aruco.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_xphoto.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_line_descriptor.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_face.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_photo.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_bioinspired.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_tracking.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_plot.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_reg.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_rgbd.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_surface_matching.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_img_hash.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_optflow.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_video.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_ximgproc.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_xobjdetect.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_objdetect.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_dnn_objdetect.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_fuzzy.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_saliency.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_datasets.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_text.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_dnn.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_ml.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_stereo.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_calib3d.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_features2d.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_flann.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_highgui.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_videoio.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_imgcodecs.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_imgproc.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: /usr/local/lib/libopencv_core.so.3.4.6
/home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf: fv_tracking/CMakeFiles/tracker_kcf.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/dov1s/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf"
	cd /home/dov1s/catkin_ws/build/fv_tracking && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/tracker_kcf.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
fv_tracking/CMakeFiles/tracker_kcf.dir/build: /home/dov1s/catkin_ws/devel/lib/fv_tracking/tracker_kcf

.PHONY : fv_tracking/CMakeFiles/tracker_kcf.dir/build

fv_tracking/CMakeFiles/tracker_kcf.dir/requires: fv_tracking/CMakeFiles/tracker_kcf.dir/nodes/tracker_kcf.cpp.o.requires

.PHONY : fv_tracking/CMakeFiles/tracker_kcf.dir/requires

fv_tracking/CMakeFiles/tracker_kcf.dir/clean:
	cd /home/dov1s/catkin_ws/build/fv_tracking && $(CMAKE_COMMAND) -P CMakeFiles/tracker_kcf.dir/cmake_clean.cmake
.PHONY : fv_tracking/CMakeFiles/tracker_kcf.dir/clean

fv_tracking/CMakeFiles/tracker_kcf.dir/depend:
	cd /home/dov1s/catkin_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/dov1s/catkin_ws/src /home/dov1s/catkin_ws/src/fv_tracking /home/dov1s/catkin_ws/build /home/dov1s/catkin_ws/build/fv_tracking /home/dov1s/catkin_ws/build/fv_tracking/CMakeFiles/tracker_kcf.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : fv_tracking/CMakeFiles/tracker_kcf.dir/depend

