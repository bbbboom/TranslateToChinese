@echo on
@chcp 65001

cd "%1"
sh %~dp0putty-src.txt & ^
cd "%1\windows" & ^
mingw32-make -f Makefile.mgw

pause
