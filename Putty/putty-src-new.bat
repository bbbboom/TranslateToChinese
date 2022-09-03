@echo off
chcp 65001
title putty自动编译脚本
color f1
rem ****************** 获取编译目录 ******************
set spath=%1

rem ****************** 展示提示信息 ******************
echo   _______________________________________________________
echo  ^|                                                       ^|
echo  ^|             欢迎使用putty自动编译脚本                 ^|
echo  ^|                                                       ^|
echo  ^|   使用须知:                                           ^|
echo  ^|   1、本脚本仅支持 Windows 环境                        ^|
echo  ^|   2、您需要预先安装 CMake 脚本环境                    ^|
echo  ^|   3、您需要预先安装 Mingw-w64 GCC编译环境             ^|
echo  ^|   4、您需要预先安装 GIT Shell命令环境                 ^|
echo  ^|   5、确定putty-src-new.bat和putty-src-new.sh在同目录  ^|
echo  ^|   6、请将源码文件夹拖放至本脚本文件来打开本脚本       ^|
echo  ^|   7、编译文件输出目录 build，程序输出目录 output      ^|
echo  ^|                                                       ^|
echo  ^|   汉化人员: bbbboom、wanyanjiabin                     ^|
echo  ^|   最后修改: 2022/09/02 05:01                          ^|
echo  ^|   修改人员: wanyanjiabin                              ^|
echo   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
rem ****************** 判断编译目录 ******************
if "%spath%" == "" (
	echo;
	echo ×××××××× 警告 Warning ××××××××
	echo;
	echo 识别编译目录失败，请勿直接打开本脚本！！！
	echo 请将源码文件夹拖放至本脚本文件来打开本脚本。
	echo;
	pause
	exit;
) else (
	echo;
	echo 当前编译目录^: %spath%
	cd %spath%
	echo;
	echo 请按任意键继续编译...
	echo;
)
pause




rem ****************** 开始汉化源码 ******************
cls
color 2e
echo ================== 开始汉化源码 ==================

@sh %~dp0putty-src-new.sh





rem ****************** 开始编译源码 ******************
cls
color 07
echo;
echo ================== 开始编译源码 ==================
echo;
cd %spath%
set buildFolder=%spath%\build
set outputFolder=%spath%\output
if exist %buildFolder% (
	rd  /s /q %buildFolder%
)
if exist %outputFolder% (
	rd  /s /q %outputFolder%
)
mkdir build & ^
mkdir output & ^
cmake -G "MinGW Makefiles" -B "build" . & ^
cd ./build & ^
cmake --build . & ^
cd ../ & ^
move /y "build\*.exe" output\ & ^
del /f /s /q %outputFolder%\bidi_gettype.exe & ^
del /f /s /q %outputFolder%\bidi_test.exe & ^
del /f /s /q %outputFolder%\test_decode_utf8.exe & ^
del /f /s /q %outputFolder%\test_host_strfoo.exe & ^
del /f /s /q %outputFolder%\test_split_into_argv.exe & ^
del /f /s /q %outputFolder%\test_tree234.exe & ^
del /f /s /q %outputFolder%\test_wildcard.exe & ^
del /f /s /q %outputFolder%\testcrypt.exe




rem ****************** 编译完毕 ******************
:: cls
color f1
echo;
echo ================== 编译完毕 ==================
echo;
echo 文件输出目录: %outputFolder%
echo;
pause