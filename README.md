# About #

This repository proivde a ROS-Gazebo based multiagent simulation platform with Tello drones.

```
rosrun mascot configure.py 
```

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


