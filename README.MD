# 项目介绍

1.使用pywebview搭建的桌面应用框架

2.把打包后的vue项目放入frontend文件夹

3.若要使用c++,请把编译后的pyd文件放入项目根目录

4.c++使用了xmake配置,vcpkg包管理工具,若没有请自行安装

## 安装步骤

1.安装python包
``pip install requirements.txt``

2.打包cpp项目
``cd cpp_tools``
``xmake``
``cd ..``
复制\cpp_tools\build\lib路径下的cpp_tools.pyd文件到根目录

3.打包前端项目
``cd vue_project``
``npm run build``
``cd ..``
复制dist文件到根目录的frontend文件夹

4.启动python项目
``python main.py``
5.打包
``pyinstaller  --windowed --name=pywebviewTemplate   main.py``
