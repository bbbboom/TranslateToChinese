# 汉化Putty

*汉化文本部分参考[larryli](https://github.com/larryli/PuTTY)*  
  
*理论兼容putty0.70-0.74，这里以0.74版作为举例*  

1. 需要安装[git客户端](https://git-scm.com/download/win)（shell环境）和[Mingw-w64](https://sourceforge.net/projects/mingw-w64/files/)（编译putty）

2. 下载[putty源码](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html)：  
    https://the.earth.li/~sgtatham/putty/0.74/putty-src.zip

3. 解压putty-src.zip，得到文件夹**putty-src**

4. 不需要便携化可以直接跳至 第7步

5. 下载[putty便携化源码](http://jakub.kotrla.net/putty/)：  
    http://jakub.kotrla.net/putty/portable_putty_074_0.16.0_all_in_one.zip

6. 解压portable_putty_074_0.16.0_all_in_one.zip  
将portable_putty_074_0.16.0_all_in_one中的**winpgnt.c**和**winstore.c**两个文件替换到**putty-src/windows**下

7. 将**putty-src**文件夹拖至**putty-src.bat**  

8. 稍等片刻就可以在**putty-build**文件夹中使用编译好的exe了
