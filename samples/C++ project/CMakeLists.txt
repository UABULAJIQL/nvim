#定义cmake最低版本号要求
CMAKE_MINIMUM_REQUIRED(VERSION 3.16.3)

#定义项目名称
PROJECT(MBServer)

#设置版本
ADD_DEFINITIONS(-std=c++17)

#添加子目录
ADD_SUBDIRECTORY(./lib)
ADD_SUBDIRECTORY(./src)


