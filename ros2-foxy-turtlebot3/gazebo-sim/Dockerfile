FROM ros:foxy-ros-base

SHELL ["/bin/bash", "-c"]

#------------------------------------------------------------------------------#
# Install TurtleBot3 Packages
#------------------------------------------------------------------------------#
# References:
# - https://emanual.robotis.com/docs/en/platform/turtlebot3/quick-start/
#
# Minimal setup
RUN apt-get update && \
    apt-get install -y locales lsb-release
ARG DEBIAN_FRONTEND=noninteractive
RUN dpkg-reconfigure locales

RUN apt-get update && \
    apt-get install -y \
            # Gazebo11
            ros-foxy-gazebo-* \
            # Cartographer
            ros-foxy-cartographer \
            ros-foxy-cartographer-ros \
            # Navigation2
            ros-foxy-navigation2 \
            ros-foxy-nav2-bringup \
            # Turtlebot3
            ros-foxy-dynamixel-sdk \
            ros-foxy-turtlebot3-msgs \
            ros-foxy-turtlebot3

#Configuring the ROS environment
ENV ROS_DOMAIN_ID=30

#------------------------------------------------------------------------------#
# Install Turtlebot3 Gazebo packages
#------------------------------------------------------------------------------#
# References:
# - https://emanual.robotis.com/docs/en/platform/turtlebot3/simulation/
# - https://github.com/ros2/ros2/issues/710
# - https://docs.ros.org/en/foxy/Tutorials/Beginner-Client-Libraries/Creating-A-Workspace/Creating-A-Workspace.html

RUN mkdir -p /root/turtlebot3_ws/src/ && \
    cd /root/turtlebot3_ws/src/ && \
    git clone -b foxy-devel https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git && \
    cd .. && \
    source /opt/ros/foxy/setup.bash && \
    colcon build --symlink-install

# Installing other deps

RUN apt-get update && \
    apt-get install -y \
            ros-foxy-rqt*

WORKDIR /root/turtlebot3_ws

# setup entrypoint, set executable bit
COPY ./ros_entrypoint.sh /
RUN bash -c "chmod +x /ros_entrypoint.sh"

ENTRYPOINT ["/ros_entrypoint.sh"]
