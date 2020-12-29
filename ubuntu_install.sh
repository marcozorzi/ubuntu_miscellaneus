#!/bin/bash
# Ask the password right away
sudo -s
#Install terminator
sudo apt install terminator -y
# Install mp3 codecs
#sudo apt install ubuntu-restricted-extras -y
# Install gnome tweaks
#sudo apt install gnome-tweaks
# Install ghrome-gnome-shell connector
#sudo apt install chrome-gnome-shell

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

#Install PX4 stuff
sudo usermod -a -G dialout $USER
sudo add-apt-repository ppa:george-edison55/cmake-3.x -y
sudo apt-get update
sudo apt-get install python-argparse git-core wget zip \
    python-empy qtcreator cmake build-essential genromfs -y
# simulation tools
sudo add-apt-repository ppa:openjdk-r/ppa
sudo apt-get update
sudo apt-get install ant protobuf-compiler libeigen3-dev libopencv-dev clang-3.5 lldb-3.5 openjdk-8-jdk openjdk-8-jre -y
sudo apt-get remove modemmanager -y
sudo apt-get install python-serial openocd \
    flex bison libncurses5-dev autoconf texinfo build-essential \
    libftdi-dev libtool zlib1g-dev \
    python-empy  -y
sudo apt-get remove gcc-arm-none-eabi gdb-arm-none-eabi binutils-arm-none-eabi gcc-arm-embedded
sudo add-apt-repository --remove ppa:team-gcc-arm-embedded/ppa

pushd .
cd ~
wget https://launchpad.net/gcc-arm-embedded/4.9/4.9-2015-q3-update/+download/gcc-arm-none-eabi-4_9-2015q3-20150921-linux.tar.bz2
tar -jxf gcc-arm-none-eabi-4_9-2015q3-20150921-linux.tar.bz2
exportline="export PATH=$HOME/gcc-arm-none-eabi-4_9-2015q3/bin:\$PATH"
if grep -Fxq "$exportline" ~/.profile; then echo nothing to do ; else echo $exportline >> ~/.profile; fi
. ~/.profile
popd


# Clone firmware
mkdir -p ~/src
cd ~/src
git clone https://github.com/PX4/Firmware.git
cd Firmware
git submodule update --init --recursive
cd ..

# Install gazebo
sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'
wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -
sudo apt-get update
sudo apt-get install gazebo7 libgazebo7 gazebo7-common gazebo7-plugin-base libgazebo7-dev -y
sudo apt-get install python-jinja2 -y

# Install qgroundcontrol
sudo apt-get install espeak libespeak-dev libudev-dev libsdl2-dev -y
wget https://github.com/mavlink/qgroundcontrol/releases/download/v3.1.3/QGroundControl.tar.bz2
tar xvjf QGroundControl.tar.bz2

#Install qtcreator
wget http://download.qt.io/official_releases/qt/5.7/5.7.0/qt-opensource-linux-x64-5.7.0.run
chmod +x qt-opensource-linux-x64-5.7.0.run
./qt-opensource-linux-x64-5.7.0.run



