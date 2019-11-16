@echo on
@chcp 65001

xcopy "%1\dist" "%1\..\swagger-ui\" /e
cd "%1\..\swagger-ui\"
sh %~dp0swagger.txt

pause
