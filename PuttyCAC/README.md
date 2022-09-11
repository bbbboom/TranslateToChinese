# 汉化Putty-CAC

1. 由于部分增强功能依赖于ATL，所以只能安装 [Visual Studio](https://visualstudio.microsoft.com/zh-hans/downloads/) 进行编译。

2. 下载[汉化工具 translate.exe](https://raw.githubusercontent.com/bbbboom/TranslateToChinese/master/translate.exe)
和 [汉化配置 putty-cac.json](https://raw.githubusercontent.com/bbbboom/TranslateToChinese/master/PuttyCAC/putty-cac.json)

3. 下载[putty-cac源码](https://github.com/NoMoreFood/putty-cac)：  
    https://github.com/NoMoreFood/putty-cac/archive/refs/tags/0.77u1.zip

4. 将下载的**源码压缩包**和**汉化配置文件**一起拖到**汉化工具**上，注意路径不能包含中文。  

5. 稍等片刻后再打开 **Visual Studio** 进行编译即可。


### 不包含增强功能的编译
（不如用原版）

1. 需要安装[CMake](https://cmake.org/download/)（构建工具）和[Mingw-w64](https://github.com/niXman/mingw-builds-binaries/releases)（编译工具）

2. 下载[汉化工具 translate.exe](https://raw.githubusercontent.com/bbbboom/TranslateToChinese/master/translate.exe)
和 [汉化配置 putty-cac_nocac.json](https://raw.githubusercontent.com/bbbboom/TranslateToChinese/master/PuttyCAC/putty-cac_nocac.json)

3. 下载[putty-cac源码](https://github.com/NoMoreFood/putty-cac)：  
    https://github.com/NoMoreFood/putty-cac/archive/refs/tags/0.77u1.zip

4. 将下载的**源码压缩包**和**汉化配置文件**一起拖到**汉化工具**上，注意路径不能包含中文。  

5. 稍等片刻就可以在**putty-cac-dist**文件夹中使用编译好的exe了。


