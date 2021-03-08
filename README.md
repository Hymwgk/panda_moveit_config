---
typora-root-url: ./
---

# Franka Emika Panda MoveIt! Config Package

The Panda robot is the flagship MoveIt! integration robot used in the MoveIt! tutorials.
Any changes to MoveIt! need to be propagated into this config fast, so this package
is co-located under the ``ros-planning`` Github organization here.

## 介绍

该包主要用于配合实体panda机械臂进行使用，相较于官方包，本包修改和添加了部分文件；

## 安装

1. 确保安装了moveit

   ```
   sudo apt install ros-melodic-moveit
   ```
2. 确保安装了panda的moveit配置包（我们的修改版本，包含了一些自定义launch文件）
    ```
    cd ~/catkin_ws/src
    git clone https://github.com/Hymwgk/panda_moveit_config.git -b melodic-devel
    cd ..
    catkin build
    echo 'source ~/catkin_ws/devel/setup.bash' >> ~/.bashrc
    ```
 3.确保安装了panda的描述文件
      ```
      sudo apt-get install ros-melodic-franka-description
      ```
4.确保安装了要求的显示工具
      ```
      sudo apt-get install ros-melodic-moveit-visual-tools
      sudo apt-get install ros-melodic-moveit-ros-visualization
      ```
      或者直接
      ```
      sudo apt-get install ros-melodic-moveit-ros-*
      ```

## 使用（功能）

1. 使用rviz中的Moveit插件来控制实体panda机械臂

   - 查看...
   - 运行launch文件

       ```
        roslaunch panda_moveit_config zzu_panda_move.launch
       ```

       如果出现以下报错

       ![image-20210308194742648](/pic/image-20210308194742648.png)

       执行以下命令即可

       ```
       cd ~/catkin_ws/src/panda_moveit_config/config
       sudo cp -r collision   /opt/ros/melodic/share/franka_description/meshes
       ```


   - 配置moveit的GUI，主要关心的是右侧的参数，防止机械臂运动过快

     ![image-20210308195221646](/pic/image-20210308195221646.png)