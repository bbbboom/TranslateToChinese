# 汉化Putty

*汉化文本部分参考[larryli](https://github.com/larryli/PuTTY)*

*理论兼容putty0.70-0.77，这里以0.77版作为举例*

*旧版汉化代码可以在 0.76 分支查看*

1. 需要安装[CMake](https://cmake.org/download/)（构建工具）和[Mingw-w64](https://github.com/niXman/mingw-builds-binaries/releases)（编译工具）

2. 下载[汉化工具 translate.exe](https://raw.githubusercontent.com/bbbboom/TranslateToChinese/master/translate.exe) 和 [汉化配置 putty-src.json](https://raw.githubusercontent.com/bbbboom/TranslateToChinese/master/Putty/putty-src.json)

3. 下载[putty源码](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html)：  
    https://the.earth.li/~sgtatham/putty/0.77/putty-src.zip

4. (可选) 下载[putty便携化源码](https://jakub.kotrla.net/putty/)：  
    https://jakub.kotrla.net/putty/portable_putty_077_0.19.0_all_in_one.zip

5. 将下载的 **源码压缩包** 和 **汉化配置文件** 一起拖到 **汉化工具** 上，注意路径不能包含中文。

6. 稍等片刻就可以在 **putty-dist** 文件夹中使用编译好的exe了。


