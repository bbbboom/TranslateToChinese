@echo off
chcp 65001
title putty自动编译脚本
color f1
rem ****************** 获取编译目录 ******************
set spath=%1

rem ****************** 展示提示信息 ******************
echo   _______________________________________________________
echo  ^|                                                       ^|
echo  ^|        欢迎使用putty汉化脚本(VisualStudio编译版)      ^|
echo  ^|                                                       ^|
echo  ^|   使用须知:                                           ^|
echo  ^|   1、本脚本仅汉化代码并不编译代码                     ^|
echo  ^|   2、汉化完毕之后,需要您使用VisualStudio编译          ^|
echo  ^|   3、确定putty-src-vs.bat和putty-src-new.sh在同目录   ^|
echo  ^|                                                       ^|
echo  ^|   最后修改: 2022/09/07 03:41                          ^|
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

sh %~dp0putty-src-new.sh





rem ****************** 汉化完毕 ******************
cls
color f1
echo;
echo ================== 汉化完毕 ==================
echo;
echo 接下来请使用VisualStudio编译
echo;
pause