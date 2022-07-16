#添加头文件路径
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}/mylib)

#添加生成可执行文件的路径
SET(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/bin)


#多个源代码文件名放入到一个变量中
AUX_SOURCE_DIRECTORY(./ main_name)

#生成可执行文件
ADD_EXECUTABLE(main ${main_name})

#添加库文件
#TARGET_LINK_LIBRARIES(main boost_system pthread protobuf mysqlclient)


