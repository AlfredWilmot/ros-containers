#!/bin/bash
set -e

# setup ros2 environment (source the "ROS2 underlay" and the "workspace overlay")
source "/opt/ros/$ROS_DISTRO/setup.bash" --
source "install/local_setup.bash" --
exec "$@"
