#添加头文件路径
include_directories(${PROJECT_SOURCE_DIR}/lib)

#多个源代码文件名放入到一个变量中
aux_source_directory(./ _libs)
aux_source_directory(./tools _libs)


#查看输出信息
#message(${_libs})

#设置生成库的路径
set(LIBRARY_OUTPUT_PATH ${PROJECT_BINARY_DIR}/lib)

#创建一个静态库Mylib
add_library(mylib STATIC ${_libs})

