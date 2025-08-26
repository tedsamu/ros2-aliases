#!/bin/bash

# ROS2 Development Aliases
# Source this file from your ~/.bashrc to load the aliases

# Version
VERSION="1.0.1"
# Configuration - adjust these paths as needed
export ROS_WS="${ROS_WS:-$HOME/ros2_ws}"
export ROS_DISTRO="${ROS_DISTRO:-humble}"
export RCUTILS_COLORIZED_OUTPUT=1

# ROS2 environment setup
source "/opt/ros/$ROS_DISTRO/setup.bash" 2>/dev/null || echo "Warning: ROS2 $ROS_DISTRO not found"

# Source workspace if it exists
if [ -f "$ROS_WS/install/setup.bash" ]; then
    source "$ROS_WS/install/setup.bash" 2>/dev/null
fi

# Aliases
alias ros2-source="source /opt/ros/$ROS_DISTRO/setup.bash && source $ROS_WS/install/setup.bash 2>/dev/null"

alias ros2-build="source /opt/ros/$ROS_DISTRO/setup.bash && (cd $ROS_WS && colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=RelWithDebInfo) && source $ROS_WS/install/setup.bash"

alias ros2-build-release="source /opt/ros/$ROS_DISTRO/setup.bash && (cd $ROS_WS && colcon build --cmake-args -DCMAKE_BUILD_TYPE=Release) && source $ROS_WS/install/setup.bash"

alias ros2-build-debug="source /opt/ros/$ROS_DISTRO/setup.bash && (cd $ROS_WS && colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Debug) && source $ROS_WS/install/setup.bash"

alias ros2-test="(cd $ROS_WS && colcon test && colcon test-result --verbose)"

alias ros2-clean="(rm -rf $ROS_WS/install $ROS_WS/build $ROS_WS/log) && unset AMENT_PREFIX_PATH && unset CMAKE_PREFIX_PATH && source /opt/ros/$ROS_DISTRO/setup.bash"

alias ros2-ps="ps aux | grep -E '(ros|ign)' | grep -v grep"

alias ros2-kill="pkill -f ros; pkill -f ign"

alias ros2-info="echo 'ROS_DISTRO: $ROS_DISTRO' && echo 'ROS_WS: $ROS_WS' && echo 'Workspace exists:' && ls -la $ROS_WS 2>/dev/null | head -5"

# Quick navigation
alias ros2-cd="cd $ROS_WS"
alias ros2-cdsrc="cd $ROS_WS/src"

# Help and version info
alias ros2-help="echo 'ROS2 Aliases v$VERSION' && \
echo '' && \
echo 'Available aliases:' && \
echo '  ros2-source        - Source ROS2 environment and workspace' && \
echo '  ros2-build         - Build and source workspace with RelWithDebInfo (symlink-install)' && \
echo '  ros2-build-release - Build and source workspace with Release optimizations' && \
echo '  ros2-build-debug   - Build and source workspace with Debug symbols (symlink-install)' && \
echo '  ros2-test          - Run all tests and show verbose results' && \
echo '  ros2-clean         - Clean build artifacts (install/build/log) and reset env' && \
echo '  ros2-ps            - Show running ROS/Ignition processes' && \
echo '  ros2-kill          - Kill all ROS/Ignition processes' && \
echo '  ros2-info          - Display current ROS2 configuration and workspace status' && \
echo '  ros2-cd            - Navigate to workspace root directory' && \
echo '  ros2-cdsrc         - Navigate to workspace src directory' && \
echo '  ros2-help          - Show this help message' && \
echo '' && \
echo 'Configuration:' && \
echo '  ROS_DISTRO: $ROS_DISTRO' && \
echo '  ROS_WS: $ROS_WS'"
