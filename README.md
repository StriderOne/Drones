# How run docker #

Firstly, to enable gui run:

```
xhost +local:docker
```

Secondly, create docker image:

```
docker build -t drone_base_image .
```

After that, run docker compose:

```
docker compose up
```

Below you can see comands to interact with simulation.

Only simulation.launch starts with docker. To run other commands you need to run them from another terminal in the same docker container.

# About #

This repository proivde a ROS-Gazebo based multiagent simulation platform with Tello drones.

#### Start the Simulation

```
roslaunch mascot simulation.launch
```

#### Initilize the Drones at the specified position

```
rosrun mascot initialization.py
```

#### Start the Controller

```
roslaunch mascot controller.launch
```

#### Leader Position Publisher / Single quadcopter position publisher when using in position control mode
```
rosrun mascot leader_control.py
```


