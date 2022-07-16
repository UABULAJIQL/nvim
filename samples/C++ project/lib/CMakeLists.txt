#多个源代码文件名放入到一个变量中
#AUX_SOURCE_DIRECTORY(./ lib_name0)#没有这个本目录下好像编译会卡住不通过
#AUX_SOURCE_DIRECTORY(./controller/ lib_name1)
#AUX_SOURCE_DIRECTORY(./entidy lib_name2)
#AUX_SOURCE_DIRECTORY(./tool/ lib_name3)
#AUX_SOURCE_DIRECTORY(./dao/ lib_name4)

#将多个文件文件拼接
#set(lib_name ${lib_name0} ${lib_name1} ${lib_name2} ${lib_name3} ${lib_name4})

#查看属性
#message(${lib_name})

#设置生成库的路径
#SET(LIBRARY_OUTPUT_PATH ${PROJECT_BINARY_DIR}/lib)

#创建一个静态库Mylib
#ADD_LIBRARY(mylib STATIC ${lib_name})
