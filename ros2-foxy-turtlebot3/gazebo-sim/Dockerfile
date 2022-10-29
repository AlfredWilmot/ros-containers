FROM ros:foxy-ros-base

SHELL ["/bin/bash", "-c"]

#------------------------------------------------------------------------------#
# Install TurtleBot3 Packages
#------------------------------------------------------------------------------#
# References:
# - https://emanual.robotis.com/docs/en/platform/turtlebot3/quick-start/

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
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

RUN mkdir -p /root/turtlebot3_ws/src/ && \
    cd /root/turtlebot3_ws/src/ && \
    git clone -b foxy-devel https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git && \
    cd .. && \
    source /opt/ros/foxy/setup.bash && \
    colcon build --symlink-install

WORKDIR /root/turtlebot3_ws

CMD source /opt/ros/foxy/setup.bash && ros2 launch turtlebot3_gazebo turtlebot3_house.launch.py
