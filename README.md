# ros-containers
Containerized ROS/ROS2 applications developed for simplifying the deployment of educational resources.

## Setup instructions ##
In order to run the demos below, some prerequisites are needed first.

#### Ubuntu 20.04 ####

Install docker prerequisites:
```bash
chmod +x ubuntu_20_04_setup.sh
. setup.sh
```
Allow the container to access the host machine's X-server (DISPLAY), \
**this has to be done whenever starting a new terminal session**:
```bash
xhost +
```

With the prerequisites installed, run the following in the same directory
as the `docker-compose.yaml` file containing the demo you want to execute:
```bash
docker-compose up -d 
```

### Demos ###
Two containers running ROS2 (foxy) GUI applications (Gazebo11 and RQT) to control a Turtlebot3 sim:
![Alt Text](./ros2-foxy-turtlebot3/burger-explores-his-home.gif)
