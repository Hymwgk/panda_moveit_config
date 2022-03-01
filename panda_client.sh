#!/bin/bash
#Program:
#本脚本主要是将本机的ROS_MASTER_URL环境变量指向panda机械臂

#2020/08/09   zzu-wgk  first-release
#2022/03/01   zzu-wgk  version 1.1
#设置变量，注意等号两侧不要有空格，需要根据不同的主机名称来进行修改
#远程工控机局域网ip
remote_hostname="192.168.1.139"
#远程工控机账户名加ip； 账户名@ip
remote_user_hostname="zzu@192.168.1.139"
#panda机械臂与远程工控机之间通讯用的ip地址
robot_ip="192.168.10.1"
#将本机的ROS_MASTER_URI变量指向远程工控机ip地址，端口11311不需要修改
export ROS_MASTER_URI=http://192.168.1.139:11311
#设置本机ROS_HOSTNAME
export ROS_HOSTNAME=wgk

if [ "${1}" == "-r" ] ; then
	ssh $remote_user_hostname "source ~/catkin_ws/src/panda_server/panda_server.sh -s $robot_ip" 

elif [ "${1}" == "-k" ] ; then
	ssh $remote_user_hostname "source ~/catkin_ws/src/panda_server/panda_server.sh -k $robot_ip"

elif [ "${1}" == "-l" ] ; then
	ssh $remote_user_hostname "source ~/catkin_ws/src/panda_server/panda_server.sh -sd $robot_ip" >/dev/null 2>&1

elif [ ! -z "${1}" ] ; then
	
	echo "远程计算机名称           user@hostname: $remote_user_hostname "
	echo "功能：不加后缀参数         仅仅设置ROS_MASTER_URL" 
	echo "功能：后缀参数 -l          设置ROS_MASTER_URL，锁定机械臂, 关掉远程ros_controller"
	echo "功能：后缀参数 -r          设置ROS_MASTER_URL，解锁机械臂，并重新启动远程ros_controller"
	echo "功能：后缀参数 -k          设置ROS_MASTER_URL，仅仅ros_controller"
	
fi


