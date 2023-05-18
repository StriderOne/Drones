FROM registry.gitlab.com/roboforces-itmo/open-tasks/drone-line-follower/dlf-solution/base:latest

RUN apt-get update && apt-get upgrade -y
RUN apt-get install python3-pip -y && pip3 install --upgrade pip  && apt-get install python3-tk
RUN pip3 install matplotlib
RUN pip3 install numpy
RUN pip3 install --ignore-installed PyYAML
RUN pip install opencv-python
RUN apt-get update && apt-get install libgazebo11-dev libtinyxml2-dev -y && apt-get install libignition-math6-dev

RUN rm -rf /ros_ws/src
COPY . /ros_ws/src/

# ENV DEBIAN_FRONTEND noninteractive
# ENV GAZEBO_MASTER_URI ''


WORKDIR '/ros_ws'
# RUN /bin/bash -c "catkin build"


ENV QT_X11_NO_MITSHM 1
RUN echo "source /ros_ws/devel/setup.bash" >> ~/.bashrc

# HEALTHCHECK --interval=20s --timeout=5s --retries=3 --start-period=20s \
CMD ["/bin/bash"]


