#!/bin/bash
# Ask the password right away
sudo -s
#Install terminator
sudo apt install terminator -y
# Install mp3 codecs
sudo apt install ubuntu-restricted-extras -y
# Install gnome tweaks
sudo apt install gnome-tweaks
# Install ghrome-gnome-shell connector
sudo apt install chrome-gnome-shell
sudo apt update

#Install ros
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

sudo apt update
sudo apt install ros-melodic-desktop-full -y

echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc

sudo apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential -y
sudo apt update

sudo rosdep init
rosdep update

#add git coloring
echo "parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}" >> ~/.bashrc
echo 'export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

alias killgazebo="killall -9 gazebo & killall -9 gzserver & killall -9 gzclient"'>> ~/.bashrc
source ~/.bashrc
