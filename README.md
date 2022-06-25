# About MASCOT #

MASCOT is a ROS-Gazebo based multiagent simulation platform developed by Indian Institute of Technology, Dharwad. This package uses the modified plugin from ['tum_simulator'] (http://wiki.ros.org/tum_simulator). MASCOT provides the researchers a standard platform to test their linear as well as non-linear control laws on a Multiagent System.This provides few basics linear and non-linear control law as an example where user can modify and tune the controller. User can write their own control law in basic python. Accesible states are position,velocity, accelertion,orientation of the quadcopter and can publish the force command.Here the quadcopter is modeled as double integrator.Also we have provided a Docker Image for easy usage.

## Requirements #
This package depends on few python pacakages.Please follow the below step to install it.

```
sudo apt-get install python3-pip -y  
sudo -H pip3 install --upgrade pip 
sudo apt-get install python3-tk
pip3 install rospkg ## Skip this step if you are using ROS Noetic
pip3 install matplotlib
pip3 install numpy
pip3 install --ignore-installed PyYAML
```

## Download and Compiling #
```
cd ~/catkin_ws/src
git clone https://github.com/Avi241/mascot.git
cd ~/catkin_ws
catkin make
```

Here catkin_ws is the path of the catkin workspace. Please refer to the [tutorial](http://wiki.ros.org/ROS/Tutorials) about how to create a catkin workspace in ROS.

## Using for testig Different Control Laws with Multiple Drone

Open config.yaml located at mascot/scripts.
Edit according to you requirements.

Run the lanch file creater program to create a launch file according to your specs.
This file generates the robots.launch file for spawning the number of drones with their position as specified in the config.yaml file, it also generates the controller.launch which launches the independent control nodes for each agent.
This command should be run after any changes in config.yaml file

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

## Writing your own control Algorithms 

Make the Custom_Control_Law Flag as True in config.yaml file
User can write their own control algorithms in the function user_control_func() located in file mascot/scripts/control.py . 
Copy of this file is automatically generated for each agent with i as their index so user need to write their algorithm accordingly.



# Using Docker 

We have developed a docker image to avoid any package or system dependencies issues.

Please follow the steps to run a docker image of the simulator.

#### Install docker using [convenience script](https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-using-the-convenience-script) (Skip this step if you already have docker installed on you system)
    
    sudo apt-get install curl
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh ./get-docker.sh

#### Steps to use docker without having to use sudo
    
    sudo groupadd docker
    # Add your user to the docker group.
    sudo usermod -aG docker $USER
    # Close the terminal or restart computer to see effects

#### Setting up the workspace on users computer

    cd ~/
    mkdir -p mascot/home

#### enable access to xhost from the container
    xhost +

#### Run docker and open bash shell

    docker run -it --privileged --env="DISPLAY" --env="QT_X11_NO_MITSHM=1" -v ~/mascot/home:/home/:rw --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" -p 14556:14556/udp --name=mascot avi241/mascot-sim bash

#### Try running the Program

    gazebo

#### If this shows any error follow the below step  or Move to usage step.

#### If system uses LibGL as a Graphics driver there won't be any error. For the systems using Nvidia as a Graphcis Driver please follow the below step.

#### install ubuntu drivers
    sudo apt-get update
    sudo apt-get install ubuntu-drivers-common
#### check your Nvidia drivers
    export LC_ALL=C.UTF-8
    export LANG=C.UTF-8
    sudo ubuntu-drivers devices
#### Install Nvidia drivers
    sudo ubuntu-drivers autoinstall
#### Try running gazebo again
    gazebo


## Basic Docker Commands

#### start docker container
    docker start project
#### stop the container
    docker stop project
#### remove the container
    docker rm project
#### list container
    docker container ls -a # -a is for all whether container is running or not
#### list docker images
    docker image ls -a
#### remove image
    docker image rm tiryoh/ros-melodic-desktop
#### open a new bash shell of this container
    docker exec -it project bash


