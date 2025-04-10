#!bin/bash

# This script configures the ROS environment variables. The ROS_IP and ROS_HOSTNAME are configured as the local IP
# If the IP of the ROS_MASTER_URI is given as an argument argument to this script, then the ROS_MASTER is set to  
# that address, otherwise the local ip is considered as master. The ROS_MASTER_URI is set, using the port 11311. 

LOC_IP_temp=`hostname -I`
export ROS_IP=`ip route get $LOC_IP_temp | grep "src" | sed 's/.*src \([0-9\.]*\).*/\1/'`
export ROS_HOSTNAME=`ip route get $LOC_IP_temp | grep "src" | sed 's/.*src \([0-9\.]*\).*/\1/'`
if [ "$1" ]; then
	ROS_MASTER_URI="http://$1:11311"
else
	ROS_MASTER_URI="http://$ROS_IP:11311"
fi

echo "ROS_IP:         $ROS_IP"
echo "ROS_HOSTNAME:   $ROS_HOSTNAME"
echo "ROS_MASTER_URI: $ROS_MASTER_URI"