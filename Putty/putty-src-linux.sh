echo "\e[33m  _______________________________________________________\e[0m"
echo "\e[33m |                                                       |\e[0m"
echo "\e[33m |             欢迎使用putty自动编译脚本                 |\e[0m"
echo "\e[33m |                                                       |\e[0m"
echo "\e[33m |   使用须知:                                           |\e[0m"
echo "\e[33m |   1、本脚本仅支持 Ubantu/Debian 环境                  |\e[0m"
echo "\e[33m |   2、编译文件输出目录 build，程序输出目录 output      |\e[0m"
echo "\e[33m |   3、使用sudo运行避免多次输入密码                     |\e[0m"
echo "\e[33m |   4、本脚本使用交叉编译不一定稳定                     |\e[0m"
echo "\e[33m |                                                       |\e[0m"
echo "\e[33m |   汉化人员: bbbboom、wanyanjiabin                     |\e[0m"
echo "\e[33m |   最后修改: 2022/09/02 05:01                          |\e[0m"
echo "\e[33m |   修改人员: wanyanjiabin                              |\e[0m"
echo "\e[33m  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
echo "\n"
echo "\n"
echo "安装程序即将开始,请耐心等待结果"
sleep 5
echo "\n"
echo "\n"
echo "\n"
echo "\n"

clear
#安装环境
echo "\e[33m ======================= 安装环境 ======================= \e[0m"
echo "\n"
sleep 1

sudo apt-get install -y wget
sudo apt-get install -y cmake
sudo apt-get install -y mingw-w64
sudo apt-get install -y git
sudo apt-get install -y unzip

clear
#下载源文件
echo "\e[33m ======================= 下载源文件 ======================= \e[0m"
echo "\n"
sleep 1

# wget "https://the.earth.li/~sgtatham/putty/0.77/putty-0.77.tar.gz"
# wget "http://jakub.kotrla.net/putty/portable_putty_077_0.19.0_all_in_one.zip"

clear
#解压源代码
echo "\e[33m ======================= 解压源代码 ======================= \e[0m"
echo "\n"
sleep 1

mkdir putty-src
tar -zxvf ./putty-0.77.tar.gz -C putty-src/
unzip ./portable_putty_077_0.19.0_all_in_one.zip -d portable_putty
cp -rf ./portable_putty/0.77/pageant.c ./putty-src/putty-0.77/windows/
cp -rf ./portable_putty/0.77/storage.c ./putty-src/putty-0.77/windows/
cd ./putty-src/putty-0.77/


clear
#开始汉化
echo "\e[33m ======================= 开始汉化 ======================= \e[0m"
echo "\n"
sleep 1

# cgtest.c
file_name="cgtest.c"
echo [00%]开始汉化 cgtest.c
perl -i -pe 's#\Q"  prompt \"%s\": response \"%s\"\n"#"提示 \\"%s\\": 响应 \\"%s\\"\\n"#g' $file_name
perl -i -pe 's#\Q"  prompt \"%s\": no response preloaded\n"#"提示 \\"%s\\": 没有预加载响应\\n"#g' $file_name
perl -i -pe 's#\Q"FAILED retval (exp %d got %d):"#"失败的回报 (exp %d got %d):"#g' $file_name
perl -i -pe 's#\Q"FAILED nprompts (exp %d got %d):"#"失败的 nprompts (exp %d got %d):"#g' $file_name
perl -i -pe 's#\Q"FAILED diff (ret=%d): "#"失败 diff (ret=%d): "#g' $file_name
perl -i -pe 's#\Q"usage:     cgtest [options] [key types]\n"#"用法：cgtest [选项] [密钥类型]\\n"#g' $file_name
perl -i -pe 's#\Q"options:   -v, --verbose         "#"选项：-v，--verbose         "#g' $file_name
perl -i -pe 's#\Q"print more output during tests\n"#"在测试期间打印更多输出\\n"#g' $file_name
perl -i -pe 's#\Q"do not delete the temporary output files\n"#"不要删除临时输出文件\\n"#g' $file_name
perl -i -pe 's#\Q"display this help text\n"#"显示此帮助文本\\n"#g' $file_name
perl -i -pe 's#\Q"key types: "#"密钥类型："#g' $file_name
perl -i -pe 's#\Q"UNABLE to test fingerprint matching against "#"无法针对 OpenSSH 测试指纹匹配\\n"#g' $file_name
perl -i -pe 's#\Q"OpenSSH\n"#""#g' $file_name
perl -i -pe 's#\Q"Cleaned up: %s\n"#"清理干净: %s\\n"#g' $file_name
perl -i -pe 's#\Q"%d passes, %d fails\n"#"%d 通过，%d 失败\\n"#g' $file_name
perl -i -pe 's#\Q"preloaded prompt unavailable in cgtest"#"预加载提示在 cgtest 中不可用"#g' $file_name
perl -i -pe 's#\Q"cgtest: unrecognised key type '\''%.*s'\''\n"#"cgtest: 无法识别的密钥类型 '\''%.*s'\''\\n"#g' $file_name
perl -i -pe 's#\Q"cgtest: unrecognised option '\''%.*s'\''\n"#"cgtest: 无法识别的选项 '\''%.*s'\''\\n"#g' $file_name
perl -i -pe 's#\Q"OpenSSH %s fp check: %s\n"#"OpenSSH %s fp 检查: %s\\n"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# cmdgen.c
file_name="cmdgen.c"
echo [01%]开始汉化 cmdgen.c
perl -i -pe 's#\Q"Usage: puttygen ( keyfile | -t type [ -b bits ] )\n"#"用法: puttygen ( 密钥文件 | -t 类型 [ -b 位数 ] )\\n"#g' $file_name
perl -i -pe 's#\Q"                [ -C comment ] [ -P ] [ -q ]\n"#"                [ -C 注释 ] [ -P ] [ -q ]\\n"#g' $file_name
perl -i -pe 's#\Q"                [ -o output-keyfile ] [ -O type | -l | -L"#"                [ -o 输出密钥文件 ] [ -O 类型 | -l | -L"#g' $file_name
perl -i -pe 's#\Q"Use \"puttygen --help\" for more detail.\n"#"使用 \\"puttygen --help\\" 了解更多帮助。\\n"#g' $file_name
perl -i -pe 's#\Q"PuTTYgen: key generator and converter for the PuTTY tools\n"#"PuTTYgen: PuTTY 密钥生成与转换工具\\n"#g' $file_name
perl -i -pe 's#\Q"  -t    specify key type when generating (ed25519, ecdsa, rsa, "#"  -t    指定生成的密钥类型 (ed25519, ecdsa, rsa, "#g' $file_name
perl -i -pe 's#\Q"  -b    specify number of bits when generating key\n"#"  -b    指定生成密钥的位数\\n"#g' $file_name
perl -i -pe 's#\Q"  -C    change or specify key comment\n"#"  -C    修改或指定密钥注释\\n"#g' $file_name
perl -i -pe 's#\Q"  -P    change key passphrase\n"#"  -P    修改密钥密码\\n"#g' $file_name
perl -i -pe 's#\Q"  -q    quiet: do not display progress bar\n"#"  -q    静默: 不显示进度条\\n"#g' $file_name
perl -i -pe 's#\Q"  -O    specify output type:\n"#"  -O    指定输出类型:\\n"#g' $file_name
perl -i -pe 's#\Q"           private             output PuTTY private key format\n"#"           private             输出 PuTTY 私钥格式\\n"#g' $file_name
perl -i -pe 's#\Q"           private-openssh     export OpenSSH private key\n"#"           private-openssh     导出 OpenSSH 私钥格式\\n"#g' $file_name
perl -i -pe 's#\Q"           private-openssh-new export OpenSSH private key "#"           private-openssh-new 导出 OpenSSH 私钥格式 "#g' $file_name
perl -i -pe 's#\Q"(force new format)\n"#"(强制新格式)\\n"#g' $file_name
perl -i -pe 's#\Q"           private-sshcom      export ssh.com private key\n"#"           private-sshcom      导出 ssh.com 私钥格式\\n"#g' $file_name
perl -i -pe 's#\Q"           public              RFC 4716 / ssh.com public key\n"#"           public              RFC 4716 / ssh.com 公钥\\n"#g' $file_name
perl -i -pe 's#\Q"           public-openssh      OpenSSH public key\n"#"           public-openssh      OpenSSH 公钥\\n"#g' $file_name
perl -i -pe 's#\Q"           fingerprint         output the key fingerprint\n"#"           fingerprint         输出密钥指纹\\n"#g' $file_name
perl -i -pe 's#\Q"  -o    specify output file\n"#"  -o    指定输出文件\\n"#g' $file_name
perl -i -pe 's#\Q"  -l    equivalent to `-O fingerprint'\''\n"#"  -l    等价于 `-O fingerprint'\''\\n"#g' $file_name
perl -i -pe 's#\Q"  -L    equivalent to `-O public-openssh'\''\n"#"  -L    等价于 `-O public-openssh'\''\\n"#g' $file_name
perl -i -pe 's#\Q"  -p    equivalent to `-O public'\''\n"#"  -p    等价于 `-O public'\''\\n"#g' $file_name
perl -i -pe 's#\Q"  --old-passphrase file\n"#"  --old-passphrase 文件\\n"#g' $file_name
perl -i -pe 's#\Q"        specify file containing old key passphrase\n"#"        指定包含旧密钥密码的文件\\n"#g' $file_name
perl -i -pe 's#\Q"  --new-passphrase file\n"#"  --new-passphrase 文件\\n"#g' $file_name
perl -i -pe 's#\Q"        specify file containing new key passphrase\n"#"        指定包含新密钥密码的文件\\n"#g' $file_name
perl -i -pe 's#\Q"  --random-device device\n"#"  --random-device 设备\\n"#g' $file_name
perl -i -pe 's#\Q"        specify device to read entropy from (e.g. /dev/urandom)\n"#"        指定用于读取熵的设备 (例如：/dev/urandom)\\n"#g' $file_name
perl -i -pe 's#\Q"  -t    specify key type when generating:\n"#"  -t    生成时指定密钥类型：\\n"#g' $file_name
perl -i -pe 's#\Q"           eddsa, ecdsa, rsa, dsa, rsa1   use with -b\n"#"           eddsa, ecdsa, rsa, dsa, rsa1   与-b一起使用\\n"#g' $file_name
perl -i -pe 's#\Q"           ed25519, ed448                 special cases of eddsa\n"#"           ed25519, ed448                 eddsa的特殊情况\\n"#g' $file_name
perl -i -pe 's#\Q"           text                output the key components as "#"           text                将密钥组件输出为 "#g' $file_name
perl -i -pe 's#\Q"  --dump   equivalent to `-O text'\''\n"#"  --dump   等价于 `-O text'\''\\n"#g' $file_name
perl -i -pe 's#\Q"  --reencrypt          load a key and save it with fresh "#"  --reencrypt          加载密钥并将其保存为最新 "#g' $file_name
perl -i -pe 's#\Q"  --primes <type>      select prime-generation method:\n"#"  --primes <类型>      选择素数生成方法:\\n"#g' $file_name
perl -i -pe 's#\Q"        probable       conventional probabilistic prime finding\n"#"        probable       常规概率素数发现\\n"#g' $file_name
perl -i -pe 's#\Q"        proven         numbers that have been proven to be prime\n"#"        proven         已被证明是质数的数\\n"#g' $file_name
perl -i -pe 's#\Q"        proven-even    also try harder for an even distribution\n"#"        proven-even    尽可能的均匀分布\\n"#g' $file_name
perl -i -pe 's#\Q"  --strong-rsa         use \"strong\" primes as RSA key factors\n"#"  --strong-rsa         使用“强”素数作为 RSA 关键因子\\n"#g' $file_name
perl -i -pe 's#\Q"        specify parameters when writing PuTTY private key file "#"        写入 PuTTY 私钥文件时指定参数 "#g' $file_name
perl -i -pe 's#\Q"format:\n"#"格式：\\n"#g' $file_name
perl -i -pe 's#\Q"            version       PPK format version (min 2, max 3, "#"            version       PPK格式版本 (min 2, max 3, 默认 3)\\n"#g' $file_name
perl -i -pe 's#\Q"default 3)\n"#""#g' $file_name
perl -i -pe 's#\Q"            kdf           key derivation function (argon2id, "#"            kdf           密钥派生函数（argon2id、argon2i、argon2d）\\n"#g' $file_name
perl -i -pe 's#\Q"argon2i, argon2d)\n"#""#g' $file_name
perl -i -pe 's#\Q"            memory        Kbyte of memory to use in passphrase "#"            memory        用于密码哈希的千字节内存\\n"#g' $file_name
perl -i -pe 's#\Q"hash\n"#""#g' $file_name
perl -i -pe 's#\Q"            time          approx milliseconds to hash for "#"            time          散列大约毫秒（默认 100）\\n"#g' $file_name
perl -i -pe 's#\Q"(default 100)\n"#""#g' $file_name
perl -i -pe 's#\Q"            passes        number of hash passes to run "#"            passes        要运行的哈希传递数（替代“time”）\\n"#g' $file_name
perl -i -pe 's#\Q"(alternative to '\''time'\'')\n"#""#g' $file_name
perl -i -pe 's#\Q"            parallelism   number of parallelisable threads in the "#"            parallelism   哈希函数中的可并行线程数\\n"#g' $file_name
perl -i -pe 's#\Q"hash function\n"#""#g' $file_name
perl -i -pe 's#\Q"                             (default 1)\n"#"                             (默认 1)\\n"#g' $file_name
perl -i -pe 's#\Q"puttygen: cannot move new file on to old one"#"puttygen: 无法将新文件移至旧文件"#g' $file_name
perl -i -pe 's#\Q"puttygen: cannot open %s: %s\n"#"puttygen: 无法打开 %s: %s\\n"#g' $file_name
perl -i -pe 's#\Q"puttygen: error reading from %s: %s\n"#"puttygen: 读取错误 %s: %s\\n"#g' $file_name
perl -i -pe 's#\Q"puttygen: option `-%s'\''"#"puttygen: 选项 `-%s'\''"#g' $file_name
perl -i -pe 's#\Q" expects no argument\n"#"不需要参数\\n"#g' $file_name
perl -i -pe 's#\Q" expects an argument\n"#"需要一个参数\\n"#g' $file_name
perl -i -pe 's#\Q"puttygen: PPK parameter "#"puttygen：PPK参数"#g' $file_name
perl -i -pe 's#\Q"'\''%s'\'' expected a value\n"#"'\''%s'\'' 需要一个值\\n"#g' $file_name
perl -i -pe 's#\Q"puttygen: unrecognise"#"puttygen：无法识别"#g' $file_name
perl -i -pe 's#\Q"puttygen: value '\''%s'\'' for "#"puttygen: PPK 参数“%s”的值“%s”: 需要一个数字\\n"#g' $file_name
perl -i -pe 's#\Q"PPK parameter '\''%s'\'': expected a "#""#g' $file_name
perl -i -pe 's#\Q"number\n"#""#g' $file_name
perl -i -pe 's#\Q"puttygen: unrecognised "#"puttygen: 无法识别的 PPK 参数“%s”\\n"#g' $file_name
perl -i -pe 's#\Q"PPK parameter '\''%s'\''\n"#""#g' $file_name
perl -i -pe 's#\Q"puttygen: no such option `-%s'\''\n"#"puttygen: 没有这样的选项 `-%s'\''\\n"#g' $file_name
perl -i -pe 's#\Q"puttygen: option `-%c'\'' expects a"#"puttygen: 选项 `-%c'\'' 需要一个参数\\n"#g' $file_name
perl -i -pe 's#\Q" parameter\n"#""#g' $file_name
perl -i -pe 's#\Q"puttygen: unknown key type `%s'\''\n"#"puttygen: 未知键类型“%s”\\n"#g' $file_name
perl -i -pe 's#\Q"puttygen: unknown output type `%s'\''\n"#"puttygen: 未知输出类型“%s”\\n"#g' $file_name
perl -i -pe 's#\Q"puttygen: unknown fingerprint "#"puttygen: 未知指纹类型“%s”\\n"#g' $file_name
perl -i -pe 's#\Q"type `%s'\''\n"#""#g' $file_name
perl -i -pe 's#\Q"puttygen: no such option `-%c'\''\n"#"puttygen: 没有这样的选项 `-%c'\''\\n"#g' $file_name
perl -i -pe 's#\Q"puttygen: cannot handle more than one"#"puttygen: 不能处理多个输入文件\\n"#g' $file_name
perl -i -pe 's#\Q" input file\n"#""#g' $file_name
perl -i -pe 's#\Q"puttygen: invalid bits for %s, choose"#"puttygen: %s 的无效位，选择"#g' $file_name
perl -i -pe 's#\Q"puttygen: cannot generate %s keys shorter than"#"puttygen: 无法生成短于 256 位的%s密钥\\n"#g' $file_name
perl -i -pe 's#\Q" 256 bits\n"#""#g' $file_name
perl -i -pe 's#\Q"puttygen: warning: %s keys shorter than"#"puttygen: 警告：短于 %d 位的 %s 密钥可能不安全\\n"#g' $file_name
perl -i -pe 's#\Q" %d bits are probably not secure\n"#""#g' $file_name
perl -i -pe 's#\Q"puttygen: cannot both load and generate a key\n"#"puttygen: 不能同时加载和生成密钥\\n"#g' $file_name
perl -i -pe 's#\Q"puttygen: this would generate a new key but "#"puttygen: 这将生成一个新密钥但丢弃私有部分\\n"#g' $file_name
perl -i -pe 's#\Q"discard the private part\n"#""#g' $file_name
perl -i -pe 's#\Q"puttygen: unable to load file `%s'\'': %s\n"#"puttygen: 无法加载文件“%s”: %s\\n"#g' $file_name
perl -i -pe 's#\Q"puttygen: conversion from SSH-1 to SSH-2 keys"#"puttygen: 不支持从 SSH-1 到 SSH-2 密钥的转换\\n"#g' $file_name
perl -i -pe 's#\Q" not supported\n"#""#g' $file_name
perl -i -pe 's#\Q"puttygen: conversion from SSH-2 to SSH-1 keys"#"puttygen: 不支持从 SSH-2 到 SSH-1 密钥的转换\\n"#g' $file_name
perl -i -pe 's#\Q" not supported\n"#""#g' $file_name
perl -i -pe 's#\Q"Should never see these types on an input file"#"永远不应该在输入文件中看到这些类型"#g' $file_name
perl -i -pe 's#\Q"puttygen: this command would perform no useful"#"puttygen: 此命令不会执行任何有用的操作\\n"#g' $file_name
perl -i -pe 's#\Q" action\n"#""#g' $file_name
perl -i -pe 's#\Q"puttygen: need to specify an output file\n"#"puttygen: 需要指定输出文件\\n"#g' $file_name
perl -i -pe 's#\Q"puttygen: cannot perform this action on a "#"puttygen: 无法对仅公钥输入文件执行此操作\\n"#g' $file_name
perl -i -pe 's#\Q"public-key-only input file\n"#""#g' $file_name
perl -i -pe 's#\Q"puttygen: failed to collect entropy, "#"puttygen: 无法收集熵，无法生成密钥\\n"#g' $file_name
perl -i -pe 's#\Q"could not generate key\n"#""#g' $file_name
perl -i -pe 's#\Q"SSH key passphrase"#"SSH 密钥密码"#g' $file_name
perl -i -pe 's#\Q"Enter passphrase to load key: "#"输入密码以加载密钥： "#g' $file_name
perl -i -pe 's#\Q"puttygen: unable to read passphrase: %s"#"puttygen：无法读取密码: %s"#g' $file_name
perl -i -pe 's#\Q"unknown error"#"未知错误"#g' $file_name
perl -i -pe 's#\Q"wrong passphrase"#"密码错误"#g' $file_name
perl -i -pe 's#\Q"bad input key type"#"输入密钥类型错误"#g' $file_name
perl -i -pe 's#\Q"puttygen: error loading `%s'\'': %s\n"#"puttygen: 加载“%s”时出错: %s\\n"#g' $file_name
perl -i -pe 's#\Q"New SSH key passphrase"#"新的 SSH 密钥密码"#g' $file_name
perl -i -pe 's#\Q"Enter passphrase to save key: "#"输入密码以保存密钥: "#g' $file_name
perl -i -pe 's#\Q"Re-enter passphrase to verify: "#"重新输入密码以验证: "#g' $file_name
perl -i -pe 's#\Q"puttygen: unable to read new passphrase"#"puttygen: 无法读取新密码"#g' $file_name
perl -i -pe 's#\Q"puttygen: passphrases do not match\n"#"puttygen: 密码不匹配\\n"#g' $file_name
perl -i -pe 's#\Q"puttygen: unable to save SSH-1 private key\n"#"puttygen: 无法保存 SSH-1 私钥\\n"#g' $file_name
perl -i -pe 's#\Q"puttygen: unable to save SSH-2 private key\n"#"puttygen: 无法保存 SSH-2 私钥\\n"#g' $file_name
perl -i -pe 's#\Q"unable to open output file\n"#"无法打开输出文件\\n"#g' $file_name
perl -i -pe 's#\Q"control flow goof"#"控制流错误"#g' $file_name
perl -i -pe 's#\Q"puttygen: unable to export key\n"#"puttygen：无法导出密钥\\n"#g' $file_name
perl -i -pe 's#\Q"puttygen: unable to decode public key\n"#"puttygen: 无法解码公钥\\n"#g' $file_name
perl -i -pe 's#\Q"puttygen: cannot extract key components "#"puttygen: 无法从未知类型的公钥中提取关键组件 '\''%.*s'\''\\n"#g' $file_name
perl -i -pe 's#\Q"from public key of unknown type '\''%.*s'\''\n"#""#g' $file_name
perl -i -pe 's#\Q"generation mode `%s'\''\n"#""#g' $file_name
perl -i -pe 's#\Q"puttygen: unrecognised prime-"#"puttygen：无法识别的素数生成模式 `%s'\''"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# cmdline.c
file_name="cmdline.c"
echo [02%]开始汉化 cmdline.c
perl -i -pe 's#\Q"option \"%s\" not available in this tool"#"此工具中没有选项“%s”"#g' $file_name
perl -i -pe 's#\Q"unrecognised protocol prefix '\''%s'\''"#"无法识别的协议前缀“%s”"#g' $file_name
perl -i -pe 's#\Q"'\''%s'\'' is not a valid format for a manual host "#"“%s”不是手动主机密钥规范的有效格式"#g' $file_name
perl -i -pe 's#\Q"key specification"#""#g' $file_name
perl -i -pe 's#\Q"-%c expects at least two colons in its"#"-%c 要求其参数中至少有两个冒号"#g' $file_name
perl -i -pe 's#\Q" argument"#""#g' $file_name
perl -i -pe 's#\Q"-nc expects argument of form '\''host:port'\''"#"-nc 期望形式为“主机：端口”的参数"#g' $file_name
perl -i -pe 's#\Q"unable to open command file \"%s\""#"无法打开命令文件 \\"%s\\""#g' $file_name
perl -i -pe 's#\Q"the -pw option can only be used with the "#"-pw 选项只能与 SSH 协议一起使用"#g' $file_name
perl -i -pe 's#\Q"the -pwfile option can only be used with the "#"-pwfile 选项只能与 SSH 协议一起使用"#g' $file_name
perl -i -pe 's#\Q"SSH protocol"#""#g' $file_name
perl -i -pe 's#\Q"the -sercfg option can only be used with the "#"-sercfg 选项只能与串行协议一起使用"#g' $file_name
perl -i -pe 's#\Q"serial protocol"#""#g' $file_name
perl -i -pe 's#\Q"Unrecognised suboption \"-sercfg %c\""#"无法识别的子选项 \\"-sercfg %c\\""#g' $file_name
perl -i -pe 's#\Q"Unrecognised suboption \"-sercfg %s\""#"无法识别的子选项 \\"-sercfg %s\\""#g' $file_name
perl -i -pe 's#\Q"Configured password was not accepted"#"不接受配置的密码"#g' $file_name
perl -i -pe 's#\Q"unable to read a password from file '\''%s'\''"#"无法从文件中读取密码 '\''%s'\''"#g' $file_name
perl -i -pe 's#\Q"unable to open password file '\''%s'\''"#"无法打开密码文件'\''%s'\''"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# config.c
file_name="config.c"
echo [03%]开始汉化 config.c
perl -i -pe 's#\Q"None (printing disabled)"#"无 (禁止打印)"#g' $file_name
perl -i -pe 's#\Q"Host Name (or IP address)"#"主机名称(或 IP 地址)(N)"#g' $file_name
perl -i -pe 's#\Q"Port"#"端口(P)"#g' $file_name
perl -i -pe 's#\Q"Serial line"#"串行口(N)"#g' $file_name
perl -i -pe 's#\Q"Speed"#"速度(P)"#g' $file_name
perl -i -pe 's#\Q"ChaCha20 (SSH-2 only)"#"ChaCha20 (只限 SSH-2)"#g' $file_name
perl -i -pe 's#\Q"AES (SSH-2 only)"#"AES (只限 SSH-2)"#g' $file_name
perl -i -pe 's#\Q"Arcfour (SSH-2 only)"#"Arcfour (只限 SSH-2)"#g' $file_name
perl -i -pe 's#\Q"-- warn below here --"#"-- 下面为警告选项 --"#g' $file_name
perl -i -pe 's#\Q"Auto"#"自动"#g' $file_name
perl -i -pe 's#\Q"Off"#"关"#g' $file_name
perl -i -pe 's#\Q"On"#"开"#g' $file_name
perl -i -pe 's#\Q"(auto)"#"(自动)"#g' $file_name
perl -i -pe 's#\Q"(don'\''t send)"#"(不发送)"#g' $file_name
perl -i -pe 's#\Q"You need to specify a source port number"#"需要指定一个来源端口数字"#g' $file_name
perl -i -pe 's#\Q"You need to specify a destination address\n"#"需要在表单指定一个目标地址\\n"#g' $file_name
perl -i -pe 's#\Q"in the form \"host.name:port\""#"如 \\"host.name:port\\""#g' $file_name
perl -i -pe 's#\Q"Specified forwarding already exists"#"指定的转向已经存在"#g' $file_name
perl -i -pe 's#\Q"You need to specify a host key or "#"需要指定一个主机密钥或"#g' $file_name
perl -i -pe 's#\Q"fingerprint"#"指纹"#g' $file_name
perl -i -pe 's#\Q"Host key is not in a valid format"#"主机密钥不是一个有效的格式"#g' $file_name
perl -i -pe 's#\Q"Specified host key is already listed"#"指定的主机密钥已存在"#g' $file_name
perl -i -pe 's#\Q"No action"#"无动作"#g' $file_name
perl -i -pe 's#\Q"Apply"#"应用(A)"#g' $file_name
perl -i -pe 's#\Q"Open"#"打开(O)"#g' $file_name
perl -i -pe 's#\Q"Cancel"#"取消(C)"#g' $file_name
perl -i -pe 's#\Q"Basic options for your %s session"#"%s 会话基本设置"#g' $file_name
perl -i -pe 's#\Q"Session"#"会话"#g' $file_name
perl -i -pe 's#\Q"Specify the destination you want to connect to"#"指定要连接的目的地址"#g' $file_name
perl -i -pe 's#\Q"Connection type:"#"连接类型："#g' $file_name
perl -i -pe 's#\Q"Save the current session settings"#"保存当前会话设置"#g' $file_name
perl -i -pe 's#\Q"Load, save or delete a stored session"#"载入、保存或删除已存在的会话"#g' $file_name
perl -i -pe 's#\Q"Saved Sessions"#"保存的会话(E)"#g' $file_name
perl -i -pe 's#\Q"Load", '\''l'\''#"载入(L)", '\''l'\''#g' $file_name
perl -i -pe 's#\Q"Save", '\''v'\''#"保存(V)", '\''v'\''#g' $file_name
perl -i -pe 's#\Q"Delete", '\''d'\''#"删除(D)", '\''d'\''#g' $file_name
perl -i -pe 's#\Q"Close window on exit:"#"退出时关闭窗口(X)："#g' $file_name
perl -i -pe 's#\Q"Always"#"总是"#g' $file_name
perl -i -pe 's#\Q"Never"#"从不"#g' $file_name
perl -i -pe 's#\Q"Only on clean exit"#"仅正常退出"#g' $file_name
perl -i -pe 's#\Q"Session/Logging"#"会话/日志记录"#g' $file_name
perl -i -pe 's#\Q"Options controlling session logging"#"会话日志记录选项"#g' $file_name
perl -i -pe 's#\Q"SSH packets"#"SSH 包"#g' $file_name
perl -i -pe 's#\Q"SSH packets and raw data"#"SSH 包和 RAW 数据"#g' $file_name
perl -i -pe 's#\Q"Session logging:"#"会话日志记录："#g' $file_name
perl -i -pe 's#\Q"None", '\''t'\''#"无(T)", '\''t'\''#g' $file_name
perl -i -pe 's#\Q"Printable output"#"可打印输出(P)"#g' $file_name
perl -i -pe 's#\Q"All session output"#"所有会话输出(L)"#g' $file_name
perl -i -pe 's#\Q"Log file name:"#"日志文件名(F)："#g' $file_name
perl -i -pe 's#\Q"Select session log file name"#"选择会话的日志文件名"#g' $file_name
perl -i -pe 's#\Q"(Log file name can contain &Y, &M, &D for date,"#"(日志文件名可以包含 &Y &M &D 表示年月日，"#g' $file_name
perl -i -pe 's#\Q" &T for time, &H for host name, and &P for port number)"#"&T 表示时间，&H 表示主机名称)"#g' $file_name
perl -i -pe 's#\Q"What to do if the log file already exists:"#"要记录的日志文件已存在时(E)："#g' $file_name
perl -i -pe 's#\Q"Always overwrite it"#"总是覆盖"#g' $file_name
perl -i -pe 's#\Q"Always append to the end of it"#"总是添加到末尾"#g' $file_name
perl -i -pe 's#\Q"Ask the user every time"#"每次询问"#g' $file_name
perl -i -pe 's#\Q"Flush log file frequently"#"快速刷新缓存到日志文件(U)"#g' $file_name
perl -i -pe 's#\Q"Include header"#"包含header"#g' $file_name
perl -i -pe 's#\Q"Session/Logging"#"会话/日志记录"#g' $file_name
perl -i -pe 's#\Q"Options specific to SSH packet logging"#"指定 SSH 包日志记录设置"#g' $file_name
perl -i -pe 's#\Q"Omit known password fields"#"忽略已知的密码域(K)"#g' $file_name
perl -i -pe 's#\Q"Omit session data"#"忽略会话数据(D)"#g' $file_name
perl -i -pe 's#\Q"Options controlling the terminal emulation"#"终端模拟设置"#g' $file_name
perl -i -pe 's#\Q"Set various terminal options"#"设置不同的终端选项"#g' $file_name
perl -i -pe 's#\Q"Auto wrap mode initially on"#"初始开启自动换行(W)"#g' $file_name
perl -i -pe 's#\Q"DEC Origin Mode initially on"#"初始开启 DEC 原始模式"#g' $file_name
perl -i -pe 's#\Q"Implicit CR in every LF"#"在每个 LF 字符后增加 CR 字符"#g' $file_name
perl -i -pe 's#\Q"Implicit LF in every CR"#"在每个 CR 字符后增加 LF 字符"#g' $file_name
perl -i -pe 's#\Q"Use background colour to erase screen"#"使用背景颜色清除屏幕(E)"#g' $file_name
perl -i -pe 's#\Q"Enable blinking text"#"开启闪烁字文本(N)"#g' $file_name
perl -i -pe 's#\Q"Answerback to ^E:"#"^E 回应(S)："#g' $file_name
perl -i -pe 's#\Q"Line discipline options"#"行规则选项"#g' $file_name
perl -i -pe 's#\Q"Local echo:"#"本地回应(L)："#g' $file_name
perl -i -pe 's#\Q"Auto", I(AUTO)#"自动", I(AUTO)#g' $file_name
perl -i -pe 's#\Q"Force on"#"强制开"#g' $file_name
perl -i -pe 's#\Q"Force off"#"强制关"#g' $file_name
perl -i -pe 's#\Q"Local line editing:"#"本地行编辑(T)："#g' $file_name
perl -i -pe 's#\Q"Remote-controlled printing"#"远程控制打印"#g' $file_name
perl -i -pe 's#\Q"Printer to send ANSI printer output to:"#"打印发送 ANSI 打印机输出到(P)："#g' $file_name
perl -i -pe 's#\Q"Options controlling the effects of keys"#"按键效果设置"#g' $file_name
perl -i -pe 's#\Q"Change the sequences sent by:"#"修改按键码发送序列："#g' $file_name
perl -i -pe 's#\Q"The Backspace key"#"Backspace 回退键"#g' $file_name
perl -i -pe 's#\Q"The Home and End keys"#"Home 和 End 键"#g' $file_name
perl -i -pe 's#\Q"Standard"#"标准"#g' $file_name
perl -i -pe 's#\Q"The Function keys and keypad"#"Fn 功能键和小键盘"#g' $file_name
perl -i -pe 's#\Q"Application keypad settings:"#"应用小键盘设置："#g' $file_name
perl -i -pe 's#\Q"Initial state of cursor keys:"#"光标键初始状态(R)："#g' $file_name
perl -i -pe 's#\Q"Normal", I(0)#"常规", I(0)#g' $file_name
perl -i -pe 's#\Q"Application"#"应用"#g' $file_name
perl -i -pe 's#\Q"Initial state of numeric keypad:"#"数字小键盘初始状态(N)："#g' $file_name
perl -i -pe 's#\Q"Options controlling the terminal bell"#"终端响铃设置"#g' $file_name
perl -i -pe 's#\Q"Set the style of bell"#"设置响铃类型"#g' $file_name
perl -i -pe 's#\Q"Action to happen when a bell occurs:"#"发生响铃时动作(B)："#g' $file_name
perl -i -pe 's#\Q"None (bell disabled)"#"无 (禁止响铃)"#g' $file_name
perl -i -pe 's#\Q"Make default system alert sound"#"使用系统默认警告声音"#g' $file_name
perl -i -pe 's#\Q"Visual bell (flash window)"#"可视响铃 (闪动窗口)"#g' $file_name
perl -i -pe 's#\Q"Control the bell overload behaviour"#"设置重复响铃处理"#g' $file_name
perl -i -pe 's#\Q"Bell is temporarily disabled when over-used"#"大量重复响铃时临时禁止响铃(D)"#g' $file_name
perl -i -pe 's#\Q"Over-use means this many bells..."#"重复响铃最少数目(M)："#g' $file_name
perl -i -pe 's#\Q"... in this many seconds"#"重复响铃计算时间(秒)(T)："#g' $file_name
perl -i -pe 's#\Q"The bell is re-enabled after a few seconds of silence."#"响铃将在被禁止一段时间后重新被允许。"#g' $file_name
perl -i -pe 's#\Q"Seconds of silence required"#"被禁止响铃的时间(秒)(S)："#g' $file_name
perl -i -pe 's#\Q"Enabling and disabling advanced terminal features"#"允许或禁止高级终端特性"#g' $file_name
perl -i -pe 's#\Q"Disable application cursor keys mode"#"禁止应用光标键模式(U)"#g' $file_name
perl -i -pe 's#\Q"Disable application keypad mode"#"禁止应用小键盘模式(K)"#g' $file_name
perl -i -pe 's#\Q"Disable xterm-style mouse reporting"#"禁止 xterm 类型鼠标报告"#g' $file_name
perl -i -pe 's#\Q"Disable remote-controlled terminal resizing"#"禁止改变远程控制终端大小(S)"#g' $file_name
perl -i -pe 's#\Q"Disable switching to alternate terminal screen"#"禁止切换终端屏幕(W)"#g' $file_name
perl -i -pe 's#\Q"Disable remote-controlled window title changing"#"禁止改变远程控制窗口标题(T)"#g' $file_name
perl -i -pe 's#\Q"Disable remote-controlled clearing of scrollback"#"禁止远程控制清除回滚(E)"#g' $file_name
perl -i -pe 's#\Q"Response to remote title query (SECURITY):"#"远程标题查询回应(SECURITY)(Q)："#g' $file_name
perl -i -pe 's#\Q"None"#"无"#g' $file_name
perl -i -pe 's#\Q"Empty string"#"空字符串"#g' $file_name
perl -i -pe 's#\Q"Window title"#"窗口标题"#g' $file_name
perl -i -pe 's#\Q"Disable destructive backspace on server sending ^?"#"禁止服务器发送 ^? 时破坏性回退删除(B)"#g' $file_name
perl -i -pe 's#\Q"Disable remote-controlled character set configuration"#"禁止远程控制字符集设置(R)"#g' $file_name
perl -i -pe 's#\Q"Disable Arabic text shaping"#"禁止修整阿拉伯文本(L)"#g' $file_name
perl -i -pe 's#\Q"Disable bidirectional text display"#"禁止双向文本显示(D)"#g' $file_name
perl -i -pe 's#\Q"Options controlling %s'\''s window"#"%s 窗口设置"#g' $file_name
perl -i -pe 's#\Q"Set the size of the window"#"设置窗口大小"#g' $file_name
perl -i -pe 's#\Q"Columns"#"列(M)"#g' $file_name
perl -i -pe 's#\Q"Rows"#"行(R)"#g' $file_name
perl -i -pe 's#\Q"Control the scrollback in the window"#"设置窗口回滚"#g' $file_name
perl -i -pe 's#\Q"Lines of scrollback"#"回滚行数(S)"#g' $file_name
perl -i -pe 's#\Q"Display scrollbar"#"显示滚动条(D)"#g' $file_name
perl -i -pe 's#\Q"Reset scrollback on keypress"#"按键时重置回滚(K)"#g' $file_name
perl -i -pe 's#\Q"Reset scrollback on display activity"#"刷新显示时重置回滚(P)"#g' $file_name
perl -i -pe 's#\Q"Push erased text into scrollback"#"将清除的文本压入回滚(E)"#g' $file_name
perl -i -pe 's#\Q"Configure the appearance of %s'\''s window"#"配置 %s 窗口外观"#g' $file_name
perl -i -pe 's#\Q"Adjust the use of the cursor"#"调整光标"#g' $file_name
perl -i -pe 's#\Q"Cursor appearance:"#"光标显示："#g' $file_name
perl -i -pe 's#\Q"Block"#"显示块(L)"#g' $file_name
perl -i -pe 's#\Q"Underline"#"下划线(U)"#g' $file_name
perl -i -pe 's#\Q"Vertical line"#"垂直线(V)"#g' $file_name
perl -i -pe 's#\Q"Cursor blinks"#"光标闪烁(B)"#g' $file_name
perl -i -pe 's#\Q"Font settings"#"字体设置"#g' $file_name
perl -i -pe 's#\Q"Font used in the terminal window"#"终端窗口使用的字体(N)"#g' $file_name
perl -i -pe 's#\Q"Adjust the use of the mouse pointer"#"调整鼠标指针"#g' $file_name
perl -i -pe 's#\Q"Hide mouse pointer when typing in window"#"在窗口中输入时隐藏鼠标指针(P)"#g' $file_name
perl -i -pe 's#\Q"Adjust the window border"#"调整窗口边框"#g' $file_name
perl -i -pe 's#\Q"Gap between text and window edge:"#"文本与窗口边界的距离(E)："#g' $file_name
perl -i -pe 's#\Q"Configure the behaviour of %s'\''s window"#"配置 %s 窗口行为"#g' $file_name
perl -i -pe 's#\Q"Adjust the behaviour of the window title"#"调整窗口标题外观"#g' $file_name
perl -i -pe 's#\Q"Window title:"#"窗口标题(T)："#g' $file_name
perl -i -pe 's#\Q"Separate window and icon titles"#"使用单独的客户区窗口(I)"#g' $file_name
perl -i -pe 's#\Q"Warn before closing window"#"关闭窗口时警告(W)"#g' $file_name
perl -i -pe 's#\Q"Options controlling character set translation"#"字符集转换设置"#g' $file_name
perl -i -pe 's#\Q"Character set translation"#"字符集转换"#g' $file_name
perl -i -pe 's#\Q"Remote character set:"#"远程字符集(R)："#g' $file_name
perl -i -pe 's#\Q"Treat CJK ambiguous characters as wide"#"将不确定字符处理为 CJK 字符(W)"#g' $file_name
perl -i -pe 's#\Q"Adjust how %s handles line drawing characters"#"调整 %s 如何重画字符行"#g' $file_name
perl -i -pe 's#\Q"Handling of line drawing characters:"#"重画字符行处理："#g' $file_name
perl -i -pe 's#\Q"Use Unicode line drawing code points"#"使用 Unicode 统一码重画代码"#g' $file_name
perl -i -pe 's#\Q"Poor man'\''s line drawing (+, - and |)"#"简单重画行(+、- 和 |)(P)"#g' $file_name
perl -i -pe 's#\Q"Copy and paste line drawing characters as lqqqk"#"重画字符类似 lqqqk 复制粘贴行(D)"#g' $file_name
perl -i -pe 's#\Q"Enable VT100 line drawing even in UTF-8 mode"#"即使在UTF-8模式下也启用VT100线条图"#g' $file_name
perl -i -pe 's#\Q"Options controlling copy and paste"#"复制粘贴设置"#g' $file_name
perl -i -pe 's#\Q"Control use of mouse"#"鼠标使用控制"#g' $file_name
perl -i -pe 's#\Q"Shift overrides application'\''s use of mouse"#"Shift 上档键可与鼠标组合使用(P)"#g' $file_name
perl -i -pe 's#\Q"Default selection mode (Alt+drag does the other one):"#"默认选择模式(Alt 换档键拖放为另一种模式)："#g' $file_name
perl -i -pe 's#\Q"Normal", '\''n'\''#"常规(N)", '\''n'\''#g' $file_name
perl -i -pe 's#\Q"Rectangular block"#"矩形框(R)"#g' $file_name
perl -i -pe 's#\Q"Assign copy/paste actions to clipboards"#"指定复制/粘贴到剪贴板的操作"#g' $file_name
perl -i -pe 's#\Q"Auto-copy selected text to "#"将所选文本自动复制到 "#g' $file_name
perl -i -pe 's#\Q"Mouse paste action:"#"鼠标粘贴动作:"#g' $file_name
perl -i -pe 's#\Q"Control pasting of text from clipboard to terminal"#"控制文本从剪贴板粘贴到终端"#g' $file_name
perl -i -pe 's#\Q"Permit control characters in pasted text"#"允许粘贴文本中的控制字符"#g' $file_name
perl -i -pe 's#\Q"Classes of character that group together"#"组合在一起的字符类别"#g' $file_name
perl -i -pe 's#\Q"Character classes:"#"字符类别(E)："#g' $file_name
perl -i -pe 's#\Q"Set to class"#"设置到类别(T)"#g' $file_name
perl -i -pe 's#\Q"Set"#"设置(S)"#g' $file_name
perl -i -pe 's#\Q"Options controlling copying from terminal to clipboard"#"控制从终端复制到剪贴板的选项"#g' $file_name
perl -i -pe 's#\Q"Classes of character that group together"#"Classes of character that group together"#g' $file_name
perl -i -pe 's#\Q"Options controlling use of colours"#"颜色使用设置"#g' $file_name
perl -i -pe 's#\Q"General options for colour usage"#"颜色使用常规设置"#g' $file_name
perl -i -pe 's#\Q"Allow terminal to specify ANSI colours"#"允许终端指定 ANSI 颜色"#g' $file_name
perl -i -pe 's#\Q"Allow terminal to use xterm 256-colour mode"#"允许终端使用 xterm 256 色模式"#g' $file_name
perl -i -pe 's#\Q"Allow terminal to use 24-bit colours"#"允许终端使用24位颜色"#g' $file_name
perl -i -pe 's#\Q"Indicate bolded text by changing:"#"粗体文字表现(B)："#g' $file_name
perl -i -pe 's#\Q"The font"#"字体"#g' $file_name
perl -i -pe 's#\Q"The colour"#"颜色"#g' $file_name
perl -i -pe 's#\Q"Both"#"两者"#g' $file_name
perl -i -pe 's#\Q"Adjust the precise colours %s displays"#"调整 %s 显示的精确颜色"#g' $file_name
perl -i -pe 's#\Q"Select a colour from the list, and then click the"#"选择列表中的颜色，然后点击"#g' $file_name
perl -i -pe 's#\Q" Modify button to change its appearance."#"\\"修改\\"按钮改变其具体数值。"#g' $file_name
perl -i -pe 's#\Q"Select a colour to adjust:"#"选择颜色进行修改(U)："#g' $file_name
perl -i -pe 's#\Q"RGB value:"#"RGB 值："#g' $file_name
perl -i -pe 's#\Q"Red"#"红(R)"#g' $file_name
perl -i -pe 's#\Q"Green"#"绿(N)"#g' $file_name
perl -i -pe 's#\Q"Blue"#"蓝(E)"#g' $file_name
perl -i -pe 's#\Q"Modify"#"修改(M)"#g' $file_name
perl -i -pe 's#\Q"Options controlling the connection"#"连接设置"#g' $file_name
perl -i -pe 's#\Q"Sending of null packets to keep session active"#"发送空数据包保持会话活动"#g' $file_name
perl -i -pe 's#\Q"Seconds between keepalives (0 to turn off)"#"空包发送时间间隔(秒，0 表示关闭)(K)："#g' $file_name
perl -i -pe 's#\Q"Low-level TCP connection options"#"底层 TCP 连接选项"#g' $file_name
perl -i -pe 's#\Q"Disable Nagle'\''s algorithm (TCP_NODELAY option)"#"禁止 Nagle 算法(TCP_NODELAY 参数)"#g' $file_name
perl -i -pe 's#\Q"Enable TCP keepalives (SO_KEEPALIVE option)"#"允许 TCP 保持活动连接(SO_KEEPALIVE 参数)"#g' $file_name
perl -i -pe 's#\Q"Internet protocol version"#"互联网协议版本"#g' $file_name
perl -i -pe 's#\Q"Logical name of remote host (e.g. for SSH key lookup):"#"远程主机的注册名字（比如用 ssh 密钥寻找）(M)："#g' $file_name
perl -i -pe 's#\Q"Logical name of remote host:"#"Logical 远程主机的注册名字(M)："#g' $file_name
perl -i -pe 's#\Q"Logical name of remote host"#"远程主机的注册名字"#g' $file_name
perl -i -pe 's#\Q"Data to send to the server"#"传送到服务器的数据"#g' $file_name
perl -i -pe 's#\Q"Login details"#"登录详细资料"#g' $file_name
perl -i -pe 's#\Q"Auto-login username"#"自动登录用户名(U)："#g' $file_name
perl -i -pe 's#\Q"Use system username (%s)"#"使用系统用户名 (%s)"#g' $file_name
perl -i -pe 's#\Q"When username is not specified:"#"未指定用户名时(N)："#g' $file_name
perl -i -pe 's#\Q"Prompt"#"提示"#g' $file_name
perl -i -pe 's#\Q"Terminal details"#"终端详细资料"#g' $file_name
perl -i -pe 's#\Q"Terminal-type string"#"终端类型字符串(T)："#g' $file_name
perl -i -pe 's#\Q"Terminal speeds"#"终端速度(S)："#g' $file_name
perl -i -pe 's#\Q"Environment variables"#"环境变量"#g' $file_name
perl -i -pe 's#\Q"Variable"#"变量(V)："#g' $file_name
perl -i -pe 's#\Q"Value"#"值(L)："#g' $file_name
perl -i -pe 's#\Q"Remove"#"删除(R)"#g' $file_name
perl -i -pe 's#\Q"Options controlling proxy usage"#"代理使用设置"#g' $file_name
perl -i -pe 's#\Q"Proxy type:"#"代理类型(T)："#g' $file_name
perl -i -pe 's#\Q"Proxy hostname"#"代理地址(Y)"#g' $file_name
perl -i -pe 's#\Q"Exclude Hosts/IPs"#"排除在外的地址(E)"#g' $file_name
perl -i -pe 's#\Q"Consider proxying local host connections"#"对于本地地址不使用代理(X)"#g' $file_name
perl -i -pe 's#\Q"Do DNS name lookup at proxy end:"#"在代理端进行 DNS 域名解析："#g' $file_name
perl -i -pe 's#\Q"No", I(FORCE_OFF)#"否", I(FORCE_OFF)#g' $file_name
perl -i -pe 's#\Q"Yes", I(FORCE_ON)#"是", I(FORCE_ON)#g' $file_name
perl -i -pe 's#\Q"Username"#"用户名(U)："#g' $file_name
perl -i -pe 's#\Q"Password"#"密码(W)："#g' $file_name
perl -i -pe 's#\Q"Telnet command"#"Telnet 命令(M)"#g' $file_name
perl -i -pe 's#\Q"Print proxy diagnostics "#"在终端窗口"#g' $file_name
perl -i -pe 's#\Q"in the terminal window"#"输出代理诊断信息(R)"#g' $file_name
perl -i -pe 's#\Q"Only until session starts"#"只在会话开始时"#g' $file_name
perl -i -pe 's#\Q"Options controlling Telnet connections"#"Telnet 连接设置"#g' $file_name
perl -i -pe 's#\Q"Telnet protocol adjustments"#"Telnet 协议调整"#g' $file_name
perl -i -pe 's#\Q"Handling of OLD_ENVIRON ambiguity:"#"处理含糊的 OLD_ENVIRON 参数："#g' $file_name
perl -i -pe 's#\Q"BSD (commonplace)"#"BSD (常用)"#g' $file_name
perl -i -pe 's#\Q"RFC 1408 (unusual)"#"RFC 1408 (不常用)"#g' $file_name
perl -i -pe 's#\Q"Telnet negotiation mode:"#"Telnet 通讯模式："#g' $file_name
perl -i -pe 's#\Q"Passive"#"被动"#g' $file_name
perl -i -pe 's#\Q"Active"#"主动"#g' $file_name
perl -i -pe 's#\Q"Keyboard sends Telnet special commands"#"键盘直接发送 Telnet 特殊命令(K)"#g' $file_name
perl -i -pe 's#\Q"Return key sends Telnet New Line instead of ^M"#"发送 Telnet 新行命令替换 ^M 字符"#g' $file_name
perl -i -pe 's#\Q"Options controlling Rlogin connections"#"Rlogin 连接设置"#g' $file_name
perl -i -pe 's#\Q"Local username:"#"本地用户名(L)："#g' $file_name
perl -i -pe 's#\Q"Options controlling SSH connections"#"SSH 连接设置"#g' $file_name
perl -i -pe 's#\Q"Remote command:"#"远程命令(R)："#g' $file_name
perl -i -pe 's#\Q"Protocol options"#"协议选项"#g' $file_name
perl -i -pe 's#\Q"Don'\''t start a shell or command at all"#"完全不运行 Shell 或命令(N)"#g' $file_name
perl -i -pe 's#\Q"Enable compression"#"开启压缩(E)"#g' $file_name
perl -i -pe 's#\Q"Sharing an SSH connection between PuTTY tools"#"在 PuTTY 工具之间共享 SSH 连接"#g' $file_name
perl -i -pe 's#\Q"Share SSH connections if possible"#"如果可能共享 SSH 连接"#g' $file_name
perl -i -pe 's#\Q"Permitted roles in a shared connection:"#"共享连接中允许角色："#g' $file_name
perl -i -pe 's#\Q"Upstream (connecting to the real server)"#"上游 (连接到真实服务器)(U)"#g' $file_name
perl -i -pe 's#\Q"Downstream (connecting to the upstream PuTTY)"#"下游 (连接到上游 PuTTY)(D)"#g' $file_name
perl -i -pe 's#\Q"SSH protocol version:"#"首选的 SSH 协议版本："#g' $file_name
perl -i -pe 's#\Q"1 (INSECURE)"#"1 (不安全)"#g' $file_name
perl -i -pe 's#\Q"Options controlling SSH key exchange"#"SSH 密钥验证设置"#g' $file_name
perl -i -pe 's#\Q"Key exchange algorithm options"#"密钥验证算法选项"#g' $file_name
perl -i -pe 's#\Q"Algorithm selection policy:"#"算法选择策略(S)："#g' $file_name
perl -i -pe 's#\Q"Prefer algorithms for which a host key is known"#"首选主机密钥已知的算法"#g' $file_name
perl -i -pe 's#\Q"Attempt GSSAPI key exchange"#"尝试使用 GSSAPI 密钥验证"#g' $file_name
perl -i -pe 's#\Q"Options controlling key re-exchange"#"密钥再次验证设置"#g' $file_name
perl -i -pe 's#\Q"Max minutes before rekey (0 for no limit)"#"重新验证最长时间(分钟，0 不限制)(T)："#g' $file_name
perl -i -pe 's#\Q"Minutes between GSS checks (0 for never)"#"GSS检查间隔时间(分钟，0 不限制)："#g' $file_name
perl -i -pe 's#\Q"Max data before rekey (0 for no limit)"#"重新验证最大数据量(0 为不限制)(X)："#g' $file_name
perl -i -pe 's#\Q"(Use 1M for 1 megabyte, 1G for 1 gigabyte etc)"#"(使用 1M 表示 1 兆字节，1G 表示 1 吉字节))"#g' $file_name
perl -i -pe 's#\Q"Options controlling SSH host keys"#"控制 SSH 主机密钥选项"#g' $file_name
perl -i -pe 's#\Q"Host key algorithm preference"#"主机密钥算法偏好"#g' $file_name
perl -i -pe 's#\Q"Manually configure host keys for this connection"#"手动配置本连接的主机密钥"#g' $file_name
perl -i -pe 's#\Q"Host keys or fingerprints to accept:"#"可接受的主机密钥或指纹："#g' $file_name
perl -i -pe 's#\Q"Key"#"密钥(K)"#g' $file_name
perl -i -pe 's#\Q"Add key"#"增加(Y)"#g' $file_name
perl -i -pe 's#\Q"Options controlling SSH encryption"#"控制 SSH 加密选项"#g' $file_name
perl -i -pe 's#\Q"Encryption options"#"加密选项"#g' $file_name
perl -i -pe 's#\Q"Encryption cipher selection policy:"#"加密方法选择顺序(S)："#g' $file_name
perl -i -pe 's#\Q"Enable legacy use of single-DES in SSH-2"#"允许 SSH-2 兼容使用单一 DES 算法(I)"#g' $file_name
perl -i -pe 's#\Q"Options controlling SSH authentication"#"SSH 认证设置"#g' $file_name
perl -i -pe 's#\Q"Display pre-authentication banner (SSH-2 only)"#"显示预认证提示，只限于 SSH-2(D)"#g' $file_name
perl -i -pe 's#\Q"Bypass authentication entirely (SSH-2 only)"#"完全绕过认证，只限于 SSH-2(B)"#g' $file_name
perl -i -pe 's#\Q"Authentication methods"#"认证方式"#g' $file_name
perl -i -pe 's#\Q"Attempt authentication using Pageant"#"尝试使用 Pageant 认证"#g' $file_name
perl -i -pe 's#\Q"Attempt TIS or CryptoCard auth (SSH-1)"#"尝试 TIS 或 CryptoCard 认证 (SSH-1) (M)"#g' $file_name
perl -i -pe 's#\Q"Attempt \"keyboard-interactive\" auth (SSH-2)"#"尝试\\"智能键盘\\"认证 (SSH-2) (I)"#g' $file_name
perl -i -pe 's#\Q"Authentication parameters"#"认证参数"#g' $file_name
perl -i -pe 's#\Q"Allow agent forwarding"#"允许代理映射(F)"#g' $file_name
perl -i -pe 's#\Q"Allow attempted changes of username in SSH-2"#"允许尝试在 SSH-2 中修改用户名"#g' $file_name
perl -i -pe 's#\Q"Private key file for authentication:"#"认证私钥文件(K)："#g' $file_name
perl -i -pe 's#\Q"Select private key file"#"选择私钥文件"#g' $file_name
perl -i -pe 's#\Q"Options controlling GSSAPI authentication"#"控制 GSSAPI 认证选项"#g' $file_name
perl -i -pe 's#\Q"Attempt GSSAPI authentication (SSH-2 only)"#"尝试使用 GSSAPI 认证 (仅限SSH-2)"#g' $file_name
perl -i -pe 's#\Q"Attempt GSSAPI key exchange (SSH-2 only)"#"尝试使用 GSSAPI 密钥验证 (仅限SSH-2)"#g' $file_name
perl -i -pe 's#\Q"Allow GSSAPI credential delegation"#"允许 GSSAPI 凭据委托(L)"#g' $file_name
perl -i -pe 's#\Q"Preference order for GSSAPI libraries:"#"GSSAPI 库优先级："#g' $file_name
perl -i -pe 's#\Q"User-supplied GSSAPI library path:"#"用户支持的 GSSAPI 库路径："#g' $file_name
perl -i -pe 's#\Q"Select library file"#"选择库文件"#g' $file_name
perl -i -pe 's#\Q"Remote terminal settings"#"远程终端设置"#g' $file_name
perl -i -pe 's#\Q"Don'\''t allocate a pseudo-terminal"#"不分配假终端(P)"#g' $file_name
perl -i -pe 's#\Q"Terminal modes"#"终端模式"#g' $file_name
perl -i -pe 's#\Q"Terminal modes to send:"#"终端模式用于发送："#g' $file_name
perl -i -pe 's#\Q"For selected mode, send:"#"选择的模式，发送："#g' $file_name
perl -i -pe 's#\Q"Nothing"#"无"#g' $file_name
perl -i -pe 's#\Q"This:"#"指定："#g' $file_name
perl -i -pe 's#\Q"Options controlling SSH X11 forwarding"#"SSH X11 映射设置"#g' $file_name
perl -i -pe 's#\Q"X11 forwarding"#"X11 映射"#g' $file_name
perl -i -pe 's#\Q"Enable X11 forwarding"#"允许 X11 映射(E)"#g' $file_name
perl -i -pe 's#\Q"X display location"#"X 显示位置："#g' $file_name
perl -i -pe 's#\Q"Remote X11 authentication protocol"#"远程 X11 认证协议(U)"#g' $file_name
perl -i -pe 's#\Q"Options controlling SSH port forwarding"#"SSH 端口映射设置"#g' $file_name
perl -i -pe 's#\Q"Port forwarding"#"端口映射"#g' $file_name
perl -i -pe 's#\Q"Local ports accept connections from other hosts"#"本地端口接受其他主机的连接(T)"#g' $file_name
perl -i -pe 's#\Q"Remote ports do the same (SSH-2 only)"#"远程端口接受连接(只限 SSH-2)(P)"#g' $file_name
perl -i -pe 's#\Q"Forwarded ports:"#"映射的端口："#g' $file_name
perl -i -pe 's#\Q"Add new forwarded port:"#"增加新的映射端口："#g' $file_name
perl -i -pe 's#\Q"Add"#"增加(D)"#g' $file_name
perl -i -pe 's#\Q"Source port"#"源端口(S)："#g' $file_name
perl -i -pe 's#\Q"Destination"#"目的地(I)"#g' $file_name
perl -i -pe 's#\Q"Local"#"本地(L)"#g' $file_name
perl -i -pe 's#\Q"Remote"#"远程(M)"#g' $file_name
perl -i -pe 's#\Q"Dynamic"#"动态(Y)"#g' $file_name
perl -i -pe 's#\Q"Auto", '\''u'\''#"自动(U)", '\''u'\''#g' $file_name
perl -i -pe 's#\Q"Workarounds for SSH server bugs"#"处理 SSH 服务器错误设置"#g' $file_name
perl -i -pe 's#\Q"Detection of known bugs in SSH servers"#"检测已知的 SSH 服务器错误"#g' $file_name
perl -i -pe 's#\Q"Chokes on SSH-2 ignore messages"#"阻塞 SSH-2 忽略信息"#g' $file_name
perl -i -pe 's#\Q"Handles SSH-2 key re-exchange badly"#"严格 SSH-2 密钥再次验证操作(K)"#g' $file_name
perl -i -pe 's#\Q"Chokes on PuTTY'\''s SSH-2 '\''winadj'\'' requests"#"阻塞 PuTTY'\''s SSH-2 '\''winadj'\'' 请求"#g' $file_name
perl -i -pe 's#\Q"Replies to requests on closed channels"#"回复已关闭通道的请求(Q)"#g' $file_name
perl -i -pe 's#\Q"Ignores SSH-2 maximum packet size"#"忽略 SSH-2 最大包大小(X)"#g' $file_name
perl -i -pe 's#\Q"Further workarounds for SSH server bugs"#"处理 SSH 服务器更多错误设置"#g' $file_name
perl -i -pe 's#\Q"Detection of known bugs in SSH servers"#"检测已知的 SSH 服务器错误"#g' $file_name
perl -i -pe 's#\Q"Requires padding on SSH-2 RSA signatures"#"SSH-2 RSA 签名附加请求(P)"#g' $file_name
perl -i -pe 's#\Q"Only supports pre-RFC4419 SSH-2 DH GEX"#"只支持 pre-RFC4419 SSH-2 DH GEX"#g' $file_name
perl -i -pe 's#\Q"Miscomputes SSH-2 HMAC keys"#"混算 SSH-2 HMAC 密钥"#g' $file_name
perl -i -pe 's#\Q"Misuses the session ID in SSH-2 PK auth"#"错误 SSH-2 PK 认证会话 ID(N)"#g' $file_name
perl -i -pe 's#\Q"Miscomputes SSH-2 encryption keys"#"混算 SSH-2 加密密钥(E)"#g' $file_name
perl -i -pe 's#\Q"Chokes on SSH-1 ignore messages"#"阻塞 SSH-1 忽略信息(I)"#g' $file_name
perl -i -pe 's#\Q"Refuses all SSH-1 password camouflage"#"拒绝所有 SSH-1 密码伪装"#g' $file_name
perl -i -pe 's#\Q"Chokes on SSH-1 RSA authentication"#"阻塞 SSH-1 RSA 认证"#g' $file_name
perl -i -pe 's#\Q"Options controlling SUPDUP connections"#"SUPDUP 连接设置"#g' $file_name
perl -i -pe 's#\Q"Options controlling local serial lines"#"本地串口设置"#g' $file_name
perl -i -pe 's#\Q"Select a serial line"#"选择一个串口"#g' $file_name
perl -i -pe 's#\Q"Serial line to connect to"#"连接到串口"#g' $file_name
perl -i -pe 's#\Q"Configure the serial line"#"配置串口"#g' $file_name
perl -i -pe 's#\Q"Speed (baud)"#"速度(波特率)"#g' $file_name
perl -i -pe 's#\Q"Data bits"#"数据位"#g' $file_name
perl -i -pe 's#\Q"Stop bits"#"停止位"#g' $file_name
perl -i -pe 's#\Q"Parity"#"奇偶校验位"#g' $file_name
perl -i -pe 's#\Q"Flow control"#"流量控制"#g' $file_name
perl -i -pe 's#\Q"Other:"#"其他:"#g' $file_name
perl -i -pe 's#\Q"Disconnect if authentication succeeds trivially"#"如果身份验证成功，则断开连接"#g' $file_name
perl -i -pe 's#\Q"Extended ASCII Character set:"#"扩展 ASCII 字符集："#g' $file_name
perl -i -pe 's#\Q"**MORE** processing"#"**更多** 加工处理"#g' $file_name
perl -i -pe 's#\Q"Terminal scrolling"#"终端滚动"#g' $file_name
perl -i -pe 's#\Q"Location string"#"位置字符串"#g' $file_name
perl -i -pe 's#\Q"Nothing on this panel may be reconfigured in mid-"#"此面板上的任何内容都不得在会话中进行重新配置；  "#g' $file_name
perl -i -pe 's#\Q"session; it is only here so that sub-panels of it can "#"它只是在这里，以便它的子面板可以存在而不会看起来很奇怪。"#g' $file_name
perl -i -pe 's#\Q"exist without looking strange."#""#g' $file_name
perl -i -pe 's#\Q"Default Settings"#"默认设置"#g' $file_name
perl -i -pe 's#\Q"Shift/Ctrl/Alt with the arrow keys"#"Shift/Ctrl/Alt 与箭头键"#g' $file_name
perl -i -pe 's#\Q"Ctrl toggles app mode"#"Ctrl 切换应用模式"#g' $file_name
perl -i -pe 's#\Q"Manually enabled workarounds"#"手动启用解决方法"#g' $file_name
perl -i -pe 's#\Q"Discards data sent before its greeting"#"丢弃在其问候之前发送的数据"#g' $file_name


perl -i -pe 's#\Q"Terminal"#"终端"#g' $file_name
perl -i -pe 's#\Q"Terminal/Keyboard"#"终端/键盘"#g' $file_name
perl -i -pe 's#\Q"Terminal/Bell"#"终端/响铃"#g' $file_name
perl -i -pe 's#\Q"Terminal/Features"#"终端/特性"#g' $file_name
perl -i -pe 's#\Q"Window"#"窗口"#g' $file_name
perl -i -pe 's#\Q"Window/Appearance"#"窗口/外观"#g' $file_name
perl -i -pe 's#\Q"Window/Behaviour"#"窗口/行为"#g' $file_name
perl -i -pe 's#\Q"Window/Translation"#"窗口/转换"#g' $file_name
perl -i -pe 's#\Q"Window/Selection"#"窗口/选择"#g' $file_name
perl -i -pe 's#\Q"Window/Selection/Copy"#"窗口/选择/复制"#g' $file_name
perl -i -pe 's#\Q"Window/Colours"#"窗口/颜色"#g' $file_name
perl -i -pe 's#\Q"Connection"#"连接"#g' $file_name
perl -i -pe 's#\Q"Connection/Data"#"连接/数据"#g' $file_name
perl -i -pe 's#\Q"Connection/Proxy"#"连接/代理"#g' $file_name
perl -i -pe 's#\Q"Connection/Telnet"#"连接/Telnet"#g' $file_name
perl -i -pe 's#\Q"Connection/Rlogin"#"连接/Rlogin"#g' $file_name
perl -i -pe 's#\Q"Connection/SSH"#"连接/SSH"#g' $file_name
perl -i -pe 's#\Q"Connection/SSH/Kex"#"连接/SSH/密钥"#g' $file_name
perl -i -pe 's#\Q"Connection/SSH/Host keys"#"连接/SSH/主机密钥"#g' $file_name
perl -i -pe 's#\Q"Connection/SSH/Cipher"#"连接/SSH/加密"#g' $file_name
perl -i -pe 's#\Q"Connection/SSH/Auth"#"连接/SSH/认证"#g' $file_name
perl -i -pe 's#\Q"Connection/SSH/Auth/GSSAPI"#"连接/SSH/认证/GSSAPI"#g' $file_name
perl -i -pe 's#\Q"Connection/SSH/TTY"#"连接/SSH/TTY"#g' $file_name
perl -i -pe 's#\Q"Connection/SSH/X11"#"连接/SSH/X11"#g' $file_name
perl -i -pe 's#\Q"Connection/SSH/Tunnels"#"连接/SSH/通道"#g' $file_name
perl -i -pe 's#\Q"Connection/SSH/Bugs"#"连接/SSH/查错"#g' $file_name
perl -i -pe 's#\Q"Connection/SSH/More bugs"#"连接/SSH/更多查错"#g' $file_name
perl -i -pe 's#\Q"Connection/SUPDUP"#"连接/SUPDUP"#g' $file_name
perl -i -pe 's#\Q"Connection/Serial"#"连接/串口"#g' $file_name

perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name


# console.c
file_name="console.c"
echo [04%]开始汉化 console.c
perl -i -pe 's#\Q"The server'\''s host key is not cached. You have no guarantee\n"#"服务器的主机密钥未缓存。你无法保证\\n"#g' $file_name
perl -i -pe 's#\Q"that the server is the computer you think it is.\n"#"服务器就是您认为的计算机。\\n"#g' $file_name
perl -i -pe 's#\Q"The server'\''s %s key fingerprint is:\n"#"服务器 %s 的密钥指纹是:\\n"#g' $file_name
perl -i -pe 's#\Q"If you trust this host, enter \"y\" to add the key to\n"#"如果您信任此主机，请输入 \\"y\\" 以将密钥添加到\\n"#g' $file_name
perl -i -pe 's#\Q"PuTTY'\''s cache and carry on connecting.\n"#"PuTTY 的缓存并继续连接。\\n"#g' $file_name
perl -i -pe 's#\Q"If you want to carry on connecting just once, without\n"#"如果您只想继续连接一次，则无需\\n"#g' $file_name
perl -i -pe 's#\Q"adding the key to the cache, enter \"n\".\n"#"将密钥添加到缓存中，输入 \\"n\\"。\\n"#g' $file_name
perl -i -pe 's#\Q"If you do not trust this host, press Return to abandon the\n"#"如果您不信任此主机，请按 Return 放弃\\n"#g' $file_name
perl -i -pe 's#\Q"connection.\n"#"\\n"#g' $file_name
perl -i -pe 's#\Q"Store key in cache? (y/n, Return cancels connection, "#"将密钥存储在缓存中？ （y/n，返回取消连接，i了解更多信息）"#g' $file_name
perl -i -pe 's#\Q"i for more info) "#""#g' $file_name
perl -i -pe 's#\Q"WARNING - POTENTIAL SECURITY BREACH!\n"#"警告 -潜在的安全漏洞！\\n"#g' $file_name
perl -i -pe 's#\Q"The server'\''s host key does not match the one PuTTY has\n"#"服务器的主机密钥与 PuTTY 的主机密钥不匹配\\n"#g' $file_name
perl -i -pe 's#\Q"cached. This means that either the server administrator\n"#"这意味着服务器管理员\\n"#g' $file_name
perl -i -pe 's#\Q"has changed the host key, or you have actually connected\n"#"已更改主机密钥，或者您已实际连接\\n"#g' $file_name
perl -i -pe 's#\Q"to another computer pretending to be the server.\n"#"到另一台伪装成服务器的计算机。\\n"#g' $file_name
perl -i -pe 's#\Q"The new %s key fingerprint is:\n"#"新的 %s 密钥指纹是:\\n"#g' $file_name
perl -i -pe 's#\Q"If you were expecting this change and trust the new key,\n"#"如果您期待此更改并信任新密钥，\\n"#g' $file_name
perl -i -pe 's#\Q"enter \"y\" to update PuTTY'\''s cache and continue connecting.\n"#"输入 \\"y\\" 以更新 PuTTY 的缓存并继续连接。\\n"#g' $file_name
perl -i -pe 's#\Q"If you want to carry on connecting but without updating\n"#"如果你想继续连接但不更新缓存，\\n"#g' $file_name
perl -i -pe 's#\Q"the cache, enter \"n\".\n"#"请输入 \\"n\\"。\\n"#g' $file_name
perl -i -pe 's#\Q"If you want to abandon the connection completely, press\n"#"如果要完全放弃连接，请按\\n"#g' $file_name
perl -i -pe 's#\Q"Return to cancel. Pressing Return is the ONLY guaranteed\n"#"返回取消。按回车键是唯一保证安全选择\\n"#g' $file_name
perl -i -pe 's#\Q"safe choice.\n"#""#g' $file_name
perl -i -pe 's#\Q"Update cached key? (y/n, Return cancels connection, "#"更新缓存的密钥? (y/n, 返回取消连接, i 了解更多信息) "#g' $file_name
perl -i -pe 's#\Q"i for more info) "#""#g' $file_name
perl -i -pe 's#\Q"The first %s supported by the server is\n"#"服务器支持的第一个 %s 是\\n"#g' $file_name
perl -i -pe 's#\Q"%s, which is below the configured warning threshold.\n"#"%s，低于配置的警告阈值。\\n"#g' $file_name
perl -i -pe 's#\Q"The first host key type we have stored for this server\n"#"我们为此服务器存储的第一个主机密钥类型\\n"#g' $file_name
perl -i -pe 's#\Q"is %s, which is below the configured warning threshold.\n"#"是 %s，低于配置的警告阈值。\\n"#g' $file_name
perl -i -pe 's#\Q"The server also provides the following types of host key\n"#"服务器还提供以下类型的主机密钥\\n"#g' $file_name
perl -i -pe 's#\Q"above the threshold, which we do not have stored:\n"#"高于阈值，我们没有存储：\\n"#g' $file_name
perl -i -pe 's#\Q"Continue with connection? (y/n) "#"继续连接? (y/n) "#g' $file_name
perl -i -pe 's#\Q"Connection abandoned.\n"#"已放弃连接。\\n"#g' $file_name
perl -i -pe 's#\Q"FATAL ERROR"#"致命错误"#g' $file_name
perl -i -pe 's#\Q"ERROR"#"错误"#g' $file_name
perl -i -pe 's#\Q"The host key is not cached for this server:\n"#"未为此服务器缓存主机密钥:\\n"#g' $file_name
perl -i -pe 's#\Q"  %s (port %d)\n"#"  %s (端口 %d)\\n"#g' $file_name
perl -i -pe 's#\Q"You have no guarantee that the server is the computer\n"#"您无法保证服务器就是您认为的计算机.\\n"#g' $file_name
perl -i -pe 's#\Q"you think it is.\n"#""#g' $file_name
perl -i -pe 's#\Q"The host key does not match the one PuTTY has cached\n"#"主机密钥与 PuTTY 已为此服务器缓存的不匹配:\\n"#g' $file_name
perl -i -pe 's#\Q"for this server:\n"#""#g' $file_name
perl -i -pe 's#\Q"This means that either the server administrator has\n"#"这意味着要么服务器管理员更改了主机密钥，要么您已经连接\\n"#g' $file_name
perl -i -pe 's#\Q"changed the host key, or you have actually connected\n"#""#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# import.c
file_name="import.c"
echo [05%]开始汉化 import.c
perl -i -pe 's#\Q"unexpected end of file"#"文件意外结束"#g' $file_name
perl -i -pe 's#\Q"file does not begin with OpenSSH key header"#"文件不以 OpenSSH 密钥头开头"#g' $file_name
perl -i -pe 's#\Q"this is a new-style OpenSSH key"#"这是一种新型 OpenSSH 密钥"#g' $file_name
perl -i -pe 's#\Q"unrecognised key type"#"无法识别的密钥类型"#g' $file_name
perl -i -pe 's#\Q"header found in body of key data"#"在密钥数据正文中找到标头"#g' $file_name
perl -i -pe 's#\Q"Proc-Type is not 4 (only 4 is supported)"#"Proc-Type 不是 4（仅支持 4）"#g' $file_name
perl -i -pe 's#\Q"unsupported cipher"#"不支持的密码"#g' $file_name
perl -i -pe 's#\Q"expected more iv data in DEK-Info"#"预计 DEK-Info 中有更多 iv 数据"#g' $file_name
perl -i -pe 's#\Q"more iv data than expected in DEK-Info"#"DEK-Info 中的 iv 数据多于预期"#g' $file_name
perl -i -pe 's#\Q"invalid base64 encoding"#"无效的 base64 编码"#g' $file_name
perl -i -pe 's#\Q"key body not present"#"密钥不存在"#g' $file_name
perl -i -pe 's#\Q"encrypted key blob is not a multiple of "#"加密的密钥 blob 不是密码块大小的倍数"#g' $file_name
perl -i -pe 's#\Q"cipher block size"#""#g' $file_name
perl -i -pe 's#\Q"ASN.1 decoding failure"#"ASN.1 解码失败"#g' $file_name
perl -i -pe 's#\Q"Unsupported ECDSA curve."#"不支持的 ECDSA 曲线。"#g' $file_name
perl -i -pe 's#\Q"unable to create key data structure"#"无法创建密钥数据结构"#g' $file_name
perl -i -pe 's#\Q"version number mismatch"#"版本号不匹配"#g' $file_name
perl -i -pe 's#\Q"Bad key type from load_openssh_pem_key"#"load_openssh_pem_key 中的错误密钥类型"#g' $file_name
perl -i -pe 's#\Q"bad key alg in openssh_pem_write"#"openssh_pem_write 中的错误密钥算法"#g' $file_name
perl -i -pe 's#\Q"new-style OpenSSH magic number missing\n"#"缺少新式 OpenSSH 幻数\\n"#g' $file_name
perl -i -pe 's#\Q"no cipher name found"#"未找到密码名称"#g' $file_name
perl -i -pe 's#\Q"unrecognised cipher name\n"#"无法识别的密码名称\\n"#g' $file_name
perl -i -pe 's#\Q"no kdf name found"#"没有找到 kdf 名称"#g' $file_name
perl -i -pe 's#\Q"unrecognised kdf name\n"#"无法识别的 kdf 名称\\n"#g' $file_name
perl -i -pe 's#\Q"expected empty options string for 'none' kdf"#"'\''none'\'' kdf 的预期空选项字符串"#g' $file_name
perl -i -pe 's#\Q"failed to parse bcrypt options string"#"无法解析 bcrypt 选项字符串"#g' $file_name
perl -i -pe 's#\Q"no key count found"#"未找到密钥计数"#g' $file_name
perl -i -pe 's#\Q"multiple keys in new-style OpenSSH key file not supported\n"#"不支持新型 OpenSSH 密钥文件中的多个密钥\\n"#g' $file_name
perl -i -pe 's#\Q"no private key container string found\n"#"找不到私钥容器字符串\\n"#g' $file_name
perl -i -pe 's#\Q"Bad cipher enumeration value"#"错误的密码枚举值"#g' $file_name
perl -i -pe 's#\Q"Bad kdf enumeration value"#"错误的 kdf 枚举值"#g' $file_name
perl -i -pe 's#\Q"private key container length is not a"#"私钥容器长度不是 AES 块大小的倍数\\n"#g' $file_name
perl -i -pe 's#\Q" multiple of AES block size\n"#""#g' $file_name
perl -i -pe 's#\Q"decryption check failed"#"解密检查失败"#g' $file_name
perl -i -pe 's#\Q"private key type not recognised\n"#"私钥类型无法识别\\n"#g' $file_name
perl -i -pe 's#\Q"unable to read entire private key"#"无法读取整个私钥"#g' $file_name
perl -i -pe 's#\Q"unable to read key comment"#"无法读取密钥评论"#g' $file_name
perl -i -pe 's#\Q"key index out of range"#"密钥引超出范围"#g' $file_name
perl -i -pe 's#\Q"padding at end of private string did not match"#"私有字符串末尾的填充不匹配"#g' $file_name
perl -i -pe 's#\Q"file does not begin with ssh.com key header"#"文件不以 ssh.com 密钥头开头"#g' $file_name
perl -i -pe 's#\Q"key does not begin with magic number"#"密钥不以幻数开头"#g' $file_name
perl -i -pe 's#\Q"key is of unknown type"#"密钥的类型未知"#g' $file_name
perl -i -pe 's#\Q"key encryption is of unknown type"#"密钥加密的类型未知"#g' $file_name
perl -i -pe 's#\Q"no key data found"#"没有找到密钥数据"#g' $file_name
perl -i -pe 's#\Q"encrypted part of key is not a multiple of cipher block"#"密钥的加密部分不是密码块大小的倍数"#g' $file_name
perl -i -pe 's#\Q" size"#""#g' $file_name
perl -i -pe 's#\Q"containing string was ill-formed"#"包含字符串的格式不正确"#g' $file_name
perl -i -pe 's#\Q"key data did not contain six integers"#"密钥数据不包含六个整数"#g' $file_name
perl -i -pe 's#\Q"predefined DSA parameters not supported"#"不支持预定义的 DSA 参数"#g' $file_name
perl -i -pe 's#\Q"key data did not contain five integers"#"密钥数据不包含五个整数"#g' $file_name
perl -i -pe 's#\Q"unable to create key data structure"#"无法创建密钥数据结构"#g' $file_name
perl -i -pe 's#\Q"file does not begin with OpenSSH new-style key header"#"文件不以 OpenSSH 新式密钥头开头"#g' $file_name
perl -i -pe 's#\Q"expected empty options string for '\''none'\'' kdf"#"'\''none'\'' kdf 的预期空选项字符串"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# ldisc.c
file_name="ldisc.c"
echo [06%]开始汉化 ldisc.c
perl -i -pe 's#\Q"SessionSpecialCode encoding collides with FF FF escape"#"SessionSpecialCode 编码与 FF FF 转义冲突"#g' $file_name
perl -i -pe 's#\Q"You'\''re not supposed to call this unless there is buffered input!"#"除非有缓冲输入，否则您不应该调用它！"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# logging.c
file_name="logging.c"
echo [07%]开始汉化 logging.c
perl -i -pe 's#\Q"SSH packets"#"SSH 包"#g' $file_name
perl -i -pe 's#\Q"Disabled writing session log "#"由于写入时出错而禁用写入会话日志"#g' $file_name
perl -i -pe 's#\Q"due to error while writing"#""#g' $file_name
perl -i -pe 's#\Q"%s session log (%s mode) to file: %s"#"%s 会话日志（%s 模式）到文件：%s"#g' $file_name
perl -i -pe 's#\Q"Disabled writing"#"禁止写入"#g' $file_name
perl -i -pe 's#\Q"Error writing"#"写入错误"#g' $file_name
perl -i -pe 's#\Q"Appending"#"追加"#g' $file_name
perl -i -pe 's#\Q"Writing new"#"新建"#g' $file_name
perl -i -pe 's#\Q"Event Log: %s\r\n"#"事件日志: %s\\r\\n"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# network.h
file_name="network.h"
echo [08%]开始汉化 network.h
perl -i -pe 's#\Q"User aborted connection setup"#"用户中止连接设置"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# pageant.c
file_name="pageant.c"
echo [09%]开始汉化 pageant.c
perl -i -pe 's#\Q"Internal error: attempt to use random numbers in Pageant"#"内部错误：尝试在 Pageant 中使用随机数"#g' $file_name
perl -i -pe 's#\Q"key deleted from Pageant while signing "#"签名请求挂起时从 Pageant 中删除的密钥"#g' $file_name
perl -i -pe 's#\Q"request was pending"#""#g' $file_name
perl -i -pe 's#\Q"on-demand decryption could not "#"按需解密无法提示输入密码"#g' $file_name
perl -i -pe 's#\Q"prompt for a passphrase"#""#g' $file_name
perl -i -pe 's#\Q"unsupported flag bits 0x%08"#"不支持的标志位 0x%08"#g' $file_name
perl -i -pe 's#\Q"key invalid: %s"#"密钥无效: %s"#g' $file_name
perl -i -pe 's#\Q"unable to decrypt key"#"无法解密密钥"#g' $file_name
perl -i -pe 's#\Q"unable to continue creating "#"无法继续创建密码提示"#g' $file_name
perl -i -pe 's#\Q"passphrase prompts"#""#g' $file_name
perl -i -pe 's#\Q"user refused to supply passphrase"#"用户拒绝提供密码"#g' $file_name
perl -i -pe 's#\Q"message contained no type code"#"消息不包含类型代码"#g' $file_name
perl -i -pe 's#\Q"returned key: %s"#"返回密钥: %s"#g' $file_name
perl -i -pe 's#\Q"returned key: %s %s"#"返回密钥: %s %s"#g' $file_name
perl -i -pe 's#\Q"unable to decode request"#"无法解码请求"#g' $file_name
perl -i -pe 's#\Q"response type other than 1 not supported"#"不支持 1 以外的响应类型"#g' $file_name
perl -i -pe 's#\Q"key not found"#"未找到密钥"#g' $file_name
perl -i -pe 's#\Q"key is invalid"#"密钥无效"#g' $file_name
perl -i -pe 's#\Q"submitted key: %s"#"提交的密钥: %s"#g' $file_name
perl -i -pe 's#\Q"key already present"#"密钥已经存在"#g' $file_name
perl -i -pe 's#\Q"algorithm unknown"#"算法未知"#g' $file_name
perl -i -pe 's#\Q"key setup failed"#"密钥设置失败"#g' $file_name
perl -i -pe 's#\Q"submitted key: %s %s"#"提交的密钥: %s %s"#g' $file_name
perl -i -pe 's#\Q"unwanted key: %s"#"不需要的密钥: %s"#g' $file_name
perl -i -pe 's#\Q"found with comment: %s"#"发现有评论: %s"#g' $file_name
perl -i -pe 's#\Q"unrecognised extension name '\''%.*s'\''"#"无法识别的扩展名 '\''%.*s'\''"#g' $file_name
perl -i -pe 's#\Q"failed to extract public key blob: %s"#"无法提取公钥 blob: %s"#g' $file_name
perl -i -pe 's#\Q"failed to decode private key: %s"#"无法解码私钥: %s"#g' $file_name
perl -i -pe 's#\Q" (loaded unencrypted PPK)"#" (加载未加密的 PPK)"#g' $file_name
perl -i -pe 's#\Q"reply: SSH_AGENT_SUCCESS (added encrypted"#"reply: SSH_AGENT_SUCCESS (将加密的 PPK 添加到现有的密钥记录)"#g' $file_name
perl -i -pe 's#\Q" PPK to existing key record)"#""#g' $file_name
perl -i -pe 's#\Q"reply: SSH_AGENT_SUCCESS (made"#"reply: SSH_AGENT_SUCCESS (制作了新的仅加密密钥记录)"#g' $file_name
perl -i -pe 's#\Q" new encrypted-only key record)"#""#g' $file_name
perl -i -pe 's#\Q"key to re-encrypt: %s"#"重新加密的密钥： %s"#g' $file_name
perl -i -pe 's#\Q"this key couldn'\''t be re-encrypted"#"无法重新加密此密钥"#g' $file_name
perl -i -pe 's#\Q"no key could be re-encrypted"#"没有密钥可以重新加密"#g' $file_name
perl -i -pe 's#\Q"(%u keys re-encrypted, %u failures)"#"（%u 密钥重新加密，%u 失败）"#g' $file_name
perl -i -pe 's#\Q"request: unknown message type %d"#"请求：未知消息类型 %d"#g' $file_name
perl -i -pe 's#\Q"unrecognised message"#"无法识别的消息"#g' $file_name
perl -i -pe 's#\Q": error: %s"#": 错误: %s"#g' $file_name
perl -i -pe 's#\Q": connection closed"#": 连接关闭"#g' $file_name
perl -i -pe 's#\Q"(overlong message, length %u)"#"（超长消息，长度 %u）"#g' $file_name
perl -i -pe 's#\Q"listening socket: error: %s"#"监听套接字：错误：%s"#g' $file_name
perl -i -pe 's#\Q": new connection from %s"#": 来自的新连接 %s"#g' $file_name
perl -i -pe 's#\Q": new connection"#": 新连接"#g' $file_name
perl -i -pe 's#\Q"Couldn'\''t load this key (%s)"#"无法加载此密钥 (%s)"#g' $file_name
perl -i -pe 's#\Q"Can'\''t add SSH-1 keys in encrypted form"#"无法以加密形式添加 SSH-1 密钥"#g' $file_name
perl -i -pe 's#\Q"Couldn'\''t load private key (%s)"#"无法加载私钥 (%s)"#g' $file_name
perl -i -pe 's#\Q"Received broken key list from agent"#"从代理收到损坏的密钥列表"#g' $file_name
perl -i -pe 's#\Q"Agent doesn'\''t support adding "#"代理不支持添加加密密钥"#g' $file_name
perl -i -pe 's#\Q"encrypted keys"#""#g' $file_name
perl -i -pe 's#\Q"The already running agent "#"已经运行的代理拒绝添加密钥。"#g' $file_name
perl -i -pe 's#\Q"refused to add the key."#""#g' $file_name
perl -i -pe 's#\Q"Received broken SSH-1 key list from agent"#"从代理收到损坏的 SSH-1 密钥列表"#g' $file_name
perl -i -pe 's#\Q"Received broken SSH-2 key list from agent"#"从代理收到损坏的 SSH-2 密钥列表"#g' $file_name
perl -i -pe 's#\Q"Received an invalid SSH-1 key from agent"#"从代理收到无效的 SSH-1 密钥"#g' $file_name
perl -i -pe 's#\Q"Agent failed to delete key"#"代理未能删除密钥"#g' $file_name
perl -i -pe 's#\Q"Agent failed to delete SSH-2 keys"#"代理无法删除 SSH-2 密钥"#g' $file_name
perl -i -pe 's#\Q"Agent failed to delete SSH-1 keys"#"代理无法删除 SSH-1 密钥"#g' $file_name
perl -i -pe 's#\Q"Can'\''t re-encrypt an SSH-1 key"#"无法重新加密 SSH-1 密钥"#g' $file_name
perl -i -pe 's#\Q"Agent doesn'\''t support encrypted keys"#"代理不支持加密密钥"#g' $file_name
perl -i -pe 's#\Q"Agent failed to re-encrypt key"#"代理无法重新加密密钥"#g' $file_name
perl -i -pe 's#\Q"Agent failed to re-encrypt any keys"#"代理未能重新加密任何密钥"#g' $file_name
perl -i -pe 's#\Q"1 key remains unencrypted"#"1 个密钥未加密"#g' $file_name
perl -i -pe 's#\Q" keys remain unencrypted"#"密钥保持未加密"#g' $file_name
perl -i -pe 's#\Q"Agent failed to create signature"#"代理未能创建签名"#g' $file_name
perl -i -pe 's#\Q"requested key: %s"#"请求的密钥：%s"#g' $file_name
perl -i -pe 's#\Q"signature flags = 0x%08"#"签名标志 = 0x%08"#g' $file_name
perl -i -pe 's#\Q"no signature flags"#"没有签名标志"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# pscp.c
file_name="pscp.c"
echo [10%]开始汉化 pscp.c
perl -i -pe 's#\Q"Error: "#"错误："#g' $file_name
perl -i -pe 's#\Q"PuTTY Secure Copy client\n"#"PuTTY 安全拷贝客户端\\n"#g' $file_name
perl -i -pe 's#\Q"Usage: pscp [options] [user@]host:source target\n"#"用法: pscp [选项] [用户名@]主机:源 目标\\n"#g' $file_name
perl -i -pe 's#\Q"       pscp [options] source [source...] [user@]host:target\n"#"       pscp [选项] 源 [其他源...] [用户名@]主机:目标\\n"#g' $file_name
perl -i -pe 's#\Q"       pscp [options] -ls [user@]host:filespec\n"#"       pscp [选项] -ls [用户名@]主机:指定文件\\n"#g' $file_name
perl -i -pe 's#\Q"Options:\n"#"选项:\\n"#g' $file_name
perl -i -pe 's#\Q"  -V        print version information and exit\n"#"  -V        显示版本信息后退出\\n"#g' $file_name
perl -i -pe 's#\Q"  -pgpfp    print PGP key fingerprints and exit\n"#"  -pgpfp    显示 PGP 密钥指纹后退出\\n"#g' $file_name
perl -i -pe 's#\Q"  -p        preserve file attributes\n"#"  -p        保留文件属性\\n"#g' $file_name
perl -i -pe 's#\Q"  -q        quiet, don'\''t show statistics\n"#"  -q        安静模式，不显示状态信息\\n"#g' $file_name
perl -i -pe 's#\Q"  -r        copy directories recursively\n"#"  -r        递归拷贝目录\\n"#g' $file_name
perl -i -pe 's#\Q"  -v        show verbose messages\n"#"  -v        显示详细信息\\n"#g' $file_name
perl -i -pe 's#\Q"  -load sessname  Load settings from saved session\n"#"  -load 会话名  载入保存的会话信息\\n"#g' $file_name
perl -i -pe 's#\Q"  -P port   connect to specified port\n"#"  -P 端口   连接指定的端口\\n"#g' $file_name
perl -i -pe 's#\Q"  -l user   connect with specified username\n"#"  -l 用户名 使用指定的用户名连接\\n"#g' $file_name
perl -i -pe 's#\Q"  -pw passw login with specified password\n"#"  -pw 密码  使用指定的密码登录\\n"#g' $file_name
perl -i -pe 's#\Q"  -1 -2     force use of particular SSH protocol version\n"#"  -1 -2     强制使用 SSH 协议版本\\n"#g' $file_name
perl -i -pe 's#\Q"  -4 -6     force use of IPv4 or IPv6\n"#"  -4 -6     强制使用 IPv4 或 IPv6 版本\\n"#g' $file_name
perl -i -pe 's#\Q"  -C        enable compression\n"#"  -C        允许压缩\\n"#g' $file_name
perl -i -pe 's#\Q"  -i key    private key file for user authentication\n"#"  -i 密钥   认证使用的密钥文件\\n"#g' $file_name
perl -i -pe 's#\Q"  -noagent  disable use of Pageant\n"#"  -noagent  禁用 Pageant 认证代理\\n"#g' $file_name
perl -i -pe 's#\Q"  -agent    enable use of Pageant\n"#"  -agent    启用 Pageant 认证代理\\n"#g' $file_name
perl -i -pe 's#\Q"            manually specify a host key (may be repeated)\n"#"            手动指定主机密钥(可能重复)\\n"#g' $file_name
perl -i -pe 's#\Q"  -batch    disable all interactive prompts\n"#"  -batch    禁止所有交互提示\\n"#g' $file_name
perl -i -pe 's#\Q"  -no-sanitise-stderr  don'\''t strip control chars from"#"  -no-sanitise-stderr  不要从标准错误中"#g' $file_name
perl -i -pe 's#\Q" standard error\n"#" 删除控制字符\\n"#g' $file_name
perl -i -pe 's#\Q"  -proxycmd command\n"#"  -proxycmd 命令\\n"#g' $file_name
perl -i -pe 's#\Q"            use '\''command'\'' as local proxy\n"#"            使用 '\''命令'\'' 作为本地代理\\n"#g' $file_name
perl -i -pe 's#\Q"  -unsafe   allow server-side wildcards (DANGEROUS)\n"#"  -unsafe   允许服务端通配符(危险操作)\\n"#g' $file_name
perl -i -pe 's#\Q"  -sftp     force use of SFTP protocol\n"#"  -sftp     强制使用 SFTP 协议\\n"#g' $file_name
perl -i -pe 's#\Q"  -scp      force use of SCP protocol\n"#"  -scp      强制使用 SCP 协议\\n"#g' $file_name
perl -i -pe 's#\Q"  -sshlog file\n"#"  -sshlog   文件\\n"#g' $file_name
perl -i -pe 's#\Q"  -sshrawlog file\n"#"  -sshrawlog 文件\\n"#g' $file_name
perl -i -pe 's#\Q"            log protocol details to a file\n"#"            记录协议详细日志到指定文件\\n"#g' $file_name
perl -i -pe 's#\Q"Received unexpected end-of-file from server"#"从服务器收到意外的文件结尾"#g' $file_name
perl -i -pe 's#\Q"did not receive SFTP response packet from server"#"未收到来自服务器的 SFTP 响应数据包"#g' $file_name
perl -i -pe 's#\Q"unable to understand SFTP response packet from server: %s"#"无法理解来自服务器的 SFTP 响应数据包：%s"#g' $file_name
perl -i -pe 's#\Q"Empty host name"#"空主机名"#g' $file_name
perl -i -pe 's#\Q"Empty user name"#"空用户名"#g' $file_name
perl -i -pe 's#\Q"Guessing user name: %s"#"猜测用户名：%s"#g' $file_name
perl -i -pe 's#\Q"Connected to %s"#"连接到 %s"#g' $file_name
perl -i -pe 's#\Q"Protocol error: Lost connection"#"协议错误: 失去了连接"#g' $file_name
perl -i -pe 's#\Q"Lost connection"#"失去了连接"#g' $file_name
perl -i -pe 's#\Q"Directory is too large to sort; writing file names unsorted\n"#"目录太大，无法排序；写入未排序的文件名\\n"#g' $file_name
perl -i -pe 's#\Q"unable to initialise SFTP: %s"#"无法初始化 SFTP: %s"#g' $file_name
perl -i -pe 's#\Q"Listing directory %s\n"#"列出目录 %s\\n"#g' $file_name
perl -i -pe 's#\Q"Unable to open %s: %s\n"#"无法打开 %s: %s\\n"#g' $file_name
perl -i -pe 's#\Q"Reading directory %s: %s\n"#"读取目录 %s: %s\\n"#g' $file_name
perl -i -pe 's#\Q"pscp: remote filespec %s: not a directory\n"#"pscp: 远程文件规范 %s: 不是目录\\n"#g' $file_name
perl -i -pe 's#\Q"pscp: unable to open %s: %s"#"pscp: 无法打开 %s: %s"#g' $file_name
perl -i -pe 's#\Q"error while writing: %s"#"写入时出错：%s"#g' $file_name
perl -i -pe 's#\Q"unable to set file times: %s"#"无法设置文件时间: %s"#g' $file_name
perl -i -pe 's#\Q"server reported no error"#"服务器报告没有错误"#g' $file_name
perl -i -pe 's#\Q"unable to create directory %s: %s"#"无法创建目录 %s: %s"#g' $file_name
perl -i -pe 's#\Q"%s: multiple-level wildcards unsupported"#"%s: 不支持多级通配符"#g' $file_name
perl -i -pe 's#\Q"pscp: wildcard '\''%s'\'' matched "#"pscp: 通配符“%s”没有匹配文件"#g' $file_name
perl -i -pe 's#\Q"no files"#""#g' $file_name
perl -i -pe 's#\Q"unable to identify %s: %s"#"无法识别 %s: %s"#g' $file_name
perl -i -pe 's#\Q"file type not supplied"#"未提供文件类型"#g' $file_name
perl -i -pe 's#\Q"pscp: %s: is a directory"#"pscp: %s: 是一个目录"#g' $file_name
perl -i -pe 's#\Q"pscp: unable to open directory %s: %s"#"pscp: 无法打开目录 %s: %s"#g' $file_name
perl -i -pe 's#\Q"pscp: reading directory %s: %s"#"pscp: 读取目录 %s: %s"#g' $file_name
perl -i -pe 's#\Q"ignoring potentially dangerous "#"忽略服务器提供的潜在危险文件名“%s”"#g' $file_name
perl -i -pe 's#\Q"server-supplied filename '\''%s'\''"#""#g' $file_name
perl -i -pe 's#\Q"Protocol error: Unexpected newline"#"协议错误: 意外的换行符"#g' $file_name
perl -i -pe 's#\Q"Protocol error: Illegal time format"#"协议错误: 非法时间格式"#g' $file_name
perl -i -pe 's#\Q"security violation: remote host attempted to create "#"安全违规：远程主机试图在非递归副本中创建子目录！"#g' $file_name
perl -i -pe 's#\Q"a subdirectory in a non-recursive copy!"#""#g' $file_name
perl -i -pe 's#\Q"Protocol error: Expected control record"#"协议错误：预期的控制记录"#g' $file_name
perl -i -pe 's#\Q"Protocol error: Illegal file descriptor format"#"协议错误：非法文件描述符格式"#g' $file_name
perl -i -pe 's#\Q"pscp: error while reading: %s"#"pscp: 读取时出错: %s"#g' $file_name
perl -i -pe 's#\Q"pscp: end of file while reading"#"pscp：读取时文件结束"#g' $file_name
perl -i -pe 's#\Q"%s: %s file or directory"#"%s: %s 文件或目录"#g' $file_name
perl -i -pe 's#\Q"%s: not a regular file"#"%s: 不是普通文件"#g' $file_name
perl -i -pe 's#\Q"%s: Cannot open file"#"%s: 无法打开文件"#g' $file_name
perl -i -pe 's#\Q"Sending file %s, size=%"#"发送文件 %s，大小=%"#g' $file_name
perl -i -pe 's#\Q"%s: Read error"#"%s: 读取错误"#g' $file_name
perl -i -pe 's#\Q"%s: Network error occurred"#"%s: 发生网络错误"#g' $file_name
perl -i -pe 's#\Q"Entering directory: %s"#"进入目录：%s"#g' $file_name
perl -i -pe 's#\Q"Error opening directory %s: %s"#"打开目录 %s 时出错: %s"#g' $file_name
perl -i -pe 's#\Q"%s: Not a directory"#"%s: 不是目录"#g' $file_name
perl -i -pe 's#\Q"warning: remote host sent a"#"警告：远程主机发送了复合路径名“%s”"#g' $file_name
perl -i -pe 's#\Q" compound pathname '\''%s'\''"#""#g' $file_name
perl -i -pe 's#\Q"         renaming local"#"         将本地文件重命名为“%s”"#g' $file_name
perl -i -pe 's#\Q" file to '\''%s'\''"#""#g' $file_name
perl -i -pe 's#\Q"security violation: remote host attempted to write to"#"安全违规：远程主机试图写入“.”或“..”路径！"#g' $file_name
perl -i -pe 's#\Q" a '\''.'\'' or '\''..'\'' path!"#""#g' $file_name
perl -i -pe 's#\Q"warning: remote host tried to "#"警告：远程主机试图写入名为“%s”的文件"#g' $file_name
perl -i -pe 's#\Q"write to a file called '\''%s'\''"#""#g' $file_name
perl -i -pe 's#\Q"         when we requested a file "#"         当我们请求一个名为“%s”的文件时."#g' $file_name
perl -i -pe 's#\Q"called '\''%s'\''."#""#g' $file_name
perl -i -pe 's#\Q"         If this is a wildcard, "#"         如果这是通配符，请考虑升级到 SSH-2 或使用"#g' $file_name
perl -i -pe 's#\Q"consider upgrading to SSH-2 or using"#""#g' $file_name
perl -i -pe 's#\Q"         the '\''-unsafe'\'' option. Renaming"#"         '\''-unsafe'\'' 选项。不允许重命名此文件。"#g' $file_name
perl -i -pe 's#\Q" of this file has been disallowed."#""#g' $file_name
perl -i -pe 's#\Q"%s: Cannot create directory"#"%s: 无法创建目录"#g' $file_name
perl -i -pe 's#\Q"%s: Cannot create file"#"%s: 无法创建文件"#g' $file_name
perl -i -pe 's#\Q"Write error.. waiting for end of file"#"写入错误..等待文件结束"#g' $file_name
perl -i -pe 's#\Q"%s: Write error"#"%s: 写入错误"#g' $file_name
perl -i -pe 's#\Q"%s: Remote to remote not supported"#"%s: 不支持远程到远程"#g' $file_name
perl -i -pe 's#\Q"%s: No such file or directory\n"#"%s: 无此文件或目录\\n"#g' $file_name
perl -i -pe 's#\Q"%s: Remote to remote not supported\n"#"%s: 不支持远程到远程\\n"#g' $file_name
perl -i -pe 's#\Q"%s: No such file or directory"#"%s: 没有这样的文件或目录"#g' $file_name
perl -i -pe 's#\Q"More than one remote source not supported"#"不支持多个远程源"#g' $file_name
perl -i -pe 's#\Q"Local to local copy not supported"#"不支持本地到本地副本"#g' $file_name
perl -i -pe 's#\Q"Local file listing not supported"#"不支持本地文件列表"#g' $file_name
perl -i -pe 's#\Q"            force use of particular SSH protocol variant\n"#"            强制使用特定的 SSH 协议变体\\n"#g' $file_name
perl -i -pe 's#\Q"            disconnect if SSH authentication succeeds trivially\n"#"            如果 SSH 身份验证成功，则断开连接\\n"#g' $file_name
perl -i -pe 's#\Q"            control what happens when a log file already exists\n"#"            控制当日志文件已经存在时会发生什么\\n"#g' $file_name
perl -i -pe 's#\Q"\n      try typing just \"pscp\" for help\n"#"\\n     尝试输入 \\"pscp\\" 寻求帮助\\n"#g' $file_name
perl -i -pe 's#\Q"option \"%s\" requires an argument"#"选项 \\"%s\\" 需要一个参数"#g' $file_name
perl -i -pe 's#\Q"unknown option \"%s\""#"未知选项 \\"%s\\""#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# psftp.c
file_name="psftp.c"
echo [11%]开始汉化 psftp.c
perl -i -pe 's#\Q"Error: "#"错误："#g' $file_name
perl -i -pe 's#\Q"PuTTY Secure File Transfer (SFTP) client\n"#"PuTTY 安全文件传输 (SFTP) 客户端\\n"#g' $file_name
perl -i -pe 's#\Q"Usage: psftp [options] [user@]host\n"#"用法: psftp [选项] [用户名@]主机\\n"#g' $file_name
perl -i -pe 's#\Q"Options:\n"#"选项:\\n"#g' $file_name
perl -i -pe 's#\Q"  -V        print version information and exit\n"#"  -V        显示版本信息后退出\\n"#g' $file_name
perl -i -pe 's#\Q"  -pgpfp    print PGP key fingerprints and exit\n"#"  -pgpfp    显示 PGP 密钥指纹后退出\\n"#g' $file_name
perl -i -pe 's#\Q"  -b file   use specified batchfile\n"#"  -b 文件   使用指定的批处理文件\\n"#g' $file_name
perl -i -pe 's#\Q"  -bc       output batchfile commands\n"#"  -bc       输出批处理文件命令\\n"#g' $file_name
perl -i -pe 's#\Q"  -be       don'\''t stop batchfile processing if errors\n"#"  -be       批处理文件发生错误也不停止其处理进程\\n"#g' $file_name
perl -i -pe 's#\Q"  -v        show verbose messages\n"#"  -v        显示详细信息\\n"#g' $file_name
perl -i -pe 's#\Q"  -load sessname  Load settings from saved session\n"#"  -load 会话名  载入保存的会话信息\\n"#g' $file_name
perl -i -pe 's#\Q"  -l user   connect with specified username\n"#"  -l 用户名 使用指定的用户名连接\\n"#g' $file_name
perl -i -pe 's#\Q"  -P port   connect to specified port\n"#"  -P 端口   连接指定的端口\\n"#g' $file_name
perl -i -pe 's#\Q"  -pw passw login with specified password\n"#"  -pw 密码  使用指定的密码登录\\n"#g' $file_name
perl -i -pe 's#\Q"  -1 -2     force use of particular SSH protocol version\n"#"  -1 -2     强制使用 SSH 协议版本\\n"#g' $file_name
perl -i -pe 's#\Q"  -4 -6     force use of IPv4 or IPv6\n"#"  -4 -6     强制使用 IPv4 或 IPv6 版本\\n"#g' $file_name
perl -i -pe 's#\Q"  -C        enable compression\n"#"  -C        允许压缩\\n"#g' $file_name
perl -i -pe 's#\Q"  -i key    private key file for user authentication\n"#"  -i 密钥   认证使用的密钥文件\\n"#g' $file_name
perl -i -pe 's#\Q"  -noagent  disable use of Pageant\n"#"  -noagent  禁止使用 Pageant 认证代理\\n"#g' $file_name
perl -i -pe 's#\Q"  -agent    enable use of Pageant\n"#"  -agent    开启使用 Pageant 认证代理\\n"#g' $file_name
perl -i -pe 's#\Q"            manually specify a host key (may be repeated)\n"#"            手工指定主机密钥指纹 (可能是重复的)\\n"#g' $file_name
perl -i -pe 's#\Q"  -batch    disable all interactive prompts\n"#"  -batch    禁止所有交互提示\\n"#g' $file_name
perl -i -pe 's#\Q"  -no-sanitise-stderr  don'\''t strip control chars from"#"  -no-sanitise-stderr  不要从标准错误中"#g' $file_name
perl -i -pe 's#\Q" standard error\n"#" 删除控制字符\\n"#g' $file_name
perl -i -pe 's#\Q"  -proxycmd command\n"#"  -proxycmd 命令\\n"#g' $file_name
perl -i -pe 's#\Q"            use '\''command'\'' as local proxy\n"#"            使用 '\''命令'\'' 作为本地代理\\n"#g' $file_name
perl -i -pe 's#\Q"  -sshlog file\n"#"  -sshlog 文件\\n"#g' $file_name
perl -i -pe 's#\Q"  -sshrawlog file\n"#"  -sshrawlog 文件\\n"#g' $file_name
perl -i -pe 's#\Q"            log protocol details to a file\n"#"            日志协议明细输出到文件\\n"#g' $file_name
perl -i -pe 's#\Q"psftp: no hostname specified; use \"open host.name\""#"psftp: 未指定主机名; 请使用 \\"open host.name\\""#g' $file_name
perl -i -pe 's#\Q" to connect\n"#" 进行连接\\n"#g' $file_name
perl -i -pe 's#\Q"did not receive SFTP response packet from server"#"未收到来自服务器的 SFTP 响应数据包"#g' $file_name
perl -i -pe 's#\Q"unable to understand SFTP response packet from server: %s"#"无法理解来自服务器的 SFTP 响应数据包：%s"#g' $file_name
perl -i -pe 's#\Q"psftp: not connected to a host; use \"open host.name\"\n"#"psftp: 未连接到主机；使用\\"打开主机名\\"\\n"#g' $file_name
perl -i -pe 's#\Q"%s: Cannot create directory\n"#"%s: 无法创建目录\\n"#g' $file_name
perl -i -pe 's#\Q"%s: unable to open directory: %s\n"#"%s: 无法打开目录: %s\\n"#g' $file_name
perl -i -pe 's#\Q"%s: reading directory: %s\n"#"%s: 读取目录: %s\\n"#g' $file_name
perl -i -pe 's#\Q"ignoring potentially dangerous server-"#"忽略服务器提供的潜在危险文件名“%s”\\n"#g' $file_name
perl -i -pe 's#\Q"supplied filename '\''%s'\''\n"#""#g' $file_name
perl -i -pe 's#\Q"%s: open for read: %s\n"#"%s:打开并读取: %s\\n"#g' $file_name
perl -i -pe 's#\Q"local: unable to open %s\n"#"本地：无法打开 %s\\n"#g' $file_name
perl -i -pe 's#\Q"reget: cannot restart %s - file too large\n"#"reget: 无法重新启动 %s -文件太大\\n"#g' $file_name
perl -i -pe 's#\Q"reget: restarting at file position "#"reget：在文件位置重新启动"#g' $file_name
perl -i -pe 's#\Q"error while reading: %s\n"#"读取时出错: %s\\n"#g' $file_name
perl -i -pe 's#\Q"error while writing local file\n"#"写入本地文件时出错\\n"#g' $file_name
perl -i -pe 's#\Q"%s: create directory: %s\n"#"%s: 创建目录： %s\\n"#g' $file_name
perl -i -pe 's#\Q"%s: unable to open directory: %s\n"#"%s: 无法打开目录： %s\\n"#g' $file_name
perl -i -pe 's#\Q"local: unable to open %s\n"#"本地：无法打开 %s\\n"#g' $file_name
perl -i -pe 's#\Q"%s: open for write: %s\n"#"%s: 为写入打开: %s\\n"#g' $file_name
perl -i -pe 's#\Q"read size of %s: %s\n"#"%s 的读取大小: %s\\n"#g' $file_name
perl -i -pe 's#\Q"read size of %s: size was not given\n"#"%s 的读取大小：未给出大小\\n"#g' $file_name
perl -i -pe 's#\Q"reput: restarting at file position "#"reput：在文件位置重新启动"#g' $file_name
perl -i -pe 's#\Q"error while reading local file\n"#"读取本地文件时出错\\n"#g' $file_name
perl -i -pe 's#\Q"error while writing: %s\n"#"写入时出错: %s\\n"#g' $file_name
perl -i -pe 's#\Q"error while closing: %s"#"关闭时出错：%s"#g' $file_name
perl -i -pe 's#\Q"Multiple-level wildcards are not supported\n"#"不支持多级通配符\\n"#g' $file_name
perl -i -pe 's#\Q"Unable to open %s: %s\n"#"无法打开 %s: %s\\n"#g' $file_name
perl -i -pe 's#\Q"%s: reading directory: %s\n"#"%s: 读取目录: %s\\n"#g' $file_name
perl -i -pe 's#\Q"ignoring potentially dangerous server-"#"忽略服务器提供的潜在危险文件名“%s”\\n"#g' $file_name
perl -i -pe 's#\Q"supplied filename '\''%s'\''\n"#""#g' $file_name
perl -i -pe 's#\Q"%s: nothing matched\n"#"%s: 没有匹配的\\n"#g' $file_name
perl -i -pe 's#\Q"psftp: unknown command \"%s\"\n"#"psftp: 未知的命令\\"%s\\"\\n"#g' $file_name
perl -i -pe 's#\Q"Directory is too large to sort; writing file names unsorted\n"#"目录太大，无法排序；写入未排序的文件名\\n"#g' $file_name
perl -i -pe 's#\Q"Multiple-level wildcards are not supported\n"#"不支持多级通配符\\n"#g' $file_name
perl -i -pe 's#\Q"Listing directory %s\n"#"列出目录 %s\\n"#g' $file_name
perl -i -pe 's#\Q"Unable to open %s: %s\n"#"打不开 %s: %s\\n"#g' $file_name
perl -i -pe 's#\Q"Reading directory %s: %s\n"#"读取目录 %s: %s\\n"#g' $file_name
perl -i -pe 's#\Q"Directory %s: %s\n"#"目录 %s: %s\\n"#g' $file_name
perl -i -pe 's#\Q"Remote directory is now %s\n"#"远程目录现在是 %s\\n"#g' $file_name
perl -i -pe 's#\Q"Remote directory is %s\n"#"远程目录是 %s\\n"#g' $file_name
perl -i -pe 's#\Q"%s: unrecognised option '\''%s'\''\n"#"%s: 无法识别的选项“%s”\\n"#g' $file_name
perl -i -pe 's#\Q"%s: expects a filename\n"#"%s: 需要一个文件名\\n"#g' $file_name
perl -i -pe 's#\Q"%s: nothing matched\n"#"%s: 没有匹配的\\n"#g' $file_name
perl -i -pe 's#\Q"%s: unrecognised option '\''%s'\''\n"#"%s: 无法识别的选项“%s”\\n"#g' $file_name
perl -i -pe 's#\Q"%s: expects a filename\n"#"%s: 需要一个文件名\\n"#g' $file_name
perl -i -pe 's#\Q"mkdir: expects a directory\n"#"mkdir: 需要一个目录\\n"#g' $file_name
perl -i -pe 's#\Q"rm: expects a filename\n"#"rm: 需要一个文件名\\n"#g' $file_name
perl -i -pe 's#\Q"mv: expects two filenames\n"#"mv: 需要两个文件名\\n"#g' $file_name
perl -i -pe 's#\Q"mv: multiple or wildcard arguments require the destination"#"mv：多个或通配符参数要求目标是目录\\n"#g' $file_name
perl -i -pe 's#\Q" to be a directory\n"#""#g' $file_name
perl -i -pe 's#\Q"get attrs for %s: %s\n"#"获取 %s 的属性: %s\\n"#g' $file_name
perl -i -pe 's#\Q"file permissions not provided"#"未提供文件权限"#g' $file_name
perl -i -pe 's#\Q"set attrs for %s: %s\n"#"为 %s 设置属性: %s\\n"#g' $file_name
perl -i -pe 's#\Q"chmod: expects a mode specifier and a filename\n"#"chmod: 需要一个模式说明符和一个文件名\\n"#g' $file_name
perl -i -pe 's#\Q"chmod: numeric file modes should"#"chmod: 数字文件模式应仅包含数字 0-7\\n"#g' $file_name
perl -i -pe 's#\Q" contain digits 0-7 only\n"#""#g' $file_name
perl -i -pe 's#\Q"chmod: file mode '\''%.*s'\'' contains unrecognised"#"chmod: 文件模式 '\''%.*s'\'' 包含无法识别的用户/组/其他说明符 '\''%c'\''\\n"#g' $file_name
perl -i -pe 's#\Q" user/group/other specifier '\''%c'\''\n"#""#g' $file_name
perl -i -pe 's#\Q"chmod: file mode '\''%.*s'\'' is incomplete\n"#"chmod: 文件模式 '\''%.*s'\'' 不完整\\n"#g' $file_name
perl -i -pe 's#\Q"chmod: file mode '\''%.*s'\'': set[ug]id bit should"#"chmod: 文件模式 '\''%.*s'\'': set[ug]id 位只能与 u 或 g 之一一起使用\\n"#g' $file_name
perl -i -pe 's#\Q" be used with exactly one of u or g only\n"#""#g' $file_name
perl -i -pe 's#\Q"chmod: file mode '\''%.*s'\'' contains unrecognised"#"chmod: 文件模式 '\''%.*s'\'' 包含无法识别的权限说明符 '\''%c'\''\\n"#g' $file_name
perl -i -pe 's#\Q" permission specifier '\''%c'\''\n"#""#g' $file_name
perl -i -pe 's#\Q"chmod: file mode '\''%.*s'\'' contains no user/group/other"#"chmod: 文件模式 '\''%.*s'\'' 不包含除 '\''t'\'' 之外的用户/组/其他说明符和权限 \\n"#g' $file_name
perl -i -pe 's#\Q" specifier and permissions other than '\''t'\'' \n"#""#g' $file_name
perl -i -pe 's#\Q"psftp: already connected\n"#"psftp: 已经连接\\n"#g' $file_name
perl -i -pe 's#\Q"open: expects a host name\n"#"open: 需要一个主机名\\n"#g' $file_name
perl -i -pe 's#\Q"open: invalid port number\n"#"open: 无效的端口号\\n"#g' $file_name
perl -i -pe 's#\Q"lcd: expects a local directory name\n"#"lcd: 需要一个本地目录名\\n"#g' $file_name
perl -i -pe 's#\Q"lcd: unable to change directory: %s\n"#"lcd: 无法更改目录: %s\\n"#g' $file_name
perl -i -pe 's#\Q"New local directory is %s\n"#"新的本地目录是 %s\\n"#g' $file_name
perl -i -pe 's#\Q"Current local directory is %s\n"#"当前本地目录是 %s\\n"#g' $file_name
perl -i -pe 's#\Q"help: %s: command not found\n"#"help: %s: 没有找到指令\\n"#g' $file_name
perl -i -pe 's#\Q"Fatal: unable to initialise SFTP: %s\n"#"致命: 无法初始化 SFTP: %s\\n"#g' $file_name
perl -i -pe 's#\Q"Warning: failed to resolve home directory: %s\n"#"警告：无法解析主目录: %s\\n"#g' $file_name
perl -i -pe 's#\Q"Remote working directory is %s\n"#"远程工作目录是 %s\\n"#g' $file_name
perl -i -pe 's#\Q"Fatal: unable to open %s\n"#"致命：无法打开%s\\n"#g' $file_name
perl -i -pe 's#\Q"Received unexpected end-of-file from SFTP server"#"从 SFTP 服务器收到意外的文件结尾"#g' $file_name
perl -i -pe 's#\Q"            force use of particular SSH protocol variant\n"#"            强制使用特定的 SSH 协议变体\\n"#g' $file_name
perl -i -pe 's#\Q"            disconnect if SSH authentication succeeds trivially\n"#"            如果 SSH 身份验证成功，则断开连接\\n"#g' $file_name
perl -i -pe 's#\Q"            control what happens when a log file already exists\n"#"            控制当日志文件已经存在时会发生什么\\n"#g' $file_name
perl -i -pe 's#\Q"psftp: multiple usernames specified; using \"%s\"\n"#"psftp：指定了多个用户名；使用 \\"%s\\"\\n"#g' $file_name
perl -i -pe 's#\Q"ssh_init: error during SSH connection setup\n"#"ssh_init: SSH 连接设置期间的错误\\n"#g' $file_name
perl -i -pe 's#\Q"\n       try typing \"psftp -h\" for help\n"#"\\n       尝试输入“psftp -h”寻求帮助\\n"#g' $file_name
perl -i -pe 's#\Q"option \"%s\" requires an argument"#"选项 \\"%s\\" 需要一个参数"#g' $file_name
perl -i -pe 's#\Q"reget: restarting at file position %"#"reget：在文件位置重新启动 %"#g' $file_name
perl -i -pe 's#\Q"remote:%s => local:%s\n"#"remote:%s => local:%s\\n"#g' $file_name
perl -i -pe 's#\Q"reput: restarting at file position %"#"reput：在文件位置重新启动 %"#g' $file_name
perl -i -pe 's#\Q"rmdir: expects a directory\n"#"rmdir: 需要一个目录\\n"#g' $file_name
perl -i -pe 's#\Q"run a local command"#"运行本地命令"#g' $file_name
perl -i -pe 's#\Q"  Runs a local command. For example, \"!del myfile\".\n"#"  运行本地命令。例如, \\"!del myfile\\".\\n"#g' $file_name
perl -i -pe 's#\Q"finish your SFTP session"#"完成您的 SFTP 会话"#g' $file_name
perl -i -pe 's#\Q"  Terminates your SFTP session and quits the PSFTP program.\n"#"  终止您的 SFTP 会话并退出 PSFTP 程序。\\n"#g' $file_name
perl -i -pe 's#\Q"change your remote working directory"#"更改您的远程工作目录"#g' $file_name
perl -i -pe 's#\Q" [ <new working directory> ]\n"#" [ <新的工作目录> ]\\n"#g' $file_name
perl -i -pe 's#\Q"  Change the remote working directory for your SFTP session.\n"#"  更改 SFTP 会话的远程工作目录。\\n"#g' $file_name
perl -i -pe 's#\Q"  If a new working directory is not supplied, you will be\n"#"  如果未提供新的工作目录，您将\\n"#g' $file_name
perl -i -pe 's#\Q"  returned to your home directory.\n"#"  返回到你的主目录.\\n"#g' $file_name
perl -i -pe 's#\Q"change file permissions and modes"#"更改文件权限和模式"#g' $file_name
perl -i -pe 's#\Q"  Change the file permissions on one or more remote files or\n"#"  更改一个或多个远程文件或目录的文件权限\\n"#g' $file_name
perl -i -pe 's#\Q"  directories.\n"#""#g' $file_name
perl -i -pe 's#\Q"  <modes> can be any octal Unix permission specifier.\n"#"  <modes> 可以是任何八进制 Unix 权限说明符。\\n"#g' $file_name
perl -i -pe 's#\Q"  Alternatively, <modes> can include the following modifiers:\n"#"  或者， <modes> 可以包括以下修饰符:\\n"#g' $file_name
perl -i -pe 's#\Q"    u+r     make file readable by owning user\n"#"    u+r     使文件由拥有的用户可读\\n"#g' $file_name
perl -i -pe 's#\Q"    u+w     make file writable by owning user\n"#"    u+w     使文件由拥有的用户可写\\n"#g' $file_name
perl -i -pe 's#\Q"    u+x     make file executable by owning user\n"#"    u+x     使文件由拥有的用户可执行\\n"#g' $file_name
perl -i -pe 's#\Q"    u-r     make file not readable by owning user\n"#"    u-r     使文件不被拥有的用户读取\\n"#g' $file_name
perl -i -pe 's#\Q"    g+r     make file readable by members of owning group\n"#"    g+r     让所属组的成员可以读取文件\\n"#g' $file_name
perl -i -pe 's#\Q"    o+r     make file readable by all other users\n"#"    o+r     使所有其他用户都可以读取文件\\n"#g' $file_name
perl -i -pe 's#\Q"    a+r     make file readable by absolutely everybody\n"#"    a+r     让每个人都可以阅读文件\\n"#g' $file_name
perl -i -pe 's#\Q"    u+s     enable the Unix set-user-ID bit\n"#"    u+s     启用 Unix 设置用户 ID 位\\n"#g' $file_name
perl -i -pe 's#\Q"    u-s     disable the Unix set-user-ID bit\n"#"    u-s     禁用 Unix 设置用户 ID 位\\n"#g' $file_name
perl -i -pe 's#\Q"    g+s     enable the Unix set-group-ID bit\n"#"    g+s     启用 Unix set-group-ID 位\\n"#g' $file_name
perl -i -pe 's#\Q"    g-s     disable the Unix set-group-ID bit\n"#"    g-s     禁用 Unix set-group-ID 位\\n"#g' $file_name
perl -i -pe 's#\Q"    +t      enable the Unix \"sticky bit\"\n"#"    +t      启用 Unix \\"sticky bit\\"\\n"#g' $file_name
perl -i -pe 's#\Q"  You can give more than one modifier for the same user (\"g-rwx\"), and\n"#"  您可以为同一用户提供多个修饰符 (\\"g-rwx\\")，并且\\n"#g' $file_name
perl -i -pe 's#\Q"  more than one user for the same modifier (\"ug+w\"). You can\n"#"  多个用户使用相同的修饰符 (\\"ug+w\\")。你可以\\n"#g' $file_name
perl -i -pe 's#\Q"  use commas to separate different modifiers (\"u+rwx,g+s\").\n"#"  使用逗号分隔不同的修饰符 (\\"u+rwx,g+s\\")。\\n"#g' $file_name
perl -i -pe 's#\Q"finish your SFTP session but do not quit PSFTP"#"完成您的 SFTP 会话，但不要退出 PSFTP"#g' $file_name
perl -i -pe 's#\Q"  Terminates your SFTP session, but does not quit the PSFTP\n"#"  终止您的 SFTP 会话，但不退出 PSFTP\\n"#g' $file_name
perl -i -pe 's#\Q"  program. You can then use \"open\" to start another SFTP\n"#"程序。然后您可以使用 \\"open\\" 启动另一个 SFTP\\n"#g' $file_name
perl -i -pe 's#\Q"  session, to the same server or to a different one.\n"#"会话，到同一服务器或到不同的服务器。\\n"#g' $file_name
perl -i -pe 's#\Q"delete files on the remote server"#"删除远程服务器上的文件"#g' $file_name
perl -i -pe 's#\Q"  Delete a file or files from the server.\n"#"  从服务器中删除一个或多个文件.\\n"#g' $file_name
perl -i -pe 's#\Q"list remote files"#"列出远程文件"#g' $file_name
perl -i -pe 's#\Q"  List the contents of a specified directory on the server.\n"#"  列出服务器上指定目录的内容。\\n"#g' $file_name
perl -i -pe 's#\Q"  If <directory-name> is not given, the current working directory\n"#"  如果未给出 <directory-name>，则假定为当前工作目录。\\n"#g' $file_name
perl -i -pe 's#\Q"  is assumed.\n"#""#g' $file_name
perl -i -pe 's#\Q"  If <wildcard> is given, it is treated as a set of files to\n"#"如果给出 <wildcard>，则将其视为要列出的一组文件；否则，将列出所有文件。\\n"#g' $file_name
perl -i -pe 's#\Q"  list; otherwise, all files are listed.\n"#""#g' $file_name
perl -i -pe 's#\Q"download a file from the server to your local machine"#"从服务器下载文件到本地机器"#g' $file_name
perl -i -pe 's#\Q"  Downloads a file on the server and stores it locally under\n"#"  在服务器上下载文件并将其存储在本地\\n"#g' $file_name
perl -i -pe 's#\Q"  the same name, or under a different one if you supply the\n"#"  相同的名称，或者在您提供的情况下使用不同的名称\\n"#g' $file_name
perl -i -pe 's#\Q"  argument <local-filename>.\n"#"  参数 <local-filename>.\\n"#g' $file_name
perl -i -pe 's#\Q"  If -r specified, recursively fetch a directory.\n"#"  如果指定了 -r，则递归获取目录。\\n"#g' $file_name
perl -i -pe 's#\Q"give help"#"提供帮助"#g' $file_name
perl -i -pe 's#\Q"  Give general help if no commands are specified.\n"#"  如果未指定命令，请提供一般帮助。\\n"#g' $file_name
perl -i -pe 's#\Q"  If one or more commands are specified, give specific help on\n"#"  如果指定了一个或多个命令，请针对这些特定命令提供具体帮助。\\n"#g' $file_name
perl -i -pe 's#\Q"  those particular commands.\n"#""#g' $file_name
perl -i -pe 's#\Q"change local working directory"#"更改本地工作目录"#g' $file_name
perl -i -pe 's#\Q"  Change the local working directory of the PSFTP program (the\n"#"  更改 PSFTP 程序的本地工作目录（\\"get\\" 命令将保存文件的默认位置）。\\n"#g' $file_name
perl -i -pe 's#\Q"  default location where the \"get\" command will save files).\n"#""#g' $file_name
perl -i -pe 's#\Q"print local working directory"#"打印本地工作目录"#g' $file_name
perl -i -pe 's#\Q"  Print the local working directory of the PSFTP program (the\n"#"  打印 PSFTP 程序的本地工作目录（\\"get\\" 命令将保存文件的默认位置）。\\n"#g' $file_name
perl -i -pe 's#\Q"  default location where the \"get\" command will save files).\n"#""#g' $file_name
perl -i -pe 's#\Q"download multiple files at once"#"一次下载多个文件"#g' $file_name
perl -i -pe 's#\Q"  Downloads many files from the server, storing each one under\n"#"  从服务器下载许多文件，将每个文件存储在\\n"#g' $file_name
perl -i -pe 's#\Q"  the same name it has on the server side. You can use wildcards\n"#"  它在服务器端具有相同的名称。您可以使用通配符\\n"#g' $file_name
perl -i -pe 's#\Q"  such as \"*.c\" to specify lots of files at once.\n"#"  例如 \\"*.c\\" 一次指定大量文件。\\n"#g' $file_name
perl -i -pe 's#\Q"  If -r specified, recursively fetch files and directories.\n"#"  如果 -r 指定，递归获取文件和目录.\\n"#g' $file_name
perl -i -pe 's#\Q"create directories on the remote server"#"在远程服务器上创建目录"#g' $file_name
perl -i -pe 's#\Q"  Creates directories with the given names on the server.\n"#"  在服务器上创建具有给定名称的目录。\\n"#g' $file_name
perl -i -pe 's#\Q"upload multiple files at once"#"一次上传多个文件"#g' $file_name
perl -i -pe 's#\Q"  Uploads many files to the server, storing each one under the\n"#"  将许多文件上传到服务器，将每个文件存储在\\n"#g' $file_name
perl -i -pe 's#\Q"  same name it has on the client side. You can use wildcards\n"#"  它在客户端具有相同的名称。您可以使用通配符\\n"#g' $file_name
perl -i -pe 's#\Q"  such as \"*.c\" to specify lots of files at once.\n"#"  例如 \\"*.c\\" 一次指定大量文件。\\n"#g' $file_name
perl -i -pe 's#\Q"  If -r specified, recursively store files and directories.\n"#"  如果指定了 -r，则递归存储文件和目录。\\n"#g' $file_name
perl -i -pe 's#\Q"move or rename file(s) on the remote server"#"移动或重命名远程服务器上的文件"#g' $file_name
perl -i -pe 's#\Q"  Moves or renames <source>(s) on the server to <destination>,\n"#"  将服务器上的 <source>(s) 移动或重命名为 <destination>，也在服务器上。\\n"#g' $file_name
perl -i -pe 's#\Q"  also on the server.\n"#""#g' $file_name
perl -i -pe 's#\Q"  If <destination> specifies an existing directory, then <source>\n"#"  如果<destination> 指定一个已有目录，那么<source> 可以是通配符，\\n"#g' $file_name
perl -i -pe 's#\Q"  may be a wildcard, and multiple <source>s may be given; all\n"#"  并且可以给出多个<source>；所有源文件都移到 <destination> 中。\\n"#g' $file_name
perl -i -pe 's#\Q"  source files are moved into <destination>.\n"#""#g' $file_name
perl -i -pe 's#\Q"  Otherwise, <source> must specify a single file, which is moved\n"#"  否则，<source> 必须指定一个文件，该文件被移动或重命名，以便可以在名称 <destination> 下访问它。\\n"#g' $file_name
perl -i -pe 's#\Q"  or renamed so that it is accessible under the name <destination>.\n"#""#g' $file_name
perl -i -pe 's#\Q"connect to a host"#"连接到主机"#g' $file_name
perl -i -pe 's#\Q"  Establishes an SFTP connection to a given host. Only usable\n"#"  建立到给定主机的 SFTP 连接。仅当您尚未连接到服务器时才可用。\\n"#g' $file_name
perl -i -pe 's#\Q"  when you are not already connected to a server.\n"#""#g' $file_name
perl -i -pe 's#\Q"upload a file from your local machine to the server"#"将文件从本地机器上传到服务器"#g' $file_name
perl -i -pe 's#\Q"  Uploads a file to the server and stores it there under\n"#"  将文件上传到服务器并将其存储在\\n"#g' $file_name
perl -i -pe 's#\Q"  argument <remote-filename>.\n"#"  参数 <remote-filename>.\\n"#g' $file_name
perl -i -pe 's#\Q"  If -r specified, recursively store a directory.\n"#"  如果指定了 -r，则递归存储一个目录。\\n"#g' $file_name
perl -i -pe 's#\Q"print your remote working directory"#"打印你的远程工作目录"#g' $file_name
perl -i -pe 's#\Q"  Print the current remote working directory for your SFTP session.\n"#"  打印 SFTP 会话的当前远程工作目录。\\n"#g' $file_name
perl -i -pe 's#\Q"continue downloading files"#"继续下载文件"#g' $file_name
perl -i -pe 's#\Q"  Works exactly like the \"get\" command, but the local file\n"#"  工作方式与 \\"get\\" 命令完全相同，但本地文件必须已经存在。\\n"#g' $file_name
perl -i -pe 's#\Q"  must already exist. The download will begin at the end of the\n"#"下载将从文件末尾开始。这是为了恢复被中断的下载。\\n"#g' $file_name
perl -i -pe 's#\Q"  file. This is for resuming a download that was interrupted.\n"#""#g' $file_name
perl -i -pe 's#\Q"  If -r specified, resume interrupted \"get -r\".\n"#"  如果指定了 -r，则恢复中断的 \\"get -r\\"。\\n"#g' $file_name
perl -i -pe 's#\Q"continue uploading files"#"继续上传文件"#g' $file_name
perl -i -pe 's#\Q"  Works exactly like the \"put\" command, but the remote file\n"#"  工作方式与 \\"put\\" 命令完全相同，但远程文件必须已经存在。上传将从文件末尾开始。这是为了恢复被中断的上传。\\n"#g' $file_name
perl -i -pe 's#\Q"  must already exist. The upload will begin at the end of the\n"#""#g' $file_name
perl -i -pe 's#\Q"  file. This is for resuming an upload that was interrupted.\n"#""#g' $file_name
perl -i -pe 's#\Q"  If -r specified, resume interrupted \"put -r\".\n"#"  如果指定了 -r，则恢复中断的 \\"put -r\\"。\\n"#g' $file_name
perl -i -pe 's#\Q"remove directories on the remote server"#"删除远程服务器上的目录"#g' $file_name
perl -i -pe 's#\Q"  Removes the directory with the given name on the server.\n"#"  删除服务器上具有给定名称的目录。\\n"#g' $file_name
perl -i -pe 's#\Q"  The directory will not be removed unless it is empty.\n"#"  该目录不会被删除，除非它是空的.\\n"#g' $file_name
perl -i -pe 's#\Q"  Wildcards may be used to specify multiple directories.\n"#"  通配符可用于指定多个目录。\\n"#g' $file_name
perl -i -pe 's#\Q"  -pwfile file   login with password read from specified file\n"#"  -pwfile 文件   使用从指定文件读取的密码登录\\n"#g' $file_name
perl -i -pe 's#\Q"Connected to %s\n"#"连接到 %s\\n"#g' $file_name
perl -i -pe 's#\Q"unknown option \"%s\""#"未知选项“%s”"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# psocks.c
file_name="psocks.c"
echo [12%]开始汉化 psocks.c
perl -i -pe 's#\Q"request from %s for %s port %d"#"来自 %s 对 %s 端口 %d 的请求"#g' $file_name
perl -i -pe 's#\Q"cannot log this connection: "#"无法记录此连接: 创建文件 '\''%s'\'': %s"#g' $file_name
perl -i -pe 's#\Q"creating file '\''%s'\'': %s"#""#g' $file_name
perl -i -pe 's#\Q"cannot log this connection: "#"无法记录此连接：创建管道：%s"#g' $file_name
perl -i -pe 's#\Q"creating pipes: %s"#""#g' $file_name
perl -i -pe 's#\Q"name lookup failed: %s"#"名称查找失败：%s"#g' $file_name
perl -i -pe 's#\Q"trying to connect to %s port %d"#"试图连接到 %s 端口 %d"#g' $file_name
perl -i -pe 's#\Q"trying to connect to %s"#"试图连接到 %s"#g' $file_name
perl -i -pe 's#\Q"connection attempt failed: %s"#"连接尝试失败：%s"#g' $file_name
perl -i -pe 's#\Q"connection established"#"连接已建立"#g' $file_name
perl -i -pe 's#\Q"connection setup: %s"#"连接设置: %s"#g' $file_name
perl -i -pe 's#\Q"unable to connect: %s"#"无法连接: %s"#g' $file_name
perl -i -pe 's#\Q"psocks: '\''-p'\'' is not supported on this "#"psocks: 此平台不支持“-p”\\n"#g' $file_name
perl -i -pe 's#\Q"platform\n"#""#g' $file_name
perl -i -pe 's#\Q"psocks: running a subcommand is not "#"psocks: 此平台不支持运行子命令\\n"#g' $file_name
perl -i -pe 's#\Q"supported on this platform\n"#""#g' $file_name
perl -i -pe 's#\Q"psocks: unexpected extra argument '\''%s'\''\n"#"psocks: 意外的额外参数“%s”\\n"#g' $file_name
perl -i -pe 's#\Q"host keys not handled in this tool"#"此工具中未处理的主机密钥"#g' $file_name
perl -i -pe 's#\Q"logging to '\''%s'\'' / '\''%s'\''"#"登录到 '\''%s'\'' / '\''%s'\''"#g' $file_name
perl -i -pe 's#\Q"closed"#"关闭"#g' $file_name
perl -i -pe 's#\Q"send eof"#"发送 eof"#g' $file_name
perl -i -pe 's#\Q"recv eof"#"接收"#g' $file_name
perl -i -pe 's#\Q"psocks: expected an argument to '\''-p'\''\n"#"psocks: 期待一个参数 '\''-p'\''\\n"#g' $file_name
perl -i -pe 's#\Q"where: -d           log all connection contents to"#"where: -d           将所有连接内容记录到标准输出\\n"#g' $file_name
perl -i -pe 's#\Q" standard output\n"#""#g' $file_name
perl -i -pe 's#\Q"       -f           record each half-connection to "#"       -f          将每个半连接记录到文件 sockin.N/sockout.N\\n"#g' $file_name
perl -i -pe 's#\Q"a file sockin.N/sockout.N\n"#""#g' $file_name
perl -i -pe 's#\Q"       -p pipe-cmd  pipe each half-connection"#"       -p pipe-cmd  将每个半连接通过管道传输到“pipe-cmd [in|out] N”\\n"#g' $file_name
perl -i -pe 's#\Q" to '\''pipe-cmd [in|out] N'\''\n"#""#g' $file_name
perl -i -pe 's#\Q"       -g           accept connections from anywhere,"#"       -g           接受来自任何地方的连接，"#g' $file_name
perl -i -pe 's#\Q" not just localhost\n"#" 不仅仅是本地主机\\n"#g' $file_name
perl -i -pe 's#\Q"       --exec subcmd [args...]   run command, and "#"       --exec subcmd [args...]   运行命令，并在它退出时终止\\n"#g' $file_name
perl -i -pe 's#\Q"terminate when it exits\n"#""#g' $file_name
perl -i -pe 's#\Q"       port-number  listen on this port"#"       port-number  监听这个端口"#g' $file_name
perl -i -pe 's#\Q" (default 1080)\n"#" (默认 1080)\\n"#g' $file_name
perl -i -pe 's#\Q"also: psocks --help      display this help text\n"#"also: psocks --help      显示此帮助文本\\n"#g' $file_name
perl -i -pe 's#\Q"psocks: unrecognised option '\''%s'\''\n"#"psocks: 无法识别的选项 '\''%s'\''\\n"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# putty.h
file_name="putty.h"
echo [13%]开始汉化 putty.h
perl -i -pe 's#\Q"Default Settings"#"默认设置"#g' putty.h
perl -i -pe 's#\Q"Default Foreground"#"默认前景"#g' putty.h
perl -i -pe 's#\Q"Default Bold Foreground"#"默认前景(粗)"#g' putty.h
perl -i -pe 's#\Q"Default Background"#"默认背景"#g' putty.h
perl -i -pe 's#\Q"Default Bold Background"#"默认背景(粗)"#g' putty.h
perl -i -pe 's#\Q"Cursor Text"#"光标文本"#g' putty.h
perl -i -pe 's#\Q"Cursor Colour"#"光标颜色"#g' putty.h
perl -i -pe 's#\Q"ANSI Black"#"ANSI 黑"#g' putty.h
perl -i -pe 's#\Q"ANSI Black Bold"#"ANSI 黑(粗)"#g' putty.h
perl -i -pe 's#\Q"ANSI Red"#"ANSI 红"#g' putty.h
perl -i -pe 's#\Q"ANSI Red Bold"#"ANSI 红(粗)"#g' putty.h
perl -i -pe 's#\Q"ANSI Green"#"ANSI 绿"#g' putty.h
perl -i -pe 's#\Q"ANSI Green Bold"#"ANSI 绿(粗)"#g' putty.h
perl -i -pe 's#\Q"ANSI Yellow"#"ANSI 黄"#g' putty.h
perl -i -pe 's#\Q"ANSI Yellow Bold"#"ANSI 黄(粗)"#g' putty.h
perl -i -pe 's#\Q"ANSI Blue"#"ANSI 蓝"#g' putty.h
perl -i -pe 's#\Q"ANSI Blue Bold"#"ANSI 蓝(粗)"#g' putty.h
perl -i -pe 's#\Q"ANSI Magenta"#"ANSI 紫"#g' putty.h
perl -i -pe 's#\Q"ANSI Magenta Bold"#"ANSI 紫(粗)"#g' putty.h
perl -i -pe 's#\Q"ANSI Cyan"#"ANSI 青"#g' putty.h
perl -i -pe 's#\Q"ANSI Cyan Bold"#"ANSI 青(粗)"#g' putty.h
perl -i -pe 's#\Q"ANSI White"#"ANSI 白"#g' putty.h
perl -i -pe 's#\Q"ANSI White Bold"#"ANSI 白(粗)"#g' putty.h
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# settings.c
file_name="settings.c"
echo [14%]开始汉化 settings.c
perl -i -pe 's#\Q"Default Settings"#"默认设置"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# sshpubk.c
file_name="sshpubk.c"
echo [15%]开始汉化 sshpubk.c
perl -i -pe 's#\Q"unable to open file"#"无法打开文件"#g' $file_name
perl -i -pe 's#\Q"not a recognised key file format"#"不是私钥"#g' $file_name
perl -i -pe 's#\Q"SSH-1 public key"#"SSH-1 公钥"#g' $file_name
perl -i -pe 's#\Q"SSH-2 public key (RFC 4716 format)"#"SSH-2 公钥 (RFC 4716 格式)"#g' $file_name
perl -i -pe 's#\Q"SSH-2 public key (OpenSSH format)"#"SSH-2 公钥 (OpenSSH 格式)"#g' $file_name
perl -i -pe 's#\Q"SSH-1 private key"#"SSH-1 私钥"#g' $file_name
perl -i -pe 's#\Q"PuTTY SSH-2 private key"#"PuTTY SSH-2 私钥"#g' $file_name
perl -i -pe 's#\Q"OpenSSH SSH-2 private key (old PEM format)"#"OpenSSH SSH-2 私钥 (旧 PEM 格式)"#g' $file_name
perl -i -pe 's#\Q"OpenSSH SSH-2 private key (new format)"#"OpenSSH SSH-2 私钥 (新格式)"#g' $file_name
perl -i -pe 's#\Q"ssh.com SSH-2 private key"#"ssh.com SSH-2 私钥"#g' $file_name
perl -i -pe 's#\Q"file is too large to be a key file"#"文件太大而不能成为密钥文件"#g' $file_name
perl -i -pe 's#\Q"bad status value in lf_load_keyfile_helper"#"lf_load_keyfile_helper 中的错误状态值"#g' $file_name
perl -i -pe 's#\Q"not an SSH-1 RSA file"#"不是 SSH-1 RSA 文件"#g' $file_name
perl -i -pe 's#\Q"file format error"#"文件格式错误"#g' $file_name
perl -i -pe 's#\Q"wrong passphrase"#"密码错误"#g' $file_name
perl -i -pe 's#\Q"rsa_verify failed"#"rsa_verify 失败"#g' $file_name
perl -i -pe 's#\Q"key bit count does not match in SSH-1 public key file"#"SSH-1 公钥文件中的密钥位数不匹配"#g' $file_name
perl -i -pe 's#\Q"not an SSH-1 RSA file"#"不是 SSH-1 RSA 文件"#g' $file_name
perl -i -pe 's#\Q"bad format version in ssh2_ppk_derive_keys"#"ssh2_ppk_derive_keys 中的错误格式版本"#g' $file_name
perl -i -pe 's#\Q"not a PuTTY SSH-2 private key"#"不是 PuTTY SSH-2 私钥"#g' $file_name
perl -i -pe 's#\Q"MAC failed"#"MAC 失败"#g' $file_name
perl -i -pe 's#\Q"createkey failed"#"创建密钥失败"#g' $file_name
perl -i -pe 's#\Q"can'\''t open file"#"无法打开文件"#g' $file_name
perl -i -pe 's#\Q"invalid begin line in SSH-2 public key file"#"SSH-2 公钥文件中的无效开始行"#g' $file_name
perl -i -pe 's#\Q"truncated SSH-2 public key file"#"截断的 SSH-2 公钥文件"#g' $file_name
perl -i -pe 's#\Q"invalid end line in SSH-2 public key file"#"SSH-2 公钥文件中的无效结束行"#g' $file_name
perl -i -pe 's#\Q"invalid algorithm prefix in SSH-2 public key file"#"SSH-2 公钥文件中的算法前缀无效"#g' $file_name
perl -i -pe 's#\Q"no key blob in OpenSSH public key file"#"OpenSSH 公钥文件中没有密钥 blob"#g' $file_name
perl -i -pe 's#\Q"invalid length for base64 data in OpenSSH public key file"#"OpenSSH 公钥文件中 base64 数据的长度无效"#g' $file_name
perl -i -pe 's#\Q"key algorithms do not match in OpenSSH public key file"#"OpenSSH 公钥文件中的密钥算法不匹配"#g' $file_name
perl -i -pe 's#\Q"Bad key type in ssh2_write_pubkey"#"ssh2_write_pubkey 中的错误密钥类型"#g' $file_name
perl -i -pe 's#\Q"PuTTY key format too new"#"PuTTY 密钥格式太新"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# x11disp.c
file_name="x11disp.c"
echo [16%]开始汉化 x11disp.c
perl -i -pe 's#\Q"display name '\''%s'\'' has no '\'':number'\''"#"显示名称“%s”没有“:number”后缀"#g' $file_name
perl -i -pe 's#\Q" suffix"#""#g' $file_name
perl -i -pe 's#\Q"unable to resolve host name '\''%s'\'' in "#"无法解析显示名称中的主机名“%s”"#g' $file_name
perl -i -pe 's#\Q"display name"#""#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# charset/utf8.c
file_name="charset/utf8.c"
echo [17%]开始汉化 charset/utf8.c
perl -i -pe 's#\Q"%d: correct string shorter than output\n"#"%d: 正确的字符串比输出短\\n"#g' $file_name
perl -i -pe 's#\Q"%d: char %d came out as %08x, should be %08x\n"#"%d: 字符 %d 作为 %08x 出现，应该是 %08x\\n"#g' $file_name
perl -i -pe 's#\Q"%d: correct string longer than output\n"#"%d: 正确的字符串比输出长\\n"#g' $file_name
perl -i -pe 's#\Q"read tests completed\n"#"读取测试完成\\n"#g' $file_name
perl -i -pe 's#\Q"write tests beginning\n"#"开始写测试\\n"#g' $file_name
perl -i -pe 's#\Q"write tests completed\n"#"写测试完成\\n"#g' $file_name
perl -i -pe 's#\Q"total: %d errors\n"#"总计：%d 个错误\\n"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# contrib/cygtermd/main.c
file_name="contrib/cygtermd/main.c"
echo [18%]开始汉化 contrib/cygtermd/main.c
perl -i -pe 's#\Q"standard input: read: %s\n"#"标准输入：读取：%s\\n"#g' $file_name
perl -i -pe 's#\Q"standard input: write: %s\n"#"标准输入：写入: %s\\n"#g' $file_name
perl -i -pe 's#\Q"pty: read: %s\n"#"pty: 读: %s\\n"#g' $file_name
perl -i -pe 's#\Q"pty: write: %s\n"#"pty: 写: %s\\n"#g' $file_name
perl -i -pe 's#\Q"signal pipe: read: %s\n"#"信号管道：读取: %s\\n"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# contrib/cygtermd/malloc.c
file_name="contrib/cygtermd/malloc.c"
echo [19%]开始汉化 contrib/cygtermd/malloc.c
perl -i -pe 's#\Q"out of memory"#"内存溢出"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# proxy/http.c
file_name="proxy/http.c"
echo [20%]开始汉化 proxy/http.c
perl -i -pe 's#\Q"Unable to parse auth header from HTTP proxy"#"无法解析来自 HTTP 代理的身份验证标头"#g' $file_name
perl -i -pe 's#\Q"parse error"#"解析错误"#g' $file_name
perl -i -pe 's#\Q"Digest authentication not supported"#"不支持摘要式身份验证"#g' $file_name
perl -i -pe 's#\Q"parse error in Digest header"#"摘要标头中的解析错误"#g' $file_name
perl -i -pe 's#\Q"parse error in Digest realm field"#"摘要领域字段中的解析错误"#g' $file_name
perl -i -pe 's#\Q"parse error in Digest nonce field"#"Digest nonce 字段中的解析错误"#g' $file_name
perl -i -pe 's#\Q"parse error in Digest opaque field"#"摘要不透明字段中的解析错误"#g' $file_name
perl -i -pe 's#\Q"parse error in Digest stale field"#"Digest stale 字段中的解析错误"#g' $file_name
perl -i -pe 's#\Q"parse error in Digest userhash "#"Digest userhash 字段中的解析错误"#g' $file_name
perl -i -pe 's#\Q"field"#""#g' $file_name
perl -i -pe 's#\Q"parse error in Digest algorithm "#"摘要算法字段中的解析错误"#g' $file_name
perl -i -pe 's#\Q"Digest hash algorithm '\''%s'\'' not "#"摘要哈希算法 '\''%s'\'' 不"#g' $file_name
perl -i -pe 's#\Q"recognised"#"认可"#g' $file_name
perl -i -pe 's#\Q"supported"#"支持"#g' $file_name
perl -i -pe 's#\Q"parse error in Digest qop field"#"Digest qop 字段中的解析错误"#g' $file_name
perl -i -pe 's#\Q"quality-of-protection type '\''%s'\'' not "#"保护质量类型“%s”不"#g' $file_name
perl -i -pe 's#\Q"authentication type '\''%s'\'' not supported"#"不支持身份验证类型“%s”"#g' $file_name
perl -i -pe 's#\Q"HTTP response was absent or malformed"#"HTTP 响应不存在或格式错误"#g' $file_name
perl -i -pe 's#\Q"no Proxy-Authorization header seen in "#"HTTP 407 Proxy Authentication Required "#g' $file_name
perl -i -pe 's#\Q"HTTP 407 Proxy Authentication Required response"#"响应中没有看到 Proxy-Authorization 标头"#g' $file_name
perl -i -pe 's#\Q"Received bad character 0x%02X in chunk length "#"在 HTTP 分块传输编码期间收到块长度中的错误字符 0x%02X"#g' $file_name
perl -i -pe 's#\Q"during HTTP chunked transfer encoding"#""#g' $file_name
perl -i -pe 's#\Q"Missing CRLF after chunk "#"在 HTTP 分块传输编码期间块后缺少 CRLF"#g' $file_name
perl -i -pe 's#\Q"HTTP proxy requested authentication "#"HTTP 代理请求了我们没有的身份验证"#g' $file_name
perl -i -pe 's#\Q"which we do not have"#""#g' $file_name
perl -i -pe 's#\Q"HTTP proxy authentication"#"HTTP 代理认证"#g' $file_name
perl -i -pe 's#\Q"Proxy username: "#"代理用户名："#g' $file_name
perl -i -pe 's#\Q"Proxy password: "#"代理密码："#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# proxy/local.c
file_name="proxy/local.c"
echo [21%]开始汉化 proxy/local.c
perl -i -pe 's#\Q"Local proxy authentication"#"本地代理认证"#g' $file_name
perl -i -pe 's#\Q"Proxy username: "#"代理用户名: "#g' $file_name
perl -i -pe 's#\Q"Proxy password: "#"代理密码: "#g' $file_name
perl -i -pe 's#\Q"Starting local proxy command: "#"启动本地代理命令: "#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# proxy/nocproxy.c
file_name="proxy/nocproxy.c"
echo [22%]开始汉化 proxy/nocproxy.c
perl -i -pe 's#\Q"CHAP is not built into this binary"#"CHAP 未内置到此二进制文件中"#g' $file_name
perl -i -pe 's#\Q"HTTP DIGEST is not built into this binary"#"HTTP DIGEST 未内置到此二进制文件中"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# proxy/proxy.c
file_name="proxy/proxy.c"
echo [23%]开始汉化 proxy/proxy.c
perl -i -pe 's#\Q"Proxy error: %s"#"代理错误: %s"#g' $file_name
perl -i -pe 's#\Q"ProxySockets never create listening Sockets"#"ProxySockets 从不创建监听 Sockets"#g' $file_name
perl -i -pe 's#\Q"Looking up host \"%s\"%s for %s"#"为 %s 查找主机 \\"%s\\"%s"#g' $file_name
perl -i -pe 's#\Q"Leaving host lookup to proxy of \"%s\""#"将主机查找留给 \\"%s\\" 的代理（用于 %s）"#g' $file_name
perl -i -pe 's#\Q" (for %s)"#""#g' $file_name
perl -i -pe 's#\Q"%s connection to %s port %d"#"%s 连接到 %s 端口 %d"#g' $file_name
perl -i -pe 's#\Q"Proxy error: Unknown proxy method"#"代理错误：未知的代理方法"#g' $file_name
perl -i -pe 's#\Q"Will use %s proxy at %s:%d to connect"#"将使用 %sd 的 %a 代理连接到 %s:%d"#g' $file_name
perl -i -pe 's#\Q" to %s:%d"#""#g' $file_name
perl -i -pe 's#\Q"Proxy error: Unable to resolve proxy host name"#"代理错误：无法解析代理主机名"#g' $file_name
perl -i -pe 's#\Q"Connecting to %s proxy at %s port %d"#"在 %s 端口 %d 连接到 %s 代理"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# proxy/socks4.c
file_name="proxy/socks4.c"
echo [24%]开始汉化 proxy/socks4.c
perl -i -pe 's#\Q"SOCKS version 4 does not support IPv6"#"SOCKS 版本 4 不支持 IPv6"#g' $file_name
perl -i -pe 's#\Q"SOCKS proxy response contained reply "#"SOCKS 代理响应包含回复版本号 %d（预期为 0）"#g' $file_name
perl -i -pe 's#\Q"version number %d (expected 0)"#""#g' $file_name
perl -i -pe 's#\Q"SOCKS server reported failure to connect"#"SOCKS 服务器报告连接失败"#g' $file_name
perl -i -pe 's#\Q"SOCKS server wanted IDENTD on client"#"SOCKS 服务器在客户端需要 IDENTD"#g' $file_name
perl -i -pe 's#\Q"Username and IDENTD on client don'\''t agree"#"客户端上的用户名和 IDENTD 不一致"#g' $file_name
perl -i -pe 's#\Q"SOCKS server sent unrecognised error "#"SOCKS 服务器发送了无法识别的错误代码 %d"#g' $file_name
perl -i -pe 's#\Q"code %d"#""#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# proxy/socks5.c
file_name="proxy/socks5.c"
echo [25%]开始汉化 proxy/socks5.c
perl -i -pe 's#\Q"none"#"空"#g' $file_name
perl -i -pe 's#\Q"password"#"密码"#g' $file_name
perl -i -pe 's#\Q"unknown"#"未知"#g' $file_name
perl -i -pe 's#\Q"success"#"成功"#g' $file_name
perl -i -pe 's#\Q"unspecified failure"#"未指明的失败"#g' $file_name
perl -i -pe 's#\Q"connection not allowed by ruleset"#"规则集不允许连接"#g' $file_name
perl -i -pe 's#\Q"network unreachable"#"网络不可达"#g' $file_name
perl -i -pe 's#\Q"host unreachable"#"主机不可达"#g' $file_name
perl -i -pe 's#\Q"connection refused"#"拒绝连接"#g' $file_name
perl -i -pe 's#\Q"TTL expired"#"TTL 已过期"#g' $file_name
perl -i -pe 's#\Q"command not supported"#"不支持命令"#g' $file_name
perl -i -pe 's#\Q"address type not supported"#"不支持地址类型"#g' $file_name
perl -i -pe 's#\Q"SOCKS proxy returned unexpected "#"SOCKS 代理返回意外回复版本 %d (预期 %d)"#g' $file_name
perl -i -pe 's#\Q"reply version %d (expected %d)"#""#g' $file_name
perl -i -pe 's#\Q"SOCKS server rejected every authentication "#"SOCKS 服务器拒绝了我们提供的所有身份验证方法"#g' $file_name
perl -i -pe 's#\Q"method we offered"#""#g' $file_name
perl -i -pe 's#\Q"SOCKS server asked for auth method %d "#"SOCKS 服务器要求验证方法 %d (%s)，我们没有提供"#g' $file_name
perl -i -pe 's#\Q"(%s), which we did not offer"#""#g' $file_name
perl -i -pe 's#\Q"SOCKS proxy authentication"#"SOCKS 代理认证"#g' $file_name
perl -i -pe 's#\Q"Proxy username: "#"代理用户名："#g' $file_name
perl -i -pe 's#\Q"Proxy password: "#"代理密码: "#g' $file_name
perl -i -pe 's#\Q"SOCKS 5 authentication cannot support "#"SOCKS 5 身份验证不支持超过 255 个字符的用户名"#g' $file_name
perl -i -pe 's#\Q"usernames longer than 255 chars"#""#g' $file_name
perl -i -pe 's#\Q"SOCKS 5 authentication cannot support "#"SOCKS 5 身份验证不支持超过 255 个字符的密码"#g' $file_name
perl -i -pe 's#\Q"passwords longer than 255 chars"#""#g' $file_name
perl -i -pe 's#\Q"SOCKS 5 password reply had version number %d (expected "#"SOCKS 5 密码回复的版本号为 %d（预期"#g' $file_name
perl -i -pe 's#\Q"SOCKS 5 server rejected our password"#"SOCKS 5 服务器拒绝了我们的密码"#g' $file_name
perl -i -pe 's#\Q"SOCKS 5 CHAP authentication cannot support "#"SOCKS 5 CHAP 身份验证不支持超过 255 个字符的用户名"#g' $file_name
perl -i -pe 's#\Q"usernames longer than 255 chars"#""#g' $file_name
perl -i -pe 's#\Q"SOCKS 5 CHAP reply had version number %d (expected "#"SOCKS 5 CHAPTER 回复的版本号为 %d（预期"#g' $file_name
perl -i -pe 's#\Q"SOCKS 5 CHAP reply sent no attributes"#"SOCKS 5 CHAP 回复未发送任何属性"#g' $file_name
perl -i -pe 's#\Q"SOCKS 5 CHAP authentication failed"#"SOCKS 5 CHAP 身份验证失败"#g' $file_name
perl -i -pe 's#\Q"bad auth method in SOCKS 5 negotiation"#"SOCKS 5 协商中的错误身份验证方法"#g' $file_name
perl -i -pe 's#\Q"SOCKS 5 cannot support host names longer than 255 chars"#"SOCKS 5 不能支持超过 255 个字符的主机名"#g' $file_name
perl -i -pe 's#\Q"Unexpected addrtype in SOCKS 5 proxy"#"SOCKS 5 代理中出现意外的 addrtype"#g' $file_name
perl -i -pe 's#\Q"SOCKS proxy returned unexpected "#"SOCKS 代理返回意外回复版本 %d (预期 %d)"#g' $file_name
perl -i -pe 's#\Q"reply version %d (expected %d)"#""#g' $file_name
perl -i -pe 's#\Q"SOCKS proxy failed to connect, error %d "#"SOCKS 代理连接失败，错误 %d"#g' $file_name
perl -i -pe 's#\Q"SOCKS proxy response included unknown "#"SOCKS 代理响应包括未知地址类型 %d"#g' $file_name
perl -i -pe 's#\Q"address type %d"#""#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# proxy/sshproxy.c
file_name="proxy/sshproxy.c"
echo [26%]开始汉化 proxy/sshproxy.c
perl -i -pe 's#\Q"Log file \"%s\" already exists; logging cancelled"#"日志文件“%s”已经存在；记录已取消"#g' $file_name
perl -i -pe 's#\Q"Logging error: %s"#"记录错误：%s"#g' $file_name
perl -i -pe 's#\Q"Unable to provide interactive authentication "#"无法提供代理 SSH 连接请求的交互式身份验证"#g' $file_name
perl -i -pe 's#\Q"requested by proxy SSH connection"#""#g' $file_name
perl -i -pe 's#\Q"Noninteractive SSH proxy cannot perform "#"非交互式 SSH 代理无法执行交互式身份验证"#g' $file_name
perl -i -pe 's#\Q"interactive authentication"#""#g' $file_name
perl -i -pe 's#\Q"fatal error in proxy SSH connection: %s"#"代理 SSH 连接中的致命错误: %s"#g' $file_name
perl -i -pe 's#\Q"Noninteractive SSH proxy cannot confirm host key"#"非交互式 SSH 代理无法确认主机密钥"#g' $file_name
perl -i -pe 's#\Q"First %s supported by server is %s, below warning "#"服务器支持的第一个 %s 是 %s，"#g' $file_name
perl -i -pe 's#\Q"threshold. Abandoning proxy SSH connection."#"低于警告阈值。放弃代理 SSH 连接。"#g' $file_name
perl -i -pe 's#\Q"Noninteractive SSH proxy cannot confirm "#"非交互式 SSH 代理"#g' $file_name
perl -i -pe 's#\Q"weak crypto primitive"#"无法确认弱加密原语"#g' $file_name
perl -i -pe 's#\Q"First host key type stored for server is %s, below "#"为服务器存储的第一个主机密钥类型是 %s，"#g' $file_name
perl -i -pe 's#\Q"warning threshold. Abandoning proxy SSH connection."#"低于警告阈值。放弃代理 SSH 连接。"#g' $file_name
perl -i -pe 's#\Q"Noninteractive SSH proxy cannot confirm "#"非交互式 SSH 代理"#g' $file_name
perl -i -pe 's#\Q"weak cached host key"#"无法确认弱缓存主机密钥"#g' $file_name
perl -i -pe 's#\Q"saved session '\''%s'\'' is not launchable"#"保存的会话“%s”无法启动"#g' $file_name
perl -i -pe 's#\Q"saved session '\''%s'\'' is not an SSH session"#"保存的会话“%s”不是 SSH 会话"#g' $file_name
perl -i -pe 's#\Q"Backend provides NC_HOST without SESSION_START!"#"后端提供没有 SESSION_START 的 NC_HOST！"#g' $file_name
perl -i -pe 's#\Q"unable to open SSH proxy connection: %s"#"无法打开 SSH 代理连接: %s"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# proxy/telnet.c
file_name="proxy/telnet.c"
echo [27%]开始汉化 proxy/telnet.c
perl -i -pe 's#\Q"Telnet proxy authentication"#"Telnet 代理认证"#g' $file_name
perl -i -pe 's#\Q"Proxy username: "#"代理用户名: "#g' $file_name
perl -i -pe 's#\Q"Proxy password: "#"代理密码: "#g' $file_name
perl -i -pe 's#\Q"Sending Telnet proxy command: "#"发送 Telnet 代理命令: "#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# ssh/agentf.c
file_name="ssh/agentf.c"
echo [28%]开始汉化 ssh/agentf.c
perl -i -pe 's#\Q"Agent-forwarding connection closed"#"代理转发连接关闭"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# ssh/bpp1.c
file_name="ssh/bpp1.c"
echo [29%]开始汉化 ssh/bpp1.c
perl -i -pe 's#\Q"Initialised %s encryption"#"初始化 %s 加密"#g' $file_name
perl -i -pe 's#\Q"Started zlib (RFC1950) compression"#"开始 zlib (RFC1950) 压缩"#g' $file_name
perl -i -pe 's#\Q"Out-of-range packet length from remote suggests"#"来自远程的超出范围的数据包长度表明数据流损坏"#g' $file_name
perl -i -pe 's#\Q" data stream corruption"#""#g' $file_name
perl -i -pe 's#\Q"Network attack (CRC compensation) detected!"#"检测到网络攻击（CRC 补偿）!"#g' $file_name
perl -i -pe 's#\Q"Incorrect CRC received on packet"#"在数据包上收到不正确的 CRC"#g' $file_name
perl -i -pe 's#\Q"Zlib decompression encountered invalid data"#"zlib解压遇到无效数据"#g' $file_name
perl -i -pe 's#\Q"Remote side unexpectedly closed network connection"#"远程端意外关闭网络连接"#g' $file_name
perl -i -pe 's#\Q"Remote side closed network connection"#"远端封闭网络连接"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# ssh/bpp2.c
file_name="ssh/bpp2.c"
echo [30%]开始汉化 ssh/bpp2.c
perl -i -pe 's#\Q"Initialised %s outbound encryption"#"已初始化 %s 出站加密"#g' $file_name
perl -i -pe 's#\Q"Initialised %s outbound MAC algorithm%s%s"#"已初始化 %s 出站 MAC 算法%s%s"#g' $file_name
perl -i -pe 's#\Q"Will enable %s compression after user authentication"#"用户认证后将启用 %s 压缩"#g' $file_name
perl -i -pe 's#\Q"Initialised %s compression"#"初始化 %s 压缩"#g' $file_name
perl -i -pe 's#\Q"Initialised %s inbound encryption"#"已初始化 %s 入站加密"#g' $file_name
perl -i -pe 's#\Q"Initialised %s inbound MAC algorithm%s%s"#"已初始化 %s 入站 MAC 算法%s%s"#g' $file_name
perl -i -pe 's#\Q"Will enable %s decompression after user authentication"#"用户认证后将启用 %s 解压"#g' $file_name
perl -i -pe 's#\Q"Initialised %s decompression"#"初始化 %s 解压"#g' $file_name
perl -i -pe 's#\Q"Initialised delayed %s decompression"#"初始化延迟 %s 解压"#g' $file_name
perl -i -pe 's#\Q"Initialised delayed %s compression"#"初始化延迟 %s 压缩"#g' $file_name
perl -i -pe 's#\Q"No valid incoming packet found"#"未找到有效的传入数据包"#g' $file_name
perl -i -pe 's#\Q"Incoming packet length field was garbled"#"传入数据包长度字段乱码"#g' $file_name
perl -i -pe 's#\Q"Incorrect MAC received on packet"#"数据包上收到的 MAC 不正确"#g' $file_name
perl -i -pe 's#\Q"Incoming packet was garbled on decryption"#"传入数据包在解密时出现乱码"#g' $file_name
perl -i -pe 's#\Q"Invalid padding length on received packet"#"接收到的数据包的填充长度无效"#g' $file_name
perl -i -pe 's#\Q"Remote side sent SSH2_MSG_EXT_INFO "#"远程端发送的 SSH2_MSG_EXT_INFO 前面没有 NEWKEYS 也没有后面跟着 USERAUTH_SUCCESS"#g' $file_name
perl -i -pe 's#\Q"not either preceded by NEWKEYS or "#""#g' $file_name
perl -i -pe 's#\Q"followed by USERAUTH_SUCCESS"#""#g' $file_name
perl -i -pe 's#\Q"Remote side sent SSH2_MSG_EXT_INFO "#"远程端发送的 SSH2_MSG_EXT_INFO 不是在初始 NEWKEYS 之后立即发送的"#g' $file_name
perl -i -pe 's#\Q"that was not immediately after the "#""#g' $file_name
perl -i -pe 's#\Q"initial NEWKEYS"#""#g' $file_name
perl -i -pe 's#\Q"Remote side sent SSH2_MSG_EXT_INFO "#"远程端在 USERAUTH_SUCCESS 之后发送 SSH2_MSG_EXT_INFO"#g' $file_name
perl -i -pe 's#\Q"after USERAUTH_SUCCESS"#""#g' $file_name
perl -i -pe 's#\Q"Remote side unexpectedly closed network connection"#"远程端意外关闭网络连接"#g' $file_name
perl -i -pe 's#\Q"Remote side closed network connection"#"远端封闭网络连接"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# ssh/bpp-bare.c
file_name="ssh/bpp-bare.c"
echo [31%]开始汉化 ssh/bpp-bare.c
perl -i -pe 's#\Q"Invalid packet length received"#"收到的数据包长度无效"#g' $file_name
perl -i -pe 's#\Q"Remote side sent SSH2_MSG_EXT_INFO "#"远端以裸连接协议发送 SSH2_MSG_EXT_INFO"#g' $file_name
perl -i -pe 's#\Q"in bare connection protocol"#""#g' $file_name
perl -i -pe 's#\Q"Remote side unexpectedly closed network connection"#"远程端意外关闭网络连接"#g' $file_name
perl -i -pe 's#\Q"Remote side closed network connection"#"远端封闭网络连接"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# ssh/common.c
file_name="ssh/common.c"
echo [32%]开始汉化 ssh/common.c
perl -i -pe 's#\Q"unknown"#"未知"#g' $file_name
perl -i -pe 's#\Q"Host key not in manually configured list"#"主机密钥不在手动配置的列表中"#g' $file_name
perl -i -pe 's#\Q"Remote side sent disconnect message:\n\"%.*s\""#"远端发送断开消息：\\n\\"%.*s\\""#g' $file_name
perl -i -pe 's#\Q"Remote debug message: %.*s"#"远程调试消息：%.*s"#g' $file_name
perl -i -pe 's#\Q"User aborted at %s"#"用户在 %s 中止"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# ssh/connection1.c
file_name="ssh/connection1.c"
echo [33%]开始汉化 ssh/connection1.c
perl -i -pe 's#\Q"Received %s for %s channel %u"#"已收到 %s 频道 %u 的 %s"#g' $file_name
perl -i -pe 's#\Q"Received CHANNEL_CLOSE_CONFIRMATION for channel"#"收到频道 %u 的 CHANNEL_CLOSE_CONFIRMATION 我们从未发送过 CHANNEL_CLOSE\\n"#g' $file_name
perl -i -pe 's#\Q" %u for which we never sent CHANNEL_CLOSE\n"#""#g' $file_name
perl -i -pe 's#\Q"Access granted. Press Return to begin session. "#"授予访问权限。按 Return 开始会话。 "#g' $file_name
perl -i -pe 's#\Q"Unexpected packet received, "#"收到意外的数据包，类型 %d (%s)"#g' $file_name
perl -i -pe 's#\Q"type %d (%s)"#""#g' $file_name
perl -i -pe 's#\Q"Session finished"#"会话结束"#g' $file_name
perl -i -pe 's#\Q"due to local error: %s"#"由于本地错误：%s"#g' $file_name
perl -i -pe 's#\Q"Opening connection to %s:%d for %s"#"为 %s 打开与 %s:%d 的连接"#g' $file_name
perl -i -pe 's#\Q"Authentication successful"#"认证成功"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# ssh/connection1-client.c
file_name="ssh/connection1-client.c"
echo [34%]开始汉化 ssh/connection1-client.c
perl -i -pe 's#\Q"Received %s with no outstanding request"#"收到 %s 没有未完成的请求"#g' $file_name
perl -i -pe 's#\Q"Rejected X11 connect request"#"拒绝 X11 连接请求"#g' $file_name
perl -i -pe 's#\Q"Opened X11 forward channel"#"打开 X11 正向通道"#g' $file_name
perl -i -pe 's#\Q"Rejected remote port open request for %s:%d"#"拒绝 %s 的远程端口打开请求:%d"#g' $file_name
perl -i -pe 's#\Q"Port open failed: %s"#"端口打开失败：%s"#g' $file_name
perl -i -pe 's#\Q"Forwarded port opened successfully"#"转发端口打开成功"#g' $file_name
perl -i -pe 's#\Q"Server sent command exit status %d"#"服务器发送命令退出状态 %d"#g' $file_name
perl -i -pe 's#\Q"Remote port forwarding from %s enabled"#"已启用来自 %s 的远程端口转发"#g' $file_name
perl -i -pe 's#\Q"Remote port forwarding from %s refused"#"来自 %s 的远程端口转发被拒绝"#g' $file_name
perl -i -pe 's#\Q"Should never be called in the client"#"永远不应该在客户端调用"#g' $file_name
perl -i -pe 's#\Q"Received remote port open request for %s:%d"#"收到 %s 的远程端口打开请求:%d"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# ssh/connection1-server.c
file_name="ssh/connection1-server.c"
echo [35%]开始汉化 ssh/connection1-server.c
perl -i -pe 's#\Q"Client requested a shell"#"客户请求一个shell"#g' $file_name
perl -i -pe 's#\Q"Client sent command '\''%.*s'\''"#"客户端发送命令 '\''%.*s'\''"#g' $file_name
perl -i -pe 's#\Q"Unable to decode pty request packet"#"无法解码 pty 请求数据包"#g' $file_name
perl -i -pe 's#\Q"Unable to allocate a pty"#"无法分配 pty"#g' $file_name
perl -i -pe 's#\Q"Client requested port %d forward to %.*s:%d"#"客户端请求端口 %d 转发到 %.*s:%d"#g' $file_name
perl -i -pe 's#\Q"Received request to connect to port %s:%d"#"收到连接到端口 %s 的请求:%d"#g' $file_name
perl -i -pe 's#\Q"Port open failed: %s"#"端口打开失败：%s"#g' $file_name
perl -i -pe 's#\Q"Forwarded port opened successfully"#"转发端口打开成功"#g' $file_name
perl -i -pe 's#\Q"Received SSH1_CMSG_EXIT_CONFIRMATION"#"在未发送 SSH1_SMSG_EXIT_STATUS 的情况下收到 SSH1_CMSG_EXIT_CONFIRMATION"#g' $file_name
perl -i -pe 's#\Q" without having sent SSH1_SMSG_EXIT_STATUS"#""#g' $file_name
perl -i -pe 's#\Q"Client sent exit confirmation"#"客户发送退出确认"#g' $file_name
perl -i -pe 's#\Q"Received unexpected setup packet after the "#"在设置阶段后收到意外的设置数据包，键入 %d (%s)"#g' $file_name
perl -i -pe 's#\Q"setup phase, type %d (%s)"#""#g' $file_name
perl -i -pe 's#\Q"Should never be called in the server"#"永远不应该在服务器中调用"#g' $file_name
perl -i -pe 's#\Q"Forwarding X11 connection to client"#"将 X11 连接转发给客户端"#g' $file_name
perl -i -pe 's#\Q"Forwarding agent connection to client"#"将代理连接转发到客户端"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# ssh/connection2.c
file_name="ssh/connection2.c"
echo [36%]开始汉化 ssh/connection2.c
perl -i -pe 's#\Q"Received %s with no outstanding global request"#"收到 %s 没有未完成的全局请求"#g' $file_name
perl -i -pe 's#\Q"Rejected channel open: %s"#"拒绝通道打开: %s"#g' $file_name
perl -i -pe 's#\Q"Received %s for %s channel %u"#"已收到 %s 频道 %u 的 %s"#g' $file_name
perl -i -pe 's#\Q"Received %s for channel %d with no outstanding "#"收到频道 %d 的 %s，没有未完成的频道请求"#g' $file_name
perl -i -pe 's#\Q"Unable to decode terminal mode string"#"无法解码终端模式字符串"#g' $file_name
perl -i -pe 's#\Q"channel request"#""#g' $file_name
perl -i -pe 's#\Q"Received unexpected connection-layer "#"收到意外的连接层数据包，类型 %d (%s)"#g' $file_name
perl -i -pe 's#\Q"packet, type %d (%s)"#""#g' $file_name
perl -i -pe 's#\Q"Administratively prohibited"#"行政禁止"#g' $file_name
perl -i -pe 's#\Q"Connect failed"#"连接失败"#g' $file_name
perl -i -pe 's#\Q"Unknown channel type"#"未知频道类型"#g' $file_name
perl -i -pe 's#\Q"Resource shortage"#"资源短缺"#g' $file_name
perl -i -pe 's#\Q"unknown reason code %\#x"#"未知原因代码 %\#x"#g' $file_name
perl -i -pe 's#\Q"Authentication successful"#"认证成功"#g' $file_name
perl -i -pe 's#\Q"Access granted. Press Return to begin session. "#"授予访问权限。按 Return 开始会话。"#g' $file_name
perl -i -pe 's#\Q"All channels closed"#"所有频道关闭"#g' $file_name
perl -i -pe 's#\Q"due to local error: %s"#"由于本地错误：%s"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# ssh/connection2-client.c
file_name="ssh/connection2-client.c"
echo [37%]开始汉化 ssh/connection2-client.c
perl -i -pe 's#\Q"Received X11 connect request from %.*s:%d"#"收到来自 %.*s:%d 的 X11 连接请求"#g' $file_name
perl -i -pe 's#\Q"X11 forwarding is not enabled"#"X11 转发未启用"#g' $file_name
perl -i -pe 's#\Q"Opened X11 forward channel"#"打开 X11 正向通道"#g' $file_name
perl -i -pe 's#\Q"Received remote port %.*s:%d open request from %.*s:%d"#"收到来自 %.*s:%d 的远程端口 %.*s:%d 打开请求"#g' $file_name
perl -i -pe 's#\Q"Remote port is not recognised"#"无法识别远程端口"#g' $file_name
perl -i -pe 's#\Q"Attempting to forward remote port to %s:%d"#"正在尝试将远程端口转发到 %s:%d"#g' $file_name
perl -i -pe 's#\Q"Port open failed: %s"#"端口打开失败：%s"#g' $file_name
perl -i -pe 's#\Q"Port open failed"#"端口打开失败"#g' $file_name
perl -i -pe 's#\Q"Forwarded port opened successfully"#"转发端口打开成功"#g' $file_name
perl -i -pe 's#\Q"Agent forwarding is not enabled"#"未启用代理转发"#g' $file_name
perl -i -pe 's#\Q"Unsupported channel type requested"#"请求的频道类型不受支持"#g' $file_name
perl -i -pe 's#\Q"Opening connection to %s:%d for %s"#"为 %s 打开与 %s:%d 的连接"#g' $file_name
perl -i -pe 's#\Q"Remote port forwarding from %s enabled"#"已启用来自 %s 的远程端口转发"#g' $file_name
perl -i -pe 's#\Q"Remote port forwarding from %s refused"#"来自 %s 的远程端口转发被拒绝"#g' $file_name
perl -i -pe 's#\Q"Opening main session channel"#"打开主会话通道"#g' $file_name
perl -i -pe 's#\Q"Should never be called in the client"#"永远不应该在客户端调用"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# ssh/connection2-server.c
file_name="ssh/connection2-server.c"
echo [38%]开始汉化 ssh/connection2-server.c
perl -i -pe 's#\Q"Opened session channel"#"打开会话通道"#g' $file_name
perl -i -pe 's#\Q"Received request to connect to port %s:%d (from %.*s:%d)"#"收到连接到端口 %s:%d 的请求（来自 %.*s:%d）"#g' $file_name
perl -i -pe 's#\Q"Port open failed: %s"#"端口打开失败：%s"#g' $file_name
perl -i -pe 's#\Q"Port opened successfully"#"端口打开成功"#g' $file_name
perl -i -pe 's#\Q"Connection failed"#"连接失败"#g' $file_name
perl -i -pe 's#\Q"Unsupported channel type requested"#"请求的频道类型不受支持"#g' $file_name
perl -i -pe 's#\Q"Forwarding connection to listening port %s:%d from %s"#"将连接转发到侦听端口 %s:%d 从 %s"#g' $file_name
perl -i -pe 's#\Q"Forwarding connection to listening port %s:%d"#"将连接转发到侦听端口 %s:%d"#g' $file_name
perl -i -pe 's#\Q"Should never be called in the server"#"永远不应该在服务器中调用"#g' $file_name
perl -i -pe 's#\Q"Forwarding X11 channel to client"#"将 X11 频道转发给客户端"#g' $file_name
perl -i -pe 's#\Q"Forwarding SSH agent to client"#"将 SSH 代理转发到客户端"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# ssh/kex2-client.c
file_name="ssh/kex2-client.c"
echo [39%]开始汉化 ssh/kex2-client.c
perl -i -pe 's#\Q"Doing Diffie-Hellman group exchange"#"进行 Diffie-Hellman 群交换"#g' $file_name
perl -i -pe 's#\Q"Received unexpected packet when "#"收到意外的数据包时"#g' $file_name
perl -i -pe 's#\Q"expecting Diffie-Hellman group, type %d (%s)"#"期待 Diffie-Hellman 组，类型 %d (%s)"#g' $file_name
perl -i -pe 's#\Q"Unable to parse Diffie-Hellman group packet"#"无法解析 Diffie-Hellman 组数据包"#g' $file_name
perl -i -pe 's#\Q"Doing Diffie-Hellman key exchange using %d-bit "#"使用 %d 位模数和散列 %s 与服务器提供的组进行 Diffie-Hellman 密钥交换"#g' $file_name
perl -i -pe 's#\Q"modulus and hash %s with a server-supplied group"#""#g' $file_name
perl -i -pe 's#\Q"Doing Diffie-Hellman key exchange using %d-bit "#"使用 %d 位进行 Diffie-Hellman 密钥交换"#g' $file_name
perl -i -pe 's#\Q"modulus and hash %s with standard group \"%s\""#"标准组 \\"%s\\" 的模数和散列 %s"#g' $file_name
perl -i -pe 's#\Q"expecting Diffie-Hellman reply, type %d (%s)"#"期待 Diffie-Hellman 回复，键入 %d (%s)"#g' $file_name
perl -i -pe 's#\Q"Unable to parse Diffie-Hellman reply packet"#"无法解析 Diffie-Hellman 回复数据包"#g' $file_name
perl -i -pe 's#\Q"Diffie-Hellman reply failed "#"Diffie-Hellman 回复失败"#g' $file_name
perl -i -pe 's#\Q"validation: %s"#"验证：%s"#g' $file_name
perl -i -pe 's#\Q"Doing ECDH key exchange with curve %s and hash %s"#"使用曲线 %s 和散列 %s 进行 ECDH 密钥交换"#g' $file_name
perl -i -pe 's#\Q"Unable to generate key for ECDH"#"无法为 ECDH 生成密钥"#g' $file_name
perl -i -pe 's#\Q"expecting ECDH reply, type %d (%s)"#"期待 ECDH 回复，类型 %d (%s)"#g' $file_name
perl -i -pe 's#\Q"Received invalid elliptic curve "#"收到无效的椭圆曲线"#g' $file_name
perl -i -pe 's#\Q"point in ECDH reply"#"指向 ECDH 回复"#g' $file_name
perl -i -pe 's#\Q"Unable to parse ECDH reply packet"#"无法解析 ECDH 回复数据包"#g' $file_name
perl -i -pe 's#\Q"Doing GSSAPI (with Kerberos V5) Diffie-Hellman "#"执行 GSSAPI（使用 Kerberos V5）Diffie-Hellman 组交换，最少 %d 位"#g' $file_name
perl -i -pe 's#\Q"group exchange, with minimum %d bits"#""#g' $file_name
perl -i -pe 's#\Q"Using GSSAPI (with Kerberos V5) Diffie-Hellman with"#"使用带有标准组 \\"%s\\" 的 GSSAPI（与 Kerberos V5）Diffie-Hellman"#g' $file_name
perl -i -pe 's#\Q" standard group \"%s\""#""#g' $file_name
perl -i -pe 's#\Q"Doing GSSAPI (with Kerberos V5) Diffie-Hellman key "#"使用散列 %s 进行 GSSAPI（使用 Kerberos V5）Diffie-Hellman 密钥交换"#g' $file_name
perl -i -pe 's#\Q"exchange with hash %s"#""#g' $file_name
perl -i -pe 's#\Q"GSSAPI key exchange failed to initialise"#"GSSAPI 密钥交换初始化失败"#g' $file_name
perl -i -pe 's#\Q"GSSAPI key exchange failed: "#"GSSAPI 密钥交换失败："#g' $file_name
perl -i -pe 's#\Q"no initial context token"#"没有初始上下文令牌"#g' $file_name
perl -i -pe 's#\Q"GSSAPI key exchange initialised"#"GSSAPI 密钥交换已初始化"#g' $file_name
perl -i -pe 's#\Q"GSSAPI key exchange failed; "#"GSSAPI 密钥交换失败；"#g' $file_name
perl -i -pe 's#\Q"server'\''s message: %.*s"#"服务器消息：%.*s"#g' $file_name
perl -i -pe 's#\Q"Received unexpected packet "#"收到意外的数据包"#g' $file_name
perl -i -pe 's#\Q"during GSSAPI key exchange, type %d (%s)"#"在 GSSAPI 密钥交换期间，键入 %d (%s)"#g' $file_name
perl -i -pe 's#\Q"GSSAPI reply failed "#"GSSAPI 回复失败"#g' $file_name
perl -i -pe 's#\Q"Doing RSA key exchange with hash %s"#"使用哈希 %s 进行 RSA 密钥交换"#g' $file_name
perl -i -pe 's#\Q"expecting RSA public key, type %d (%s)"#"需要 RSA 公钥，键入 %d (%s)"#g' $file_name
perl -i -pe 's#\Q"Unable to parse RSA public key packet"#"无法解析 RSA 公钥数据包"#g' $file_name
perl -i -pe 's#\Q"Server sent %d-bit RSA key, "#"服务器发送了 %d 位 RSA 密钥，小于 %s 密钥交换的最小大小 %d"#g' $file_name
perl -i -pe 's#\Q"less than the minimum size %d for %s "#""#g' $file_name
perl -i -pe 's#\Q"key exchange"#""#g' $file_name
perl -i -pe 's#\Q"expecting RSA kex signature, type %d (%s)"#"期待 RSA kex 签名，类型 %d (%s)"#g' $file_name
perl -i -pe 's#\Q"Unable to parse RSA kex signature"#"无法解析 RSA kex 签名"#g' $file_name
perl -i -pe 's#\Q"GSSAPI key exchange MIC was "#"GSSAPI 密钥交换 MIC"#g' $file_name
perl -i -pe 's#\Q"not valid: %s"#"无效：%s"#g' $file_name
perl -i -pe 's#\Q"not valid"#"无效"#g' $file_name
perl -i -pe 's#\Q"GSSAPI Key Exchange complete!"#"GSSAPI 密钥交换完成！"#g' $file_name
perl -i -pe 's#\Q"Server'\''s host key is invalid"#"服务器的主机密钥无效"#g' $file_name
perl -i -pe 's#\Q"Signature from server'\''s host key "#"服务器主机密钥的签名"#g' $file_name
perl -i -pe 's#\Q"is invalid"#"无效"#g' $file_name
perl -i -pe 's#\Q"GSS kex provided fallback host key:"#"GSS kex 提供后备主机密钥："#g' $file_name
perl -i -pe 's#\Q"No fallback host key available"#"没有可用的备用主机密钥"#g' $file_name
perl -i -pe 's#\Q"Post-GSS rekey provided fallback host key:"#"GSS 更新后提供的备用主机密钥："#g' $file_name
perl -i -pe 's#\Q"Non-GSS rekey after initial GSS kex "#"初始 GSS kex 使用主机密钥后的非 GSS 重新生成密钥："#g' $file_name
perl -i -pe 's#\Q"used host key:"#""#g' $file_name
perl -i -pe 's#\Q"Server'\''s host key did not match any "#"服务器的主机密钥与以前的 GSS kex 中使用的任何密钥都不匹配"#g' $file_name
perl -i -pe 's#\Q"used in previous GSS kex"#""#g' $file_name
perl -i -pe 's#\Q"Server also has %s host key%s, but we "#"服务器也有 %s 主机密钥%s，但我们不知道 %s"#g' $file_name
perl -i -pe 's#\Q"don'\''t know %s"#""#g' $file_name
perl -i -pe 's#\Q"Host key fingerprint is:"#"主机密钥指纹为："#g' $file_name
perl -i -pe 's#\Q"Host key did not appear in manually "#"主机密钥未出现在手动配置的列表中"#g' $file_name
perl -i -pe 's#\Q"configured list"#""#g' $file_name
perl -i -pe 's#\Q"User aborted at host key verification"#"用户在主机密钥验证时中止"#g' $file_name
perl -i -pe 's#\Q"Storing additional host key for this host:"#"为该主机存储额外的主机密钥："#g' $file_name
perl -i -pe 's#\Q"Host key was different in repeat key exchange"#"重复密钥交换中的主机密钥不同"#g' $file_name
perl -i -pe 's#\Q"GSSAPI key exchange failed to initialise "#"GSSAPI 密钥交换未能初始化上下文：%s"#g' $file_name
perl -i -pe 's#\Q"context: %s"#""#g' $file_name
perl -i -pe 's#\Q"host key verification"#"主机密钥验证"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# ssh/kex2-server.c
file_name="ssh/kex2-server.c"
echo [40%]开始汉化 ssh/kex2-server.c
perl -i -pe 's#\Q"Doing Diffie-Hellman group exchange"#"进行 Diffie-Hellman 群交换"#g' $file_name
perl -i -pe 's#\Q"Received unexpected packet when "#"收到意外的数据包"#g' $file_name
perl -i -pe 's#\Q"expecting Diffie-Hellman group exchange "#"期待 Diffie-Hellman 组交换请求，类型 %d (%s)"#g' $file_name
perl -i -pe 's#\Q"request, type %d (%s)"#""#g' $file_name
perl -i -pe 's#\Q"Using Diffie-Hellman with standard group \"%s\""#"将 Diffie-Hellman 与标准组 \\"%s\\" 一起使用"#g' $file_name
perl -i -pe 's#\Q"Doing Diffie-Hellman key exchange with hash %s"#"使用哈希 %s 进行 Diffie-Hellman 密钥交换"#g' $file_name
perl -i -pe 's#\Q"expecting Diffie-Hellman initial packet, "#"期待 Diffie-Hellman 初始数据包，"#g' $file_name
perl -i -pe 's#\Q"type %d (%s)"#"类型 %d (%s)"#g' $file_name
perl -i -pe 's#\Q"Unable to parse Diffie-Hellman initial packet"#"无法解析 Diffie-Hellman 初始数据包"#g' $file_name
perl -i -pe 's#\Q"Diffie-Hellman initial packet "#"Diffie-Hellman 初始数据包"#g' $file_name
perl -i -pe 's#\Q"failed validation: %s"#"验证失败: %s"#g' $file_name
perl -i -pe 's#\Q"Doing ECDH key exchange with curve %s and hash %s"#"使用曲线 %s 和散列 %s 进行 ECDH 密钥交换"#g' $file_name
perl -i -pe 's#\Q"Unable to generate key for ECDH"#"无法为 ECDH 生成密钥"#g' $file_name
perl -i -pe 's#\Q"expecting ECDH initial packet, type %d (%s)"#"期待 ECDH 初始数据包，类型 %d (%s)"#g' $file_name
perl -i -pe 's#\Q"Received invalid elliptic curve "#"收到无效的椭圆曲线"#g' $file_name
perl -i -pe 's#\Q"point in ECDH initial packet"#"ECDH 初始数据包中的点"#g' $file_name
perl -i -pe 's#\Q"GSS key exchange not supported in server"#"服务器不支持 GSS 密钥交换"#g' $file_name
perl -i -pe 's#\Q"Doing RSA key exchange with hash %s"#"使用哈希 %s 进行 RSA 密钥交换"#g' $file_name
perl -i -pe 's#\Q"Using configured %d-bit RSA key"#"使用配置的 %d 位 RSA 密钥"#g' $file_name
perl -i -pe 's#\Q"Configured %d-bit RSA key is too short (min %d)"#"配置的 %d 位 RSA 密钥太短（最少 %d）"#g' $file_name
perl -i -pe 's#\Q"Generating a %d-bit RSA key"#"生成 %d 位 RSA 密钥"#g' $file_name
perl -i -pe 's#\Q"expecting RSA kex secret, type %d (%s)"#"期待 RSA kex 密码，键入 %d (%s)"#g' $file_name
perl -i -pe 's#\Q"Unable to decrypt RSA kex secret"#"无法解密 RSA kex 密钥"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# ssh/login1.c
file_name="ssh/login1.c"
echo [41%]开始汉化 ssh/login1.c
perl -i -pe 's#\Q"Public key packet not received"#"未收到公钥包"#g' $file_name
perl -i -pe 's#\Q"Received public keys"#"收到公钥"#g' $file_name
perl -i -pe 's#\Q"Host key fingerprint is:"#"主机密钥指纹为："#g' $file_name
perl -i -pe 's#\Q"Bad SSH-1 public key packet"#"错误的 SSH-1 公钥数据包"#g' $file_name
perl -i -pe 's#\Q"SSH-1 public keys were badly formatted"#"SSH-1 公钥格式错误"#g' $file_name
perl -i -pe 's#\Q"Host key did not appear in manually "#"主机密钥未出现在手动配置的列表中"#g' $file_name
perl -i -pe 's#\Q"configured list"#""#g' $file_name
perl -i -pe 's#\Q"User aborted at host key verification"#"用户在主机密钥验证时中止"#g' $file_name
perl -i -pe 's#\Q"SSH-1 public key encryptions failed "#"由于格式错误，SSH-1 公钥加密失败"#g' $file_name
perl -i -pe 's#\Q"due to bad formatting"#""#g' $file_name
perl -i -pe 's#\Q"Encrypted session key"#"加密会话密钥"#g' $file_name
perl -i -pe 's#\Q"AES not supported in SSH-1, skipping"#"SSH-1 不支持 AES，跳过"#g' $file_name
perl -i -pe 's#\Q"Server violates SSH-1 protocol "#"服务器不支持 3DES 加密违反了 SSH-1 协议"#g' $file_name
perl -i -pe 's#\Q"by not supporting 3DES encryption"#""#g' $file_name
perl -i -pe 's#\Q"No supported ciphers found"#"未找到支持的密码"#g' $file_name
perl -i -pe 's#\Q"User aborted at cipher warning"#"用户在密码警告中中止"#g' $file_name
perl -i -pe 's#\Q"Using 3DES encryption"#"使用 3DES 加密"#g' $file_name
perl -i -pe 's#\Q"Using single-DES encryption"#"使用单 DES 加密"#g' $file_name
perl -i -pe 's#\Q"Using Blowfish encryption"#"使用 Blowfish 加密"#g' $file_name
perl -i -pe 's#\Q"Trying to enable encryption..."#"正在尝试启用加密..."#g' $file_name
perl -i -pe 's#\Q"Encryption not successfully enabled"#"未成功启用加密"#g' $file_name
perl -i -pe 's#\Q"Successfully started encryption"#"成功开始加密"#g' $file_name
perl -i -pe 's#\Q"SSH login name"#"SSH 登录名"#g' $file_name
perl -i -pe 's#\Q"No username provided"#"未提供用户名"#g' $file_name
perl -i -pe 's#\Q"Sent username \"%s\""#"发送用户名\\"%s\\""#g' $file_name
perl -i -pe 's#\Q"Sent username \"%s\"\r\n"#"发送用户名 \\"%s\\"\\r\\n"#g' $file_name
perl -i -pe 's#\Q"Reading key file \"%s\""#"读取密钥文件\\"%s\\""#g' $file_name
perl -i -pe 's#\Q"Key file contains public key only"#"密钥文件仅包含公钥"#g' $file_name
perl -i -pe 's#\Q"Unable to load key (%s)"#"无法加载密钥 (%s)"#g' $file_name
perl -i -pe 's#\Q"Unable to load key file \"%s\" (%s)\r\n"#"无法加载密钥文件 \\"%s\\" (%s)\\r\\n"#g' $file_name
perl -i -pe 's#\Q"Unable to use this key file (%s)"#"无法使用此密钥文件 (%s)"#g' $file_name
perl -i -pe 's#\Q"Unable to use key file \"%s\" (%s)\r\n"#"无法使用密钥文件 \\"%s\\" (%s)\\r\\n"#g' $file_name
perl -i -pe 's#\Q"Pageant is running. Requesting keys."#"Pageant正在运行。请求密钥."#g' $file_name
perl -i -pe 's#\Q"Pageant'\''s response was truncated"#"Pageant 的回复被截断了"#g' $file_name
perl -i -pe 's#\Q"Configured key file not in Pageant"#"配置的密钥文件不在Pageant中"#g' $file_name
perl -i -pe 's#\Q"Failed to get reply from Pageant"#"未能得到Pageant的回复"#g' $file_name
perl -i -pe 's#\Q"Key refused"#"钥匙被拒绝"#g' $file_name
perl -i -pe 's#\Q"Received RSA challenge"#"收到 RSA 质询"#g' $file_name
perl -i -pe 's#\Q"Server'\''s RSA challenge "#"服务器的 RSA 质询格式错误"#g' $file_name
perl -i -pe 's#\Q"was badly formatted"#""#g' $file_name
perl -i -pe 's#\Q"Sending Pageant'\''s response"#"发送Pageant的回应"#g' $file_name
perl -i -pe 's#\Q"Pageant'\''s response "#"Pageant的回应被接受"#g' $file_name
perl -i -pe 's#\Q"accepted"#""#g' $file_name
perl -i -pe 's#\Q"Authenticated using RSA "#"使用来自代理的 RSA 密钥 \\"%.*s\\" 进行身份验证\\r\\n"#g' $file_name
perl -i -pe 's#\Q"key \"%.*s\" from "#""#g' $file_name
perl -i -pe 's#\Q"agent\r\n"#""#g' $file_name
perl -i -pe 's#\Q"Pageant'\''s response not "#"Pageant的回应不被接受"#g' $file_name
perl -i -pe 's#\Q"Pageant failed to answer "#"Pageant未能回答"#g' $file_name
perl -i -pe 's#\Q"challenge"#""#g' $file_name
perl -i -pe 's#\Q"No reply received from Pageant"#"没有收到Pageant的回复"#g' $file_name
perl -i -pe 's#\Q"Trying public key authentication.\r\n"#"尝试公钥认证。\\r\\n"#g' $file_name
perl -i -pe 's#\Q"Trying public key \"%s\""#"尝试公钥 \\"%s\\""#g' $file_name
perl -i -pe 's#\Q"No passphrase required.\r\n"#"无需密码。\\r\\n"#g' $file_name
perl -i -pe 's#\Q"Passphrase for key \"%s\": "#"密钥 \\"%s\\" 的密码： "#g' $file_name
perl -i -pe 's#\Q"User aborted at passphrase prompt"#"用户在密码提示时中止"#g' $file_name
perl -i -pe 's#\Q"Couldn'\''t load private key from %s (%s).\r\n"#"无法从 %s (%s) 加载私钥。\\r\\n"#g' $file_name
perl -i -pe 's#\Q"Wrong passphrase.\r\n"#"密码错误.\\r\\n"#g' $file_name
perl -i -pe 's#\Q"unexpected return from rsa1_load_f()"#"从 rsa1_load_f() 意外返回"#g' $file_name
perl -i -pe 's#\Q"Server refused our public key.\r\n"#"服务器拒绝了我们的公钥。\\r\\n"#g' $file_name
perl -i -pe 's#\Q"Received unexpected packet"#"收到意外的数据包以响应提供的公钥，类型 %d (%s)"#g' $file_name
perl -i -pe 's#\Q" in response to offer of public key, "#""#g' $file_name
perl -i -pe 's#\Q"type %d (%s)"#""#g' $file_name
perl -i -pe 's#\Q"Server'\''s RSA challenge "#"服务器的 RSA 质询格式错误"#g' $file_name
perl -i -pe 's#\Q"was badly formatted"#""#g' $file_name
perl -i -pe 's#\Q"Failed to authenticate with"#"无法使用我们的公钥进行身份验证。\\r\\n"#g' $file_name
perl -i -pe 's#\Q" our public key.\r\n"#""#g' $file_name
perl -i -pe 's#\Q"Received unexpected packet"#"收到意外的数据包以响应 RSA 身份验证，类型 %d (%s)"#g' $file_name
perl -i -pe 's#\Q" in response to RSA authentication, "#""#g' $file_name
perl -i -pe 's#\Q"type %d (%s)"#""#g' $file_name
perl -i -pe 's#\Q"Requested TIS authentication"#"请求的 TIS 身份验证"#g' $file_name
perl -i -pe 's#\Q"TIS authentication refused.\r\n"#"TIS 身份验证被拒绝。\\r\\n"#g' $file_name
perl -i -pe 's#\Q"TIS challenge packet was "#"TIS 质询数据包格式不正确"#g' $file_name
perl -i -pe 's#\Q"badly formed"#""#g' $file_name
perl -i -pe 's#\Q"Requested CryptoCard authentication"#"请求的 CryptoCard 身份验证"#g' $file_name
perl -i -pe 's#\Q"CryptoCard authentication declined"#"CryptoCard 身份验证被拒绝"#g' $file_name
perl -i -pe 's#\Q"CryptoCard authentication refused.\r\n"#"CryptoCard 身份验证被拒绝。\\r\\n"#g' $file_name
perl -i -pe 's#\Q"CryptoCard challenge packet "#"CryptoCard 质询数据包格式不正确"#g' $file_name
perl -i -pe 's#\Q"was badly formed"#""#g' $file_name
perl -i -pe 's#\Q"SSH CryptoCard authentication"#"SSH CryptoCard 身份验证"#g' $file_name
perl -i -pe 's#\Q"CryptoCard authentication response:"#"CryptoCard 身份验证响应："#g' $file_name
perl -i -pe 's#\Q"Received unexpected packet"#"收到响应 TIS 身份验证的意外数据包，类型 %d (%s)"#g' $file_name
perl -i -pe 's#\Q" in response to TIS authentication, "#""#g' $file_name
perl -i -pe 's#\Q"type %d (%s)"#""#g' $file_name
perl -i -pe 's#\Q"No supported authentication methods "#"没有可用的受支持的身份验证方法"#g' $file_name
perl -i -pe 's#\Q"available"#""#g' $file_name
perl -i -pe 's#\Q"%s@%s'\''s password:"#"%s@%s 的密码："#g' $file_name
perl -i -pe 's#\Q"User aborted at password prompt"#"用户在密码提示时中止"#g' $file_name
perl -i -pe 's#\Q"Sending password with camouflage packets"#"使用伪装包发送密码"#g' $file_name
perl -i -pe 's#\Q"Sending length-padded password"#"发送加长密码"#g' $file_name
perl -i -pe 's#\Q"Sending unpadded password"#"发送未填充的密码"#g' $file_name
perl -i -pe 's#\Q"Sent password"#"发送密码"#g' $file_name
perl -i -pe 's#\Q"Access denied\r\n"#"访问被拒绝\\r\\n"#g' $file_name
perl -i -pe 's#\Q"Authentication refused"#"身份验证被拒绝"#g' $file_name
perl -i -pe 's#\Q"Received unexpected packet"#"收到响应密码验证的意外数据包，类型 %d (%s)"#g' $file_name
perl -i -pe 's#\Q" in response to password authentication, type %d "#""#g' $file_name
perl -i -pe 's#\Q"(%s)"#""#g' $file_name
perl -i -pe 's#\Q"Authentication was trivial! "#"身份验证很简单！放弃配置中指定的会话。"#g' $file_name
perl -i -pe 's#\Q"Abandoning session as specified in configuration."#""#g' $file_name
perl -i -pe 's#\Q"Authentication successful"#"认证成功"#g' $file_name
perl -i -pe 's#\Q"Requesting compression"#"请求压缩"#g' $file_name
perl -i -pe 's#\Q"Server refused to enable compression"#"服务器拒绝启用压缩"#g' $file_name
perl -i -pe 's#\Q"Server refused to compress\r\n"#"服务器拒绝压缩\\r\\n"#g' $file_name
perl -i -pe 's#\Q"Received unexpected packet"#"收到响应压缩请求的意外数据包，类型 %d (%s)"#g' $file_name
perl -i -pe 's#\Q" in response to compression request, type %d "#""#g' $file_name
perl -i -pe 's#\Q"host key verification"#"主机密钥验证"#g' $file_name
perl -i -pe 's#\Q"cipher warning"#"密码警告"#g' $file_name
perl -i -pe 's#\Q"username prompt"#"用户名提示"#g' $file_name
perl -i -pe 's#\Q"Pageant has "#"Pageant 有 "#g' $file_name
perl -i -pe 's#\Q" SSH-1 keys"#" SSH-1 密钥"#g' $file_name
perl -i -pe 's#\Q"Pageant key \#%"#"Pageant 密钥 \#%"#g' $file_name
perl -i -pe 's#\Q" matches "#" 匹配 "#g' $file_name
perl -i -pe 's#\Q"configured key file"#"配置的密钥文件"#g' $file_name
perl -i -pe 's#\Q"Trying Pageant key \#%"#"尝试 Pageant 密钥 \#%"#g' $file_name
perl -i -pe 's#\Q"SSH key passphrase"#"SSH 密钥密码"#g' $file_name
perl -i -pe 's#\Q"passphrase prompt"#"密码提示"#g' $file_name
perl -i -pe 's#\Q"TIS authentication declined"#"TIS 身份验证被拒绝"#g' $file_name
perl -i -pe 's#\Q"Received TIS challenge"#"收到 TIS 质询"#g' $file_name
perl -i -pe 's#\Q"SSH TIS authentication"#"SSH TIS 认证"#g' $file_name
perl -i -pe 's#\Q"TIS authentication response: "#"TIS 认证响应："#g' $file_name
perl -i -pe 's#\Q"Received CryptoCard challenge"#"收到 CryptoCard 质询"#g' $file_name
perl -i -pe 's#\Q"CryptoCard authentication response: "#"CryptoCard 身份验证响应："#g' $file_name
perl -i -pe 's#\Q"SSH password"#"SSH 密码"#g' $file_name
perl -i -pe 's#\Q"password prompt"#"密码提示"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# ssh/login1-server.c
file_name="ssh/login1-server.c"
echo [42%]开始汉化 ssh/login1-server.c
perl -i -pe 's#\Q"Received unexpected packet in response"#"收到响应初始公钥数据包的意外数据包，类型 %d (%s)"#g' $file_name
perl -i -pe 's#\Q" to initial public key packet, type %d (%s)"#""#g' $file_name
perl -i -pe 's#\Q"Unable to parse session key packet"#"无法解析会话密钥数据包"#g' $file_name
perl -i -pe 's#\Q"Client sent incorrect anti-spoofing cookie"#"客户端发送了错误的反欺骗 cookie"#g' $file_name
perl -i -pe 's#\Q"Client selected an unsupported cipher"#"客户端选择了不受支持的密码"#g' $file_name
perl -i -pe 's#\Q"Failed to decrypt session key"#"无法解密会话密钥"#g' $file_name
perl -i -pe 's#\Q"Received unexpected packet while "#"在需要用户名时收到意外的数据包，键入 %d (%s)"#g' $file_name
perl -i -pe 's#\Q"expecting username, type %d (%s)"#""#g' $file_name
perl -i -pe 's#\Q"Received username '\''%.*s'\''"#"收到的用户名 '\''%.*s'\''"#g' $file_name
perl -i -pe 's#\Q"Auth key far too small"#"身份验证密钥太小"#g' $file_name
perl -i -pe 's#\Q"Failed to encrypt auth challenge"#"无法加密身份验证质询"#g' $file_name
perl -i -pe 's#\Q"Received unexpected packet in "#"收到意外数据包以响应 RSA 身份验证质询，类型 %d (%s)"#g' $file_name
perl -i -pe 's#\Q"response to RSA auth challenge, type %d (%s)"#""#g' $file_name
perl -i -pe 's#\Q"Wrong response to auth challenge"#"对身份验证挑战的错误响应"#g' $file_name
perl -i -pe 's#\Q"Received unexpected packet in "#"收到意外数据包以响应 %s 质询，类型 %d (%s)"#g' $file_name
perl -i -pe 's#\Q"response to %s challenge, type %d (%s)"#""#g' $file_name
perl -i -pe 's#\Q"Multiple authentications required but SSH-1"#"需要多个身份验证，但 SSH-1 无法执行它们"#g' $file_name
perl -i -pe 's#\Q" cannot perform them"#""#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# ssh/mainchan.c
file_name="ssh/mainchan.c"
echo [43%]开始汉化 ssh/mainchan.c
perl -i -pe 's#\Q"X11 forwarding not enabled: unable to"#"X11 转发未启用：无法初始化 X 显示：%s"#g' $file_name
perl -i -pe 's#\Q" initialise X display: %s"#""#g' $file_name
perl -i -pe 's#\Q"Sent %d environment variables"#"发送了 %d 环境变量"#g' $file_name
perl -i -pe 's#\Q"X11 forwarding enabled"#"启用 X11 转发"#g' $file_name
perl -i -pe 's#\Q"X11 forwarding refused"#"X11 转发被拒绝"#g' $file_name
perl -i -pe 's#\Q"Agent forwarding enabled"#"已启用代理转发"#g' $file_name
perl -i -pe 's#\Q"Agent forwarding refused"#"代理转发被拒绝"#g' $file_name
perl -i -pe 's#\Q"Allocated pty"#"分配的 pty"#g' $file_name
perl -i -pe 's#\Q"Server refused to allocate pty"#"服务器拒绝分配 pty"#g' $file_name
perl -i -pe 's#\Q"Server refused to allocate pty\r\n"#"服务器拒绝分配 pty\\r\\n"#g' $file_name
perl -i -pe 's#\Q"Server refused to set environment variable %s"#"服务器拒绝设置环境变量 %s"#g' $file_name
perl -i -pe 's#\Q"All environment variables successfully set"#"所有环境变量设置成功"#g' $file_name
perl -i -pe 's#\Q"All environment variables refused"#"拒绝所有环境变量"#g' $file_name
perl -i -pe 's#\Q"Server refused to set environment "#"服务器拒绝设置环境变量\\r\\n"#g' $file_name
perl -i -pe 's#\Q"variables\r\n"#""#g' $file_name
perl -i -pe 's#\Q"Server refused to set all environment "#"服务器拒绝设置所有环境变量\\r\\n"#g' $file_name
perl -i -pe 's#\Q"Started a shell/command"#"启动了一个shell/command"#g' $file_name
perl -i -pe 's#\Q"Primary command failed; attempting fallback"#"主命令失败；尝试回退"#g' $file_name
perl -i -pe 's#\Q"Server refused to start a shell/command"#"服务器拒绝启动 shell/command"#g' $file_name
perl -i -pe 's#\Q"Server refused to open main channel: %s"#"服务器拒绝打开主频道: %s"#g' $file_name
perl -i -pe 's#\Q"Sent EOF message"#"发送 EOF 消息"#g' $file_name
perl -i -pe 's#\Q"Main session channel closed"#"主会话通道关闭"#g' $file_name
perl -i -pe 's#\Q"Session sent command exit status %d"#"会话已发送命令退出状态 %d"#g' $file_name
perl -i -pe 's#\Q"unrecognised signal \"%.*s\""#"无法识别的信号\\"%.*s\\""#g' $file_name
perl -i -pe 's#\Q"signal SIG%.*s"#"信号 SIG%.*s"#g' $file_name
perl -i -pe 's#\Q"signal %d"#"信号 %d"#g' $file_name
perl -i -pe 's#\Q"Sent signal SIG%s"#"发送信号 SIG%s"#g' $file_name
perl -i -pe 's#\Q"main channel"#"主频道"#g' $file_name
perl -i -pe 's#\Q"Opened main channel"#"打开的主频道"#g' $file_name
perl -i -pe 's#\Q"Session exited on %s%s%s%.*s%s"#"会话退出时间 %s%s%s%.*s%s"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# ssh/portfwd.c
file_name="ssh/portfwd.c"
echo [44%]开始汉化 ssh/portfwd.c
perl -i -pe 's#\Q"forwarding from %s"#"转发自 %s"#g' $file_name
perl -i -pe 's#\Q"forwarding"#"转发"#g' $file_name
perl -i -pe 's#\Q"These case values cannot appear"#"这些 case 值不能出现"#g' $file_name
perl -i -pe 's#\Q"Forwarded port closed"#"转发端口关闭"#g' $file_name
perl -i -pe 's#\Q"Forwarded connection refused by remote%s%s"#"远程拒绝转发连接%s%s"#g' $file_name
perl -i -pe 's#\Q"Service lookup failed for source"#"源端口“%s”的服务查找失败"#g' $file_name
perl -i -pe 's#\Q" port \"%s\""#""#g' $file_name
perl -i -pe 's#\Q"Service lookup failed for destination"#"目标端口“%s”的服务查找失败"#g' $file_name
perl -i -pe 's#\Q" port \"%s\""#""#g' $file_name
perl -i -pe 's#\Q"%s port forwarding from %s%s%d"#"来自 %s%s%d 的 %s 端口转发"#g' $file_name
perl -i -pe 's#\Q"Cancelling %s"#"取消 %s"#g' $file_name
perl -i -pe 's#\Q"Local %sport %s forwarding to %s%s%s"#"本地 %sport %s 转发到 %s%s%s"#g' $file_name
perl -i -pe 's#\Q"Local %sport %s SOCKS dynamic forwarding%s%s"#"本地 %sport %s SOCKS 动态转发%s%s"#g' $file_name
perl -i -pe 's#\Q"Duplicate remote port forwarding to %s:%d"#"复制远程端口转发到 %s:%d"#g' $file_name
perl -i -pe 's#\Q"Requesting remote port %s"#"请求远程端口 %s 转发到 %s"#g' $file_name
perl -i -pe 's#\Q" forward to %s"#""#g' $file_name
perl -i -pe 's#\Q"%s on port %s:%d to forward to client%s%s"#"%s 在端口 %s:%d 上转发到客户端%s%s"#g' $file_name
perl -i -pe 's#\Q"Failed to listen"#"无法监听"#g' $file_name
perl -i -pe 's#\Q"Listening"#"监听"#g' $file_name
perl -i -pe 's#\Q"Closing listening port %s:%d"#"正在关闭侦听端口 %s:%d"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# ssh/scpserver.c
file_name="ssh/scpserver.c"
echo [45%]开始汉化 ssh/scpserver.c
perl -i -pe 's#\Q"unable to read file permissions for %.*s"#"无法读取 %.*s 的文件权限"#g' $file_name
perl -i -pe 's#\Q"%.*s: is a directory"#"%.*s: 是一个目录"#g' $file_name
perl -i -pe 's#\Q"unable to read file size for %.*s"#"无法读取 %.*s 的文件大小"#g' $file_name
perl -i -pe 's#\Q"scp: received client EOF, abandoning transfer"#"scp：收到客户端EOF，放弃传输"#g' $file_name
perl -i -pe 's#\Q"scp: wildcards in path components "#"scp：不支持文件名前的路径组件中的通配符"#g' $file_name
perl -i -pe 's#\Q"before the file name not supported"#""#g' $file_name
perl -i -pe 's#\Q"%.*s: unable to access: %s"#"%.*s: 无法访问: %s"#g' $file_name
perl -i -pe 's#\Q"%.*s: unable to read: %s"#"%.*s: 无法读取: %s"#g' $file_name
perl -i -pe 's#\Q"%.*s: unable to list directory: %s"#"%.*s: 无法列出目录: %s"#g' $file_name
perl -i -pe 's#\Q"%.*s: unable to open: %s"#"%.*s: 无法打开: %s"#g' $file_name
perl -i -pe 's#\Q"%.*s: unable to stat: %s"#"%.*s: 无法统计: %s"#g' $file_name
perl -i -pe 's#\Q"terminating on fatal error from client"#"终止来自客户端的致命错误"#g' $file_name
perl -i -pe 's#\Q"unrecognised response code from client"#"来自客户端的无法识别的响应代码"#g' $file_name
perl -i -pe 's#\Q"'\''%.*s'\'': unable to create directory: %s"#"“%.*s”: 无法创建目录: %s"#g' $file_name
perl -i -pe 's#\Q"'\''%.*s'\'': unable to open file: %s"#"“%.*s”: 无法打开文件: %s"#g' $file_name
perl -i -pe 's#\Q"'\''%.*s'\'': unable to write to file: %s"#"“%.*s”: 无法写入文件: %s"#g' $file_name
perl -i -pe 's#\Q"received E command without matching D"#"收到没有匹配 D 的 E 命令"#g' $file_name
perl -i -pe 's#\Q"unrecognised scp command '\''%.*s'\''"#"无法识别的 scp 命令 '\''%.*s'\''"#g' $file_name
perl -i -pe 's#\Q"Unable to parse scp command: '\''%.*s'\''"#"无法解析 scp 命令：'\''%.*s'\''"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# ssh/server.c
file_name="ssh/server.c"
echo [46%]开始汉化 ssh/server.c
perl -i -pe 's#\Q"freeing server instance"#"释放服务器实例"#g' $file_name
perl -i -pe 's#\Q"Protocol error: %s"#"协议错误：%s"#g' $file_name
perl -i -pe 's#\Q"opened unconditional agent socket at %s\n"#"在 %s 打开无条件代理套接字\\n"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# ssh/sesschan.c
file_name="ssh/sesschan.c"
echo [47%]开始汉化 ssh/sesschan.c
perl -i -pe 's#\Q"Session channel closed"#"会话通道关闭"#g' $file_name
perl -i -pe 's#\Q"Starting built-in SCP server"#"启动内置 SCP 服务器"#g' $file_name
perl -i -pe 's#\Q"Starting built-in SFTP subsystem"#"启动内置 SFTP 子系统"#g' $file_name
perl -i -pe 's#\Q"Session channel (SFTP) closed"#"会话通道 (SFTP) 已关闭"#g' $file_name
perl -i -pe 's#\Q"Session channel (SCP) closed"#"会话通道 (SCP) 已关闭"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# ssh/sftp.c
file_name="ssh/sftp.c"
echo [48%]开始汉化 ssh/sftp.c
perl -i -pe 's#\Q"did not receive a valid SFTP packet\n"#"未收到有效的 SFTP 数据包\\n"#g' $file_name
perl -i -pe 's#\Q"request ID mismatch\n"#"请求 ID 不匹配\\n"#g' $file_name
perl -i -pe 's#\Q"unexpected OK response"#"意外的 OK 响应"#g' $file_name
perl -i -pe 's#\Q"end of file"#"文件结尾"#g' $file_name
perl -i -pe 's#\Q"no such file or directory"#"没有这样的文件或目录"#g' $file_name
perl -i -pe 's#\Q"permission denied"#"没有权限"#g' $file_name
perl -i -pe 's#\Q"failure"#"失败"#g' $file_name
perl -i -pe 's#\Q"bad message"#"坏消息"#g' $file_name
perl -i -pe 's#\Q"no connection"#"没有关联"#g' $file_name
perl -i -pe 's#\Q"connection lost"#"连接丢失"#g' $file_name
perl -i -pe 's#\Q"operation unsupported"#"操作不支持"#g' $file_name
perl -i -pe 's#\Q"expected FXP_STATUS packet"#"预期的 FXP_STATUS 数据包"#g' $file_name
perl -i -pe 's#\Q"malformed FXP_STATUS packet"#"格式错误的 FXP_STATUS 数据包"#g' $file_name
perl -i -pe 's#\Q"unknown error code"#"未知错误代码"#g' $file_name
perl -i -pe 's#\Q"could not connect"#"无法连接"#g' $file_name
perl -i -pe 's#\Q"did not receive FXP_VERSION"#"没有收到 FXP_VERSION"#g' $file_name
perl -i -pe 's#\Q"malformed FXP_VERSION packet"#"格式错误的 FXP_VERSION 数据包"#g' $file_name
perl -i -pe 's#\Q"remote protocol is more advanced than we support"#"远程协议比我们支持的更先进"#g' $file_name
perl -i -pe 's#\Q"REALPATH did not return name count of 1\n"#"REALPATH 未返回名称计数 1\\n"#g' $file_name
perl -i -pe 's#\Q"REALPATH returned malformed FXP_NAME\n"#"REALPATH 返回格式错误的 FXP_NAME\\n"#g' $file_name
perl -i -pe 's#\Q"received malformed FXP_HANDLE"#"收到格式错误的 FXP_HANDLE"#g' $file_name
perl -i -pe 's#\Q"malformed SSH_FXP_ATTRS packet"#"格式错误的 SSH_FXP_ATTRS 数据包"#g' $file_name
perl -i -pe 's#\Q"READ returned malformed SSH_FXP_DATA packet"#"READ 返回格式错误的 SSH_FXP_DATA 数据包"#g' $file_name
perl -i -pe 's#\Q"READ returned more bytes than requested"#"READ 返回的字节数比请求的多"#g' $file_name
perl -i -pe 's#\Q"malformed FXP_NAME packet"#"格式错误的 FXP_NAME 数据包"#g' $file_name
perl -i -pe 's#\Q"unreasonably large FXP_NAME packet"#"不合理的大 FXP_NAME 数据包"#g' $file_name
perl -i -pe 's#\Q"queueing read request %p at %"#"读取请求 %p 排队%"#g' $file_name
perl -i -pe 's#\Q"request ID is not part of the current download"#"请求 ID 不是当前下载的一部分"#g' $file_name
perl -i -pe 's#\Q"read request %p has returned [%d]\n"#"读取请求 %p 已返回 [%d]\\n"#g' $file_name
perl -i -pe 's#\Q"setting eof\n"#"设置 eof\\n"#g' $file_name
perl -i -pe 's#\Q"setting furthestdata = %"#"设置最远数据 = %"#g' $file_name
perl -i -pe 's#\Q"short block! trying filesize = %"#"短块！尝试文件大小 = %"#g' $file_name
perl -i -pe 's#\Q"actually changing filesize\n"#"实际改变文件大小\\n"#g' $file_name
perl -i -pe 's#\Q"received a short buffer from FXP_READ, but not"#"从 FXP_READ 收到一个短缓冲区，但不是在 EOF"#g' $file_name
perl -i -pe 's#\Q" at EOF"#""#g' $file_name
perl -i -pe 's#\Q"handing back data from read request %p\n"#"从读取请求返回数据 %p\\n"#g' $file_name
perl -i -pe 's#\Q"skipping failed read request %p\n"#"跳过失败的读取请求 %p\\n"#g' $file_name
perl -i -pe 's#\Q"queueing write request %p at %"#"排队写请求 %p 在 %"#g' $file_name
perl -i -pe 's#\Q"request ID is not part of the current upload"#"请求 ID 不是当前上传的一部分"#g' $file_name
perl -i -pe 's#\Q"write request %p has returned [%d]\n"#"写请求 %p 已返回 [%d]\\n"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# ssh/sftpserver.c
file_name="ssh/sftpserver.c"
echo [49%]开始汉化 ssh/sftpserver.c
perl -i -pe 's#\Q"open without READ or WRITE flag"#"打开没有 READ 或 WRITE 标志"#g' $file_name
perl -i -pe 's#\Q"open with TRUNC but not CREAT"#"用 TRUNC 打开但不是 CREATE"#g' $file_name
perl -i -pe 's#\Q"open with EXCL but not CREAT"#"用 EXCL 打开但不是 CREATE"#g' $file_name
perl -i -pe 's#\Q"Unrecognised request type"#"无法识别的请求类型"#g' $file_name
perl -i -pe 's#\Q"Unable to decode request"#"无法解码请求"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# ssh/sharing.c
file_name="ssh/sharing.c"
echo [50%]开始汉化 ssh/sharing.c
perl -i -pe 's#\Q"Connection sharing downstream \#%u: %s"#"下游连接共享 \#%u: %s"#g' $file_name
perl -i -pe 's#\Q"Connection sharing: %s"#"连接共享: %s"#g' $file_name
perl -i -pe 's#\Q"PuTTY downstream no longer available"#"PuTTY 下游不再可用"#g' $file_name
perl -i -pe 's#\Q"cleanup after downstream went away"#"下游消失后的清理"#g' $file_name
perl -i -pe 's#\Q"Socket error: %s"#"套接字错误: %s"#g' $file_name
perl -i -pe 's#\Q"downstream refused X channel open"#"下游拒绝 X 通道打开"#g' $file_name
perl -i -pe 's#\Q"window adjustment after downstream accepted X channel"#"下游接受 X 通道后的窗口调整"#g' $file_name
perl -i -pe 's#\Q"This packet type should never have come from "#"这种数据包类型不应该来自 connection2.c"#g' $file_name
perl -i -pe 's#\Q"connection2.c"#""#g' $file_name
perl -i -pe 's#\Q"Truncated GLOBAL_REQUEST packet"#"截断的 GLOBAL_REQUEST 数据包"#g' $file_name
perl -i -pe 's#\Q"upstream added want_reply flag"#"上游添加了 want_reply 标志"#g' $file_name
perl -i -pe 's#\Q"Truncated GLOBAL_REQUEST packet"#"截断的 GLOBAL_REQUEST 数据包"#g' $file_name
perl -i -pe 's#\Q"upstream added want_reply flag"#"上游添加了 want_reply 标志"#g' $file_name
perl -i -pe 's#\Q"Truncated CHANNEL_OPEN packet"#"截断的 CHANNEL_OPEN 数据包"#g' $file_name
perl -i -pe 's#\Q"Truncated CHANNEL_OPEN_CONFIRMATION packet"#"截断的 CHANNEL_OPEN_CONFIRMATION 数据包"#g' $file_name
perl -i -pe 's#\Q"CHANNEL_OPEN_CONFIRMATION packet cited unknown channel %u"#"CHANNEL_OPEN_CONFIRMATION 数据包引用了未知通道 %u"#g' $file_name
perl -i -pe 's#\Q"Initial window size for x11 channel must be at least 256 (got %u)"#"x11 通道的初始窗口大小必须至少为 256（得到 %u）"#g' $file_name
perl -i -pe 's#\Q"Truncated CHANNEL_OPEN_FAILURE packet"#"截断的 CHANNEL_OPEN_FAILURE 数据包"#g' $file_name
perl -i -pe 's#\Q"CHANNEL_OPEN_FAILURE packet cited unknown channel %u"#"CHANNEL_OPEN_FAILURE 数据包引用了未知通道 %u"#g' $file_name
perl -i -pe 's#\Q"Agent forwarding request for "#"无法识别通道 %u 的代理转发请求"#g' $file_name
perl -i -pe 's#\Q"unrecognised channel %u"#""#g' $file_name
perl -i -pe 's#\Q"X11 forwarding request for "#"无法识别通道 %u 的 X11 转发请求"#g' $file_name
perl -i -pe 's#\Q"Truncated CHANNEL_REQUEST(\"x11-req\")"#"截断的 CHANNEL_REQUEST(\\"x11-req\\") 数据包"#g' $file_name
perl -i -pe 's#\Q" packet"#""#g' $file_name
perl -i -pe 's#\Q"Unexpected packet type %d\n"#"意外的数据包类型 %d\\n"#g' $file_name
perl -i -pe 's#\Q"Version string far too long\n"#"版本字符串太长\\n"#g' $file_name
perl -i -pe 's#\Q"Version string did not have expected prefix\n"#"版本字符串没有预期的前缀\\n"#g' $file_name
perl -i -pe 's#\Q"Downstream version string: %.*s"#"下游版本字符串：%.*s"#g' $file_name
perl -i -pe 's#\Q"Bad packet length %u\n"#"错误数据包长度 %u\\n"#g' $file_name
perl -i -pe 's#\Q"listening socket: %s"#"监听套接字: %s"#g' $file_name
perl -i -pe 's#\Q"Could not set up connection sharing: %s"#"无法设置连接共享: %s"#g' $file_name
perl -i -pe 's#\Q"Could not set up connection sharing"#"无法设置连接共享"#g' $file_name
perl -i -pe 's#\Q" as downstream: %s"#" 作为下游：%s"#g' $file_name
perl -i -pe 's#\Q" as upstream: %s"#" 作为上游: %s"#g' $file_name
perl -i -pe 's#\Q"Using existing shared connection at %s"#"使用 %s 的现有共享连接"#g' $file_name
perl -i -pe 's#\Q"Sharing this connection at %s"#"在 %s 共享此连接"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# ssh/ssh.c
file_name="ssh/ssh.c"
echo [51%]开始汉化 ssh/ssh.c
perl -i -pe 's#\Q"Repeat key exchange"#"重复密钥交换"#g' $file_name
perl -i -pe 's#\Q"More signals"#"更多信号"#g' $file_name
perl -i -pe 's#\Q"Cache new host key type"#"缓存新的主机密钥类型"#g' $file_name
perl -i -pe 's#\Q"This will also close %d downstream connection%s."#"这也将关闭 %d 个下游连接%s."#g' $file_name
perl -i -pe 's#\Q"Reusing a shared connection to this server.\r\n"#"重复使用到此服务器的共享连接.\\r\\n"#g' $file_name
perl -i -pe 's#\Q"SSH connection"#"SSH 连接"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# ssh/transport2.c
file_name="ssh/transport2.c"
echo [52%]开始汉化 ssh/transport2.c
perl -i -pe 's#\Q"Should never run out of space in KEXINIT list"#"永远不会用完 KEXINIT 列表中的空间"#g' $file_name
perl -i -pe 's#\Q"host not allowed to connect"#"主机不允许连接"#g' $file_name
perl -i -pe 's#\Q"protocol error"#"协议错误"#g' $file_name
perl -i -pe 's#\Q"key exchange failed"#"密钥交换失败"#g' $file_name
perl -i -pe 's#\Q"host authentication failed"#"主机认证失败"#g' $file_name
perl -i -pe 's#\Q"MAC error"#"MAC错误"#g' $file_name
perl -i -pe 's#\Q"compression error"#"压缩错误"#g' $file_name
perl -i -pe 's#\Q"service not available"#"服务不可用"#g' $file_name
perl -i -pe 's#\Q"protocol version not supported"#"不支持协议版本"#g' $file_name
perl -i -pe 's#\Q"host key not verifiable"#"主机密钥不可验证"#g' $file_name
perl -i -pe 's#\Q"connection lost"#"连接丢失"#g' $file_name
perl -i -pe 's#\Q"by application"#"按申请"#g' $file_name
perl -i -pe 's#\Q"too many connections"#"太多连接"#g' $file_name
perl -i -pe 's#\Q"auth cancelled by user"#"用户取消了身份验证"#g' $file_name
perl -i -pe 's#\Q"no more auth methods available"#"没有更多可用的身份验证方法"#g' $file_name
perl -i -pe 's#\Q"illegal user name"#"非法用户名"#g' $file_name
perl -i -pe 's#\Q"Remote side sent disconnect message\n"#"远程端发送断开消息\\n"#g' $file_name
perl -i -pe 's#\Q"Remote debug message: %.*s"#"远程调试消息：%.*s"#g' $file_name
perl -i -pe 's#\Q"Received premature higher-"#"收到过早的更高层数据包，"#g' $file_name
perl -i -pe 's#\Q"layer packet, type %d (%s)"#"类型 %d (%s)"#g' $file_name
perl -i -pe 's#\Q"KEXINIT packet was incomplete"#"KEXINIT 数据包不完整"#g' $file_name
perl -i -pe 's#\Q"Selected %s \"%.*s\" does not correspond to "#"选定的 %s \\"%.*s\\" 不对应"#g' $file_name
perl -i -pe 's#\Q"any supported algorithm"#"任何支持的算法"#g' $file_name
perl -i -pe 's#\Q"Couldn'\''t agree a %s (available: %.*s)"#"无法同意 %s（可用：%.*s）"#g' $file_name
perl -i -pe 's#\Q"Bad list index in scan_kexinits"#"scan_kexinits 中的错误列表索引"#g' $file_name
perl -i -pe 's#\Q"Received unexpected packet when "#"收到意外的数据包"#g' $file_name
perl -i -pe 's#\Q"expecting KEXINIT, type %d (%s)"#"期待 KEXINIT，类型 %d (%s)"#g' $file_name
perl -i -pe 's#\Q"User aborted at kex warning"#"用户在 kex 警告中中止"#g' $file_name
perl -i -pe 's#\Q"User aborted at host key warning"#"用户在主机密钥警告中中止"#g' $file_name
perl -i -pe 's#\Q"User aborted at cipher warning"#"用户在密码警告中中止"#g' $file_name
perl -i -pe 's#\Q"expecting SSH_MSG_NEWKEYS, type %d (%s)"#"期待 SSH_MSG_NEWKEYS，键入 %d (%s)"#g' $file_name
perl -i -pe 's#\Q"Server refused request to start "#"服务器拒绝启动“%s”协议的请求"#g' $file_name
perl -i -pe 's#\Q"'\''%s'\'' protocol"#""#g' $file_name
perl -i -pe 's#\Q"expecting SERVICE_REQUEST, type %d (%s)"#"期待 SERVICE_REQUEST，类型 %d (%s)"#g' $file_name
perl -i -pe 's#\Q"Client requested service "#"当我们只支持“%s”时，客户请求服务“%.*s”"#g' $file_name
perl -i -pe 's#\Q"'\''%.*s'\'' when we only support '\''%s'\''"#""#g' $file_name
perl -i -pe 's#\Q"Received unexpected transport-"#"在密钥交换之外接收到意外的传输层数据包，类型 %d (%s)"#g' $file_name
perl -i -pe 's#\Q"layer packet outside a key exchange, "#""#g' $file_name
perl -i -pe 's#\Q"type %d (%s)"#""#g' $file_name
perl -i -pe 's#\Q"Remote side initiated key re-exchange"#"远程发起的密钥重新交换"#g' $file_name
perl -i -pe 's#\Q"populating transient host key cache"#"填充瞬态主机密钥缓存"#g' $file_name
perl -i -pe 's#\Q"too much data received"#"接收到的数据过多"#g' $file_name
perl -i -pe 's#\Q"too much data sent"#"发送的数据过多"#g' $file_name
perl -i -pe 's#\Q"Remote bug prevents key re-exchange (%s)"#"远程错误阻止密钥重新交换 (%s)"#g' $file_name
perl -i -pe 's#\Q"Initiating key re-exchange (%s)"#"启动密钥重新交换 (%s)"#g' $file_name
perl -i -pe 's#\Q"GSS credentials updated"#"GSS 凭据已更新"#g' $file_name
perl -i -pe 's#\Q"GSSAPI import name failed - Bad service name;"#"GSSAPI 导入名称失败 -服务名称错误；不会使用 GSS 密钥交换"#g' $file_name
perl -i -pe 's#\Q" won'\''t use GSS key exchange"#""#g' $file_name
perl -i -pe 's#\Q"GSSAPI import name failed;"#"GSSAPI 导入名称失败；不会使用 GSS 密钥交换"#g' $file_name
perl -i -pe 's#\Q"No GSSAPI security context available"#"没有可用的 GSSAPI 安全上下文"#g' $file_name
perl -i -pe 's#\Q"Repeat key exchange"#"重复密钥交换"#g' $file_name
perl -i -pe 's#\Q"Cache new host key type"#"缓存新的主机密钥类型"#g' $file_name
perl -i -pe 's#\Q"at user request"#"应用户要求"#g' $file_name
perl -i -pe 's#\Q"cross-certifying new host key"#"交叉验证新主机密钥"#g' $file_name
perl -i -pe 's#\Q"timeout shortened"#"超时缩短"#g' $file_name
perl -i -pe 's#\Q"data limit lowered"#"数据限制降低"#g' $file_name
perl -i -pe 's#\Q"compression setting changed"#"压缩设置已更改"#g' $file_name
perl -i -pe 's#\Q"cipher settings changed"#"密码设置已更改"#g' $file_name
perl -i -pe 's#\Q"host key warning"#"主机密钥警告"#g' $file_name
perl -i -pe 's#\Q"cipher warning"#"密码警告"#g' $file_name
perl -i -pe 's#\Q"kex warning"#"kex 警告"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# ssh/userauth2-client.c
file_name="ssh/userauth2-client.c"
echo [53%]开始汉化 ssh/userauth2-client.c
perl -i -pe 's#\Q"Reading key file \"%s\""#"读取密钥文件“%s”"#g' $file_name
perl -i -pe 's#\Q"Key file contains public key only"#"密钥文件仅包含公钥"#g' $file_name
perl -i -pe 's#\Q"Unable to load key (%s)"#"无法加载密钥 (%s)"#g' $file_name
perl -i -pe 's#\Q"Unable to load key file \"%s\" (%s)\r\n"#"无法加载密钥文件 \\"%s\\" (%s)\\r\\n"#g' $file_name
perl -i -pe 's#\Q"Unable to use this key file (%s)"#"无法使用此密钥文件 (%s)"#g' $file_name
perl -i -pe 's#\Q"Unable to use key file \"%s\" (%s)\r\n"#"无法使用密钥文件 \\"%s\\" (%s)\\r\\n"#g' $file_name
perl -i -pe 's#\Q"Pageant is running. Requesting keys."#"Pageant正在运行。请求密钥。"#g' $file_name
perl -i -pe 's#\Q"Pageant'\''s response was truncated"#"Pageant 的回复被截断了"#g' $file_name
perl -i -pe 's#\Q"Configured key file not in Pageant"#"配置的密钥文件不在Pageant中"#g' $file_name
perl -i -pe 's#\Q"Failed to get reply from Pageant"#"未能得到Pageant的回复"#g' $file_name
perl -i -pe 's#\Q"No username provided"#"未提供用户名"#g' $file_name
perl -i -pe 's#\Q"Using username \"%s\".\r\n"#"使用用户名 \\"%s\\"。\\r\\n"#g' $file_name
perl -i -pe 's#\Q"Pre-authentication banner message from server:"#"来自服务器的预认证横幅消息:"#g' $file_name
perl -i -pe 's#\Q"End of banner message from server"#"来自服务器的横幅消息结束"#g' $file_name
perl -i -pe 's#\Q"Access granted"#"授予访问权限"#g' $file_name
perl -i -pe 's#\Q"Received unexpected packet "#"收到意外的数据包"#g' $file_name
perl -i -pe 's#\Q"in response to authentication request, "#"响应身份验证请求，键入 %d (%s)"#g' $file_name
perl -i -pe 's#\Q"type %d (%s)"#""#g' $file_name
perl -i -pe 's#\Q"Server refused our key\r\n"#"服务器拒绝了我们的密钥\\r\\n"#g' $file_name
perl -i -pe 's#\Q"Server refused our key"#"服务器拒绝了我们的密钥"#g' $file_name
perl -i -pe 's#\Q"Server refused public-key signature"#"服务器拒绝公钥签名"#g' $file_name
perl -i -pe 's#\Q" despite accepting key!\r\n"#"尽管接受密钥！\\r\\n"#g' $file_name
perl -i -pe 's#\Q" despite accepting key!"#" 尽管接受密钥!"#g' $file_name
perl -i -pe 's#\Q"Server refused keyboard-interactive "#"服务器拒绝键盘交互"#g' $file_name
perl -i -pe 's#\Q"authentication"#"验证"#g' $file_name
perl -i -pe 's#\Q"Keyboard-interactive authentication "#"键盘交互身份验证"#g' $file_name
perl -i -pe 's#\Q"failed"#"失败"#g' $file_name
perl -i -pe 's#\Q"Password authentication failed"#"密码验证失败"#g' $file_name
perl -i -pe 's#\Q"Access denied\r\n"#"拒绝访问\\r\\n"#g' $file_name
perl -i -pe 's#\Q"Further authentication required\r\n"#"需要进一步验证\\r\\n"#g' $file_name
perl -i -pe 's#\Q"Further authentication required"#"需要进一步验证"#g' $file_name
perl -i -pe 's#\Q"Authenticating with public key "#"使用公钥进行身份验证"#g' $file_name
perl -i -pe 's#\Q"\"%.*s\" from agent\r\n"#"来自代理的\\"%.*s\\"\\r\\n"#g' $file_name
perl -i -pe 's#\Q"Sending Pageant'\''s response"#"发送Pageant的回应"#g' $file_name
perl -i -pe 's#\Q"Pageant refused signing request"#"Pageant拒绝签名请求"#g' $file_name
perl -i -pe 's#\Q"Pageant failed to "#"Pageant未能"#g' $file_name
perl -i -pe 's#\Q"provide a signature\r\n"#"提供签名\\r\\n"#g' $file_name
perl -i -pe 's#\Q"Pageant failed to respond to "#"Pageant未能回应"#g' $file_name
perl -i -pe 's#\Q"signing request"#"签名请求"#g' $file_name
perl -i -pe 's#\Q"Pageant failed to "#"Pageant未能回应"#g' $file_name
perl -i -pe 's#\Q"respond to signing request\r\n"#"签名请求\\r\\n"#g' $file_name
perl -i -pe 's#\Q"Offered public key"#"提供的公钥"#g' $file_name
perl -i -pe 's#\Q"Offer of public key accepted"#"接受公开密钥的提议"#g' $file_name
perl -i -pe 's#\Q"Authenticating with public key \"%s\"\r\n"#"使用公钥 \\"%s\\" 进行身份验证\\r\\n"#g' $file_name
perl -i -pe 's#\Q"SSH key passphrase"#"SSH 密钥密码"#g' $file_name
perl -i -pe 's#\Q"Passphrase for key \"%s\": "#"密钥 \\"%s\\" 的密码："#g' $file_name
perl -i -pe 's#\Q"Unable to authenticate"#"无法进行身份验证"#g' $file_name
perl -i -pe 's#\Q"User aborted at "#"用户中止于"#g' $file_name
perl -i -pe 's#\Q"passphrase prompt"#"密码提示"#g' $file_name
perl -i -pe 's#\Q"Wrong passphrase\r\n"#"密码错误\\r\\n"#g' $file_name
perl -i -pe 's#\Q"Unable to load private key (%s)\r\n"#"无法加载私钥 (%s)\\r\\n"#g' $file_name
perl -i -pe 's#\Q"Cannot use this private key (%s)\r\n"#"无法使用此私钥 (%s)\\r\\n"#g' $file_name
perl -i -pe 's#\Q"Sent public key signature"#"发送公钥签名"#g' $file_name
perl -i -pe 's#\Q"Attempting GSSAPI authentication"#"尝试 GSSAPI 身份验证"#g' $file_name
perl -i -pe 's#\Q"GSSAPI authentication request refused"#"GSSAPI 身份验证请求被拒绝"#g' $file_name
perl -i -pe 's#\Q"GSSAPI authentication - wrong response "#"GSSAPI 身份验证 -错误响应"#g' $file_name
perl -i -pe 's#\Q"from server"#"从服务器"#g' $file_name
perl -i -pe 's#\Q"GSSAPI import name failed -"#"GSSAPI 导入名称失败 -"#g' $file_name
perl -i -pe 's#\Q" Bad service name"#"错误的服务名称"#g' $file_name
perl -i -pe 's#\Q"GSSAPI import name failed"#"GSSAPI 导入名称失败"#g' $file_name
perl -i -pe 's#\Q"GSSAPI authentication failed to get "#"GSSAPI 认证获取失败"#g' $file_name
perl -i -pe 's#\Q"credentials"#"证书"#g' $file_name
perl -i -pe 's#\Q"GSSAPI authentication initialisation "#"GSSAPI 身份验证初始化"#g' $file_name
perl -i -pe 's#\Q"GSSAPI authentication initialised"#"GSSAPI 身份验证已初始化"#g' $file_name
perl -i -pe 's#\Q"after SSH_MSG_USERAUTH_GSSAPI_ERRTOK "#"在 SSH_MSG_USERAUTH_GSSAPI_ERRTOK（预期为 SSH_MSG_USERAUTH_FAILURE）之后：键入 %d (%s)"#g' $file_name
perl -i -pe 's#\Q"(expected SSH_MSG_USERAUTH_FAILURE): "#""#g' $file_name
perl -i -pe 's#\Q"GSSAPI authentication failed"#"GSSAPI 身份验证失败"#g' $file_name
perl -i -pe 's#\Q"GSSAPI authentication -"#"GSSAPI 身份验证 -服务器响应错误"#g' $file_name
perl -i -pe 's#\Q" bad server response"#""#g' $file_name
perl -i -pe 's#\Q"GSSAPI authentication loop finished OK"#"GSSAPI 认证循环完成 OK"#g' $file_name
perl -i -pe 's#\Q"Attempting keyboard-interactive authentication"#"尝试键盘交互身份验证"#g' $file_name
perl -i -pe 's#\Q"Server sent truncated "#"服务器发送截断的 SSH_MSG_USERAUTH_INFO_REQUEST 数据包"#g' $file_name
perl -i -pe 's#\Q"SSH_MSG_USERAUTH_INFO_REQUEST packet"#""#g' $file_name
perl -i -pe 's#\Q"<server failed to send prompt>: "#"<服务器发送提示失败>: "#g' $file_name
perl -i -pe 's#\Q"Keyboard-interactive authentication "#"键盘交互身份验证"#g' $file_name
perl -i -pe 's#\Q"prompts from server:"#"服务器提示："#g' $file_name
perl -i -pe 's#\Q"SSH server authentication"#"SSH服务器认证"#g' $file_name
perl -i -pe 's#\Q"Unable to authenticate"#"无法进行身份验证"#g' $file_name
perl -i -pe 's#\Q"User aborted during "#"用户在期间中止"#g' $file_name
perl -i -pe 's#\Q"End of keyboard-interactive prompts from server"#"来自服务器的键盘交互提示结束"#g' $file_name
perl -i -pe 's#\Q"User aborted during password "#"用户在密码期间中止"#g' $file_name
perl -i -pe 's#\Q"Server requested password change"#"服务器请求更改密码"#g' $file_name
perl -i -pe 's#\Q"Sent password"#"发送密码"#g' $file_name
perl -i -pe 's#\Q"Server rejected new password"#"服务器拒绝新密码"#g' $file_name
perl -i -pe 's#\Q"Current password (blank for previously entered password): "#"当前密码（之前输入的密码为空白）："#g' $file_name
perl -i -pe 's#\Q"password changing"#"更改密码"#g' $file_name
perl -i -pe 's#\Q"Passwords do not match\r\n"#"密码不匹配\\r\\n"#g' $file_name
perl -i -pe 's#\Q"Sent new password"#"发送新密码"#g' $file_name
perl -i -pe 's#\Q"No supported authentication methods available"#"没有可用的受支持的身份验证方法"#g' $file_name
perl -i -pe 's#\Q"No supported authentication methods "#"没有可用的受支持的身份验证方法（服务器发送：%s）"#g' $file_name
perl -i -pe 's#\Q"available (server sent: %s)"#""#g' $file_name
perl -i -pe 's#\Q"Authentication was trivial! "#"身份验证很简单！"#g' $file_name
perl -i -pe 's#\Q"Abandoning session as specified in configuration."#"放弃配置中指定的会话。"#g' $file_name
perl -i -pe 's#\Q"Pageant has %"#"Pageant 有 %"#g' $file_name
perl -i -pe 's#\Q" SSH-2 keys"#" SSH-2 密钥"#g' $file_name
perl -i -pe 's#\Q"Pageant key \#"#"Pageant 密钥 \#"#g' $file_name
perl -i -pe 's#\Q" matches "#" 匹配 "#g' $file_name
perl -i -pe 's#\Q"configured key file"#"配置的密钥文件"#g' $file_name
perl -i -pe 's#\Q"SSH login name"#"SSH 登录名"#g' $file_name
perl -i -pe 's#\Q"login as: "#"登录为: "#g' $file_name
perl -i -pe 's#\Q"username prompt"#"用户名提示"#g' $file_name
perl -i -pe 's#\Q"Trying gssapi-keyex..."#"尝试 gssapi-keyex..."#g' $file_name
perl -i -pe 's#\Q"Trying Pageant key \#"#"尝试 Pageant 密钥 \#"#g' $file_name
perl -i -pe 's#\Q"Trying gssapi-with-mic..."#"尝试 gssapi-with-mic..."#g' $file_name
perl -i -pe 's#\Q"Keyboard-interactive "#"来自服务器的键盘交互式身份验证提示:"#g' $file_name
perl -i -pe 's#\Q"authentication prompts from server:"#""#g' $file_name
perl -i -pe 's#\Q"keyboard-"#"键盘交互式身份验证提示"#g' $file_name
perl -i -pe 's#\Q"interactive authentication prompt"#""#g' $file_name
perl -i -pe 's#\Q"SSH password"#"SSH 密码"#g' $file_name
perl -i -pe 's#\Q"password prompt"#"密码提示"#g' $file_name
perl -i -pe 's#\Q"New SSH password"#"新的 SSH 密码"#g' $file_name
perl -i -pe 's#\Q"Enter new password: "#"输入新密码: "#g' $file_name
perl -i -pe 's#\Q"Confirm new password: "#"确认新密码: "#g' $file_name
perl -i -pe 's#\Q"password-change prompt"#"密码更改提示"#g' $file_name
perl -i -pe 's#\Q"%s@%s'\''s password: "#"%s@%s的密码: "#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# ssh/userauth2-server.c
file_name="ssh/userauth2-server.c"
echo [54%]开始汉化 ssh/userauth2-server.c
perl -i -pe 's#\Q"Received unexpected packet when "#"收到意外的数据包时"#g' $file_name
perl -i -pe 's#\Q"expecting USERAUTH_REQUEST, type %d (%s)"#"期待 USERAUTH_REQUEST，键入 %d (%s)"#g' $file_name
perl -i -pe 's#\Q"Please change your password"#"请更改您的密码"#g' $file_name
perl -i -pe 's#\Q"expecting USERAUTH_INFO_RESPONSE, type %d (%s)"#"期待 USERAUTH_INFO_RESPONSE，键入 %d (%s)"#g' $file_name
perl -i -pe 's#\Q"Received %u keyboard-interactive "#"收到 %u 键盘交互"#g' $file_name
perl -i -pe 's#\Q"responses after sending %u prompts"#"发送 %u 提示后的响应"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# ssh/verstring.c
file_name="ssh/verstring.c"
echo [55%]开始汉化 ssh/verstring.c
perl -i -pe 's#\Q"We claim version: %s"#"我们要求版本: %s"#g' $file_name
perl -i -pe 's#\Q"Remote version: %s"#"远程版本: %s"#g' $file_name
perl -i -pe 's#\Q"SSH protocol version 1 required by our "#"我们的配置需要的 SSH 协议版本 1，"#g' $file_name
perl -i -pe 's#\Q"configuration but not provided by remote"#"但远程不提供"#g' $file_name
perl -i -pe 's#\Q"SSH protocol version 2 required by our "#"我们的配置所需的 SSH 协议版本 2，"#g' $file_name
perl -i -pe 's#\Q"configuration but remote only provides "#"但远程仅提供"#g' $file_name
perl -i -pe 's#\Q"(old, insecure) SSH-1"#"（旧的，不安全的） SSH-1"#g' $file_name
perl -i -pe 's#\Q"Using SSH protocol version %d"#"使用 SSH 协议版本 %d"#g' $file_name
perl -i -pe 's#\Q"Remote side unexpectedly closed network connection"#"远程端意外关闭网络连接"#g' $file_name
perl -i -pe 's#\Q"Should never try to send packets during SSH version "#"永远不要在 SSH 版本字符串交换期间尝试发送数据包"#g' $file_name
perl -i -pe 's#\Q"string exchange"#""#g' $file_name
perl -i -pe 's#\Q"We believe remote version has SSH-1 ignore bug"#"我们认为远程版本有 SSH-1 忽略错误"#g' $file_name
perl -i -pe 's#\Q"We believe remote version needs a "#"我们相信远程版本需要一个普通的 SSH-1 密码"#g' $file_name
perl -i -pe 's#\Q"plain SSH-1 password"#""#g' $file_name
perl -i -pe 's#\Q"We believe remote version can'\''t handle SSH-1 "#"我们相信远程版本不能处理 SSH-1 RSA 身份验证"#g' $file_name
perl -i -pe 's#\Q"RSA authentication"#""#g' $file_name
perl -i -pe 's#\Q"We believe remote version has SSH-2 HMAC bug"#"我们认为远程版本有 SSH-2 HMAC 错误"#g' $file_name
perl -i -pe 's#\Q"We believe remote version has SSH-2 "#"我们认为远程版本存在 SSH-2"#g' $file_name
perl -i -pe 's#\Q"key-derivation bug"#"密钥派生错误"#g' $file_name
perl -i -pe 's#\Q"We believe remote version has SSH-2 RSA padding bug"#"我们认为远程版本有 SSH-2 RSA 填充错误"#g' $file_name
perl -i -pe 's#\Q"public-key-session-ID bug"#"公钥会话 ID 错误"#g' $file_name
perl -i -pe 's#\Q"We believe remote version has SSH-2 rekey bug"#"我们认为远程版本存在 SSH-2 密钥更新错误"#g' $file_name
perl -i -pe 's#\Q"We believe remote version ignores SSH-2 "#"我们认为远程版本忽略 SSH-2"#g' $file_name
perl -i -pe 's#\Q"maximum packet size"#"最大数据包大小"#g' $file_name
perl -i -pe 's#\Q"We believe remote version has SSH-2 ignore bug"#"我们认为远程版本有 SSH-2 忽略错误"#g' $file_name
perl -i -pe 's#\Q"We believe remote version has outdated SSH-2 GEX"#"我们认为远程版本已经过时 SSH-2 GEX"#g' $file_name
perl -i -pe 's#\Q"We believe remote version has winadj bug"#"我们认为远程版本有 winadj 错误"#g' $file_name
perl -i -pe 's#\Q"channel request bug"#"频道请求错误"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# ssh/x11fwd.c
file_name="ssh/x11fwd.c"
echo [56%]开始汉化 ssh/x11fwd.c
perl -i -pe 's#\Q"Unsupported authorisation protocol"#"不支持的授权协议"#g' $file_name
perl -i -pe 's#\Q"Authorisation not recognised"#"授权不被认可"#g' $file_name
perl -i -pe 's#\Q"XDM-AUTHORIZATION-1 data was wrong length"#"XDM-AUTHORIZATION-1 数据长度错误"#g' $file_name
perl -i -pe 's#\Q"cannot do XDM-AUTHORIZATION-1 without remote address data"#"没有远程地址数据无法执行 XDM-AUTHORIZATION-1"#g' $file_name
perl -i -pe 's#\Q"XDM-AUTHORIZATION-1 data failed check"#"XDM-AUTHORIZATION-1 数据检查失败"#g' $file_name
perl -i -pe 's#\Q"XDM-AUTHORIZATION-1 time stamp was too far out"#"XDM-AUTHORIZATION-1 时间戳太远了"#g' $file_name
perl -i -pe 's#\Q"XDM-AUTHORIZATION-1 data replayed"#"XDM-AUTHORIZATION-1 数据重放"#g' $file_name
perl -i -pe 's#\Q"unable to connect to forwarded "#"无法连接到转发的 X 服务器: %s"#g' $file_name
perl -i -pe 's#\Q"X server: %s"#""#g' $file_name
perl -i -pe 's#\Q"%s X11 proxy: %s\n"#"%s X11 代理: %s\\n"#g' $file_name
perl -i -pe 's#\Q"unable to connect to"#"无法连接到转发的 X 服务器: %s"#g' $file_name
perl -i -pe 's#\Q" forwarded X server: %s"#""#g' $file_name
perl -i -pe 's#\Q"Forwarded X11 connection terminated"#"转发的 X11 连接终止"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# utils/bufchain.c
file_name="utils/bufchain.c"
echo [57%]开始汉化 utils/bufchain.c
perl -i -pe 's#\Q"bufchain callback used while uninitialised"#"未初始化时使用的 bufchain 回调"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# utils/backend_socket_log.c
file_name="utils/backend_socket_log.c"
echo [58%]开始汉化 utils/backend_socket_log.c
perl -i -pe 's#\Q"Connecting to %s port %d"#"正在连接到 %s 端口 %d"#g' $file_name
perl -i -pe 's#\Q"Connecting to %s"#"连接到 %s"#g' $file_name
perl -i -pe 's#\Q"Failed to connect to %s: %s"#"连接失败 %s: %s"#g' $file_name
perl -i -pe 's#\Q"Connected to %s"#"连接到 %s"#g' $file_name
perl -i -pe 's#\Q"remote host"#"远程主机"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# utils/buildinfo.c
file_name="utils/buildinfo.c"
echo [59%]开始汉化 utils/buildinfo.c
perl -i -pe 's#\Q"Build platform: %d-bit %s"#"构建平台: %d 位 %s"#g' $file_name
perl -i -pe 's#\Q"%sCompiler: clang %s"#"%s编译器: clang %s 汉化: bbbboom、wanyanjiabin"#g' $file_name
perl -i -pe 's#\Q"%sCompiler: gcc %s"#"%s编译器: gcc %s 汉化: bbbboom、wanyanjiabin"#g' $file_name
perl -i -pe 's#\Q"%sCompiler: "#"%s编译器:  汉化: bbbboom、wanyanjiabin"#g' $file_name
perl -i -pe 's#\Q", unrecognised version"#", 未知版本"#g' $file_name
perl -i -pe 's#\Q"%sBuild option: NO_SECURITY"#"%s构建选项: NO_SECURITY"#g' $file_name
perl -i -pe 's#\Q"%sBuild option: NO_SECUREZEROMEMORY"#"%s构建选项: NO_SECUREZEROMEMORY"#g' $file_name
perl -i -pe 's#\Q"%sBuild option: NO_IPV6"#"%s构建选项: NO_IPV6"#g' $file_name
perl -i -pe 's#\Q"%sBuild option: NO_GSSAPI"#"%s构建选项: NO_GSSAPI"#g' $file_name
perl -i -pe 's#\Q"%sBuild option: STATIC_GSSAPI"#"%s构建选项: STATIC_GSSAPI"#g' $file_name
perl -i -pe 's#\Q"%sBuild option: UNPROTECT"#"%s构建选项: UNPROTECT"#g' $file_name
perl -i -pe 's#\Q"%sBuild option: FUZZING"#"%s构建选项: FUZZING"#g' $file_name
perl -i -pe 's#\Q"%sBuild option: DEBUG"#"%s构建选项: DEBUG"#g' $file_name
perl -i -pe 's#\Q"%sSource commit: %s"#"%s源代码提交: %s"#g' $file_name
perl -i -pe 's#\Q"%sBuild option: MINEFIELD"#"%s构建选项: MINEFIELD"#g' $file_name
perl -i -pe 's#\Q"%sEmbedded HTML Help file: %s"#"%s嵌入式 HTML 帮助文件: %s"#g' $file_name
perl -i -pe 's#\Q"%sCompiled against GTK version %s"#"%s针对 GTK 编译版本 %s"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# utils/host_strchr_internal.c
file_name="utils/host_strchr_internal.c"
echo [60%]开始汉化 utils/host_strchr_internal.c
perl -i -pe 's#\Q"passed %d failed %d total %d\n"#"通过 %d 失败 %d 共 %d\\n"#g' $file_name
perl -i -pe 's#\Q"fail: %s(%s,%s)%s = %u, expected %u\n"#"失败：%s(%s,%s)%s = %u，预期 %u\\n"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# utils/default_description.c
file_name="utils/default_description.c"
echo [61%]开始汉化 utils/default_description.c
perl -i -pe 's#\Q"%s connection to %s"#"%s 连接到 %s"#g' $file_name
perl -i -pe 's#\Q"%s connection to %s port %d"#"%s 连接到 %s 端口 %d"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# utils/sshutils.c
file_name="utils/sshutils.c"
echo [62%]开始汉化 utils/sshutils.c
perl -i -pe 's#\Q"this channel type should never receive OPEN_CONFIRMATION"#"此频道类型不应收到 OPEN_CONFIRMATION"#g' $file_name
perl -i -pe 's#\Q"this channel type should never receive OPEN_FAILURE"#"此频道类型不应收到 OPEN_FAILURE"#g' $file_name
perl -i -pe 's#\Q"this channel type should never send a want-reply request"#"此频道类型不应该发送想要回复的请求"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# windows/config.c
file_name="windows/config.c"
echo [63%]开始汉化 windows/config.c
perl -i -pe 's#\Q"About"#"关于(A)"#g' $file_name
perl -i -pe 's#\Q"Help"#"帮助(H)"#g' $file_name
perl -i -pe 's#\Q"Control the scrollback in the window"#"设置窗口回滚"#g' $file_name
perl -i -pe 's#\Q"Display scrollbar in full screen mode"#"全屏模式显示滚动条(I)"#g' $file_name
perl -i -pe 's#\Q"Enable extra keyboard features:"#"使用附加键盘特性："#g' $file_name
perl -i -pe 's#\Q"AltGr acts as Compose key"#"AltGr 动作为组合键"#g' $file_name
perl -i -pe 's#\Q"Control-Alt is different from AltGr"#"Ctrl+Alt 键与 AltGr 不同(D)"#g' $file_name
perl -i -pe 's#\Q"Set the style of bell"#"设置响铃类型"#g' $file_name
perl -i -pe 's#\Q"Play a custom sound file"#"播放指定的声音文件"#g' $file_name
perl -i -pe 's#\Q"Beep using the PC speaker"#"使用 PC 扬声器响铃"#g' $file_name
perl -i -pe 's#\Q"Custom sound file to play as a bell:"#"响铃时播放的声音文件："#g' $file_name
perl -i -pe 's#\Q"Select bell sound file"#"选择声音文件"#g' $file_name
perl -i -pe 's#\Q"Taskbar/caption indication on bell:"#"响铃任务栏/标题栏显示(I)："#g' $file_name
perl -i -pe 's#\Q"Disabled"#"禁止"#g' $file_name
perl -i -pe 's#\Q"Flashing"#"闪烁"#g' $file_name
perl -i -pe 's#\Q"Steady"#"反显"#g' $file_name
perl -i -pe 's#\Q"Adjust the window border"#"调整窗口边框"#g' $file_name
perl -i -pe 's#\Q"Sunken-edge border (slightly thicker)"#"下沉边框(细瘦外观)(S)"#g' $file_name
perl -i -pe 's#\Q"Font settings"#"字体设置"#g' $file_name
perl -i -pe 's#\Q"Allow selection of variable-pitch fonts"#"允许选择可变宽度字体"#g' $file_name
perl -i -pe 's#\Q"Font quality:"#"字体品质(Q)："#g' $file_name
perl -i -pe 's#\Q"Antialiased"#"抗锯齿"#g' $file_name
perl -i -pe 's#\Q"Non-Antialiased"#"无抗锯齿"#g' $file_name
perl -i -pe 's#\Q"Default"#"默认"#g' $file_name
perl -i -pe 's#\Q"Caps Lock acts as Cyrillic switch"#"Caps Lock 大写按键用于 Cyrillic 切换"#g' $file_name
perl -i -pe 's#\Q"Character set translation on received data"#"接收数据时字符集转换"#g' $file_name
perl -i -pe 's#\Q"(Codepages supported by Windows but not listed here, "#"(列表中没有的 Windows 代码页，"#g' $file_name
perl -i -pe 's#\Q"such as CP866 on many systems, can be entered manually)"#" 比如指定 CP866 代码页，可以手工输入到列表)"#g' $file_name
perl -i -pe 's#\Q"Adjust how %s displays line drawing characters"#"调整 %s 显示文本字符行"#g' $file_name
perl -i -pe 's#\Q"Font has XWindows encoding"#"使用 X Windows 字体"#g' $file_name
perl -i -pe 's#\Q"Use font in both ANSI and OEM modes"#"使用 ANSI 和 OEM 字体(B)"#g' $file_name
perl -i -pe 's#\Q"Use font in OEM mode only"#"只使用 OEM 字体"#g' $file_name
perl -i -pe 's#\Q"Formatting of pasted characters"#"粘贴字符的格式"#g' $file_name
perl -i -pe 's#\Q"Paste to clipboard in RTF as well as plain text"#"以RTF和纯文本格式粘贴到剪贴板"#g' $file_name
perl -i -pe 's#\Q"Formatting of copied characters"#"复制字符的格式"#g' $file_name
perl -i -pe 's#\Q"Copy to clipboard in RTF as well as plain text"#"以RTF和纯文本格式复制到剪贴板"#g' $file_name
perl -i -pe 's#\Q"Control use of mouse"#"鼠标使用控制"#g' $file_name
perl -i -pe 's#\Q"Action of mouse buttons:"#"鼠标按钮动作(M)："#g' $file_name
perl -i -pe 's#\Q"Windows (Middle extends, Right brings up menu)"#"Windows (中键扩展，右键弹出菜单)"#g' $file_name
perl -i -pe 's#\Q"Compromise (Middle extends, Right pastes)"#"混合模式 (中键扩展，右键粘贴)"#g' $file_name
perl -i -pe 's#\Q"xterm (Right extends, Middle pastes)"#"xterm (右键扩展，中键粘贴)"#g' $file_name
perl -i -pe 's#\Q"General options for colour usage"#"颜色使用常规设置"#g' $file_name
perl -i -pe 's#\Q"Attempt to use logical palettes"#"尝试使用逻辑调色板(L)"#g' $file_name
perl -i -pe 's#\Q"Use system colours"#"使用系统颜色(S)"#g' $file_name
perl -i -pe 's#\Q"Set the size of the window"#"设置窗口大小"#g' $file_name
perl -i -pe 's#\Q"When window is resized:"#"当窗口大小被改变时(Z)："#g' $file_name
perl -i -pe 's#\Q"Change the number of rows and columns"#"改变行列数"#g' $file_name
perl -i -pe 's#\Q"Change the size of the font"#"改变字体大小"#g' $file_name
perl -i -pe 's#\Q"Change font size only when maximised"#"只在最大化时改变字体大小"#g' $file_name
perl -i -pe 's#\Q"Forbid resizing completely"#"完全禁止大小改变"#g' $file_name
perl -i -pe 's#\Q"Window closes on ALT-F4"#"Alt+F4 关闭窗口"#g' $file_name
perl -i -pe 's#\Q"System menu appears on ALT-Space"#"Alt+空格显示系统菜单(Y)"#g' $file_name
perl -i -pe 's#\Q"System menu appears on ALT alone"#"Alt 键显示系统菜单"#g' $file_name
perl -i -pe 's#\Q"Ensure window is always on top"#"窗口总在最上层(E)"#g' $file_name
perl -i -pe 's#\Q"Full screen on Alt-Enter"#"Alt+回车全屏(F)"#g' $file_name
perl -i -pe 's#\Q"Local"#"本地"#g' $file_name
perl -i -pe 's#\Q"Telnet command, or local"#"Telnet 命令，或者本地"#g' $file_name
perl -i -pe 's#\Q" proxy command"#"代理命令(M)"#g' $file_name
perl -i -pe 's#\Q"X11 forwarding"#"X11 映射"#g' $file_name
perl -i -pe 's#\Q"X authority file for local display"#"用于本地显示的 X 认证文件(T)"#g' $file_name
perl -i -pe 's#\Q"Select X authority file"#"选择 X 认证文件"#g' $file_name
perl -i -pe 's#\Q"Terminal"#"终端"#g' $file_name
perl -i -pe 's#\Q"Terminal/Keyboard"#"终端/键盘"#g' $file_name
perl -i -pe 's#\Q"Terminal/Bell"#"终端/响铃"#g' $file_name
perl -i -pe 's#\Q"Terminal/Features"#"终端/特性"#g' $file_name
perl -i -pe 's#\Q"Window"#"窗口"#g' $file_name
perl -i -pe 's#\Q"Window/Appearance"#"窗口/外观"#g' $file_name
perl -i -pe 's#\Q"Window/Translation"#"窗口/转换"#g' $file_name
perl -i -pe 's#\Q"Window/Selection"#"窗口/选择"#g' $file_name
perl -i -pe 's#\Q"Window/Selection/Copy"#"窗口/选择/复制"#g' $file_name
perl -i -pe 's#\Q"Window/Colours"#"窗口/颜色"#g' $file_name
perl -i -pe 's#\Q"Window/Behaviour"#"窗口/行为"#g' $file_name
perl -i -pe 's#\Q"Connection/Proxy"#"连接/代理"#g' $file_name
perl -i -pe 's#\Q"Connection/SSH/X11"#"连接/SSH/X11"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# windows/conpty.c
file_name="windows/conpty.c"
echo [64%]开始汉化 windows/conpty.c
perl -i -pe 's#\Q"Error reading from console pty: %s"#"从控制台 pty 读取错误: %s"#g' $file_name
perl -i -pe 's#\Q"Unexpected end of file reading from console pty"#"从控制台 pty 读取文件意外结束"#g' $file_name
perl -i -pe 's#\Q"Error writing to conpty device"#"写入 conpty 设备时出错"#g' $file_name
perl -i -pe 's#\Q"Pseudo-console API is not available on this "#"伪控制台 API 在此 Windows 系统上不可用"#g' $file_name
perl -i -pe 's#\Q"Windows system"#""#g' $file_name
perl -i -pe 's#\Q"CreatePipe: %s"#"创建管道: %s"#g' $file_name
perl -i -pe 's#\Q"CreatePseudoConsole: %s"#"创建伪控制台: %s"#g' $file_name
perl -i -pe 's#\Q"CreatePseudoConsole failed: HRESULT=0x%08x"#"创建伪控制台失败: HRESULT=0x%08x"#g' $file_name
perl -i -pe 's#\Q"InitializeProcThreadAttributeList: %s"#"初始化proc线程属性列表: %s"#g' $file_name
perl -i -pe 's#\Q"UpdateProcThreadAttribute: %s"#"更新 proc 线程属性: %s"#g' $file_name
perl -i -pe 's#\Q"CreateProcess: %s"#"创建进程: %s"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# windows/console.c
file_name="windows/console.c"
echo [65%]开始汉化 windows/console.c
perl -i -pe 's#\Q"Cannot confirm a host key in batch mode"#"无法在批处理模式下确认主机密钥"#g' $file_name
perl -i -pe 's#\Q"Full public key:\n%s\n"#"完整的公钥:\\n%s\\n"#g' $file_name
perl -i -pe 's#\Q"SHA256 key fingerprint:\n%s\n"#"SHA256 密钥指纹:\\n%s\\n"#g' $file_name
perl -i -pe 's#\Q"MD5 key fingerprint:\n%s\n"#"MD5密钥指纹:\\n%s\\n"#g' $file_name
perl -i -pe 's#\Q"Cannot confirm a weak crypto primitive "#"无法在批处理模式下确认弱加密原语"#g' $file_name
perl -i -pe 's#\Q"in batch mode"#""#g' $file_name
perl -i -pe 's#\Q"Cannot confirm a weak cached host key "#"无法在批处理模式下确认弱缓存主机密钥"#g' $file_name
perl -i -pe 's#\Q"The session log file \"%.*s\" already exists.\n"#"会话日志文件 \\"%.*s\\" 已经存在。\\n"#g' $file_name
perl -i -pe 's#\Q"You can overwrite it with a new session log,\n"#"您可以用新的会话日志覆盖它,\\n"#g' $file_name
perl -i -pe 's#\Q"append your session log to the end of it,\n"#"将您的会话日志附加到它的末尾,\\n"#g' $file_name
perl -i -pe 's#\Q"or disable session logging for this session.\n"#"或禁用此会话的会话日志记录.\\n"#g' $file_name
perl -i -pe 's#\Q"Enter \"y\" to wipe the file, \"n\" to append to it,\n"#"输入 \\"y\\" 擦除文件，输入 \\"n\\" 附加到它,\\n"#g' $file_name
perl -i -pe 's#\Q"or just press Return to disable logging.\n"#"或者只需按 Return 即可禁用日志记录.\\n"#g' $file_name
perl -i -pe 's#\Q"Wipe the log file? (y/n, Return cancels logging) "#"擦除日志文件？ （y/n，Return 取消记录）"#g' $file_name
perl -i -pe 's#\Q"Logging will not be enabled.\n"#"不会启用日志记录。\\n"#g' $file_name
perl -i -pe 's#\Q"You are loading an SSH-2 private key which has an\n"#"您正在加载具有旧版本文件格式的 SSH-2 私钥。\\n"#g' $file_name
perl -i -pe 's#\Q"old version of the file format. This means your key\n"#"这意味着您的密钥文件不是完全防篡改的。 \\n"#g' $file_name
perl -i -pe 's#\Q"file is not fully tamperproof. Future versions of\n"#"PuTTY 的未来版本可能会停止支持这种私钥格式，\\n"#g' $file_name
perl -i -pe 's#\Q"PuTTY may stop supporting this private key format,\n"#"因此我们建议您将密钥转换为新格式。\\n"#g' $file_name
perl -i -pe 's#\Q"so we recommend you convert your key to the new\n"#""#g' $file_name
perl -i -pe 's#\Q"format.\n"#""#g' $file_name
perl -i -pe 's#\Q"Once the key is loaded into PuTTYgen, you can perform\n"#"将密钥加载到 PuTTYgen 后，您只需再次保存即可执行此转换。\\n"#g' $file_name
perl -i -pe 's#\Q"this conversion simply by saving it again.\n"#""#g' $file_name
perl -i -pe 's#\Q"These are the fingerprints of the PuTTY PGP Master Keys. They can\n"#"这些是 PuTTY PGP 主密钥的指纹。\\n"#g' $file_name
perl -i -pe 's#\Q"be used to establish a trust path from this executable to another\n"#"它们可用于建立从该可执行文件到另一个可执行文件的信任路径。\\n"#g' $file_name
perl -i -pe 's#\Q"one. See the manual for more information.\n"#"更多信息，请参阅手册。\\n"#g' $file_name
perl -i -pe 's#\Q"(Note: these fingerprints have nothing to do with SSH!)\n"#"（注意：这些指纹与 SSH 无关！）\\n"#g' $file_name
perl -i -pe 's#\Q"PuTTY Master Key as of "#"PuTTY 万能钥匙"#g' $file_name
perl -i -pe 's#\Q"Previous Master Key ("#"以前的万能钥匙 ("#g' $file_name
perl -i -pe 's#\Q"Cannot answer interactive prompts "#"无法回答交互式提示"#g' $file_name
perl -i -pe 's#\Q"Cannot get standard input handle\n"#"无法获得标准输入句柄\\n"#g' $file_name
perl -i -pe 's#\Q"Cannot get standard output handle\n"#"无法获得标准输出句柄\\n"#g' $file_name
perl -i -pe 's#\Q"Error reading from console"#"从控制台读取错误"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# windows/dialog.c
file_name="windows/dialog.c"
echo [66%]开始汉化 windows/dialog.c
perl -i -pe 's#\Q"None (printing disabled)"#"无 (禁止打印)"#g' $file_name
perl -i -pe 's#\Q"%s Event Log"#"%s 事件日志记录"#g' $file_name
perl -i -pe 's#\Q"%s Licence"#"%s 许可证"#g' $file_name
perl -i -pe 's#\Q"About %s"#"关于 %s"#g' $file_name
perl -i -pe 's#\Q"\251 "#"(C) "#g' $file_name
perl -i -pe 's#\Q". All rights reserved."#". 保留所有权利。"#g' $file_name
perl -i -pe 's#\Q"Cate&gory:"#"分类(&G)："#g' $file_name
perl -i -pe 's#\Q"%s Configuration"#"%s 配置"#g' $file_name
perl -i -pe 's#\Q"%s Error"#"%s 错误"#g' $file_name
perl -i -pe 's#\Q"%s Reconfiguration"#"%s 重新配置"#g' $file_name
perl -i -pe 's#\Q"The server'\''s host key is not cached in the registry. You\n"#"在系统注册表缓存中没有找到该服务器密钥。\\n"#g' $file_name
perl -i -pe 's#\Q"have no guarantee that the server is the computer you\n"#"不能保证该服务器是能够正确访问的计算机。\\n"#g' $file_name
perl -i -pe 's#\Q"think it is.\n"#""#g' $file_name
perl -i -pe 's#\Q"The server'\''s %s key fingerprint is:\n"#"该服务器的 %s 密钥指纹为:\\n"#g' $file_name
perl -i -pe 's#\Q"If you trust this host, hit Yes to add the key to\n"#"如果信任该主机，请点击 \\"是\\" 增加密钥到"#g' $file_name
perl -i -pe 's#\Q"%s'\''s cache and carry on connecting.\n"#" %s 缓存中并继续连接。\\n"#g' $file_name
perl -i -pe 's#\Q"If you want to carry on connecting just once, without\n"#"如果仅仅只希望进行本次连接，而不"#g' $file_name
perl -i -pe 's#\Q"adding the key to the cache, hit No.\n"#"将密钥储存，请点击 \\"否\\"。\\n"#g' $file_name
perl -i -pe 's#\Q"If you do not trust this host, hit Cancel to abandon the\n"#"如果不信任该主机，请点击 \\"取消\\" 放弃"#g' $file_name
perl -i -pe 's#\Q"connection.\n"#"连接。\\n"#g' $file_name
perl -i -pe 's#\Q"WARNING - POTENTIAL SECURITY BREACH!\n"#"**警告** - 潜在安全隐患！\\n"#g' $file_name
perl -i -pe 's#\Q"The server'\''s host key does not match the one %s has\n"#"在 %s 注册表缓存中不能匹配该服务器密钥。\\n"#g' $file_name
perl -i -pe 's#\Q"cached in the registry. This means that either the\n"#"这说明可能该服务器管理员更新了主机密钥，\\n"#g' $file_name
perl -i -pe 's#\Q"server administrator has changed the host key, or you\n"#"或者更可能是连接到了一台伪装成该服务器的\\n"#g' $file_name
perl -i -pe 's#\Q"have actually connected to another computer pretending\n"#"虚假计算机系统。\\n"#g' $file_name
perl -i -pe 's#\Q"to be the server.\n"#""#g' $file_name
perl -i -pe 's#\Q"The new %s key fingerprint is:\n"#"新的 %s 密钥指纹为:\\n"#g' $file_name
perl -i -pe 's#\Q"If you were expecting this change and trust the new key,\n"#"如果确信该密钥被更新同意接受新的密钥，\\n"#g' $file_name
perl -i -pe 's#\Q"hit Yes to update %s'\''s cache and continue connecting.\n"#"请点击 \\"是\\" 更新 %s 缓存并继续连接。\\n"#g' $file_name
perl -i -pe 's#\Q"If you want to carry on connecting but without updating\n"#"如果仅仅只希望继续本次连接，而不更新\\n"#g' $file_name
perl -i -pe 's#\Q"the cache, hit No.\n"#"系统缓存，请点击 \\"否\\"。\\n"#g' $file_name
perl -i -pe 's#\Q"If you want to abandon the connection completely, hit\n"#"如果希望完全放弃本次连接，请点击\\n"#g' $file_name
perl -i -pe 's#\Q"Cancel. Hitting Cancel is the ONLY guaranteed safe\n"#" \\"取消\\"。点击 \\"取消\\" 是**唯一**可以保证的安全"#g' $file_name
perl -i -pe 's#\Q"choice.\n"#"操作。\\n"#g' $file_name
perl -i -pe 's#\Q"%s Security Alert"#"%s 安全警告"#g' $file_name
perl -i -pe 's#\Q"The first %s supported by the server\n"#"服务器支持的第一个 %s\\n"#g' $file_name
perl -i -pe 's#\Q"is %s, which is below the configured\n"#"是 %s，其低于配置的"#g' $file_name
perl -i -pe 's#\Q"warning threshold.\n"#"警告阀值。\\n"#g' $file_name
perl -i -pe 's#\Q"Do you want to continue with this connection?\n"#"你要继续连接么？\\n"#g' $file_name
perl -i -pe 's#\Q"The first host key type we have stored for this server\n"#"我们储存的此服务器第一个主机密钥类型\\n"#g' $file_name
perl -i -pe 's#\Q"is %s, which is below the configured warning threshold.\n"#"为 %s，其低于配置的警告阀值。\\n"#g' $file_name
perl -i -pe 's#\Q"The server also provides the following types of host key\n"#"此服务器同时也提供有我们没有储存的高\\n"#g' $file_name
perl -i -pe 's#\Q"above the threshold, which we do not have stored:\n"#"于阀值的下列主机密钥类型：\\n"#g' $file_name
perl -i -pe 's#\Q"Do you want to continue with this connection?\n"#"你要继续连接么？\\n"#g' $file_name
perl -i -pe 's#\Q"The session log file \"%.*s\" already exists.\n"#"会话日志文件 \\"%.*s\\" 已经存在。\\n"#g' $file_name
perl -i -pe 's#\Q"You can overwrite it with a new session log,\n"#"你可以使用新会话日志覆盖旧文件，\\n"#g' $file_name
perl -i -pe 's#\Q"append your session log to the end of it,\n"#"或者在旧日志文件结尾增加新日志，\\n"#g' $file_name
perl -i -pe 's#\Q"or disable session logging for this session.\n"#"或在此会话中禁止日志记录。\\n"#g' $file_name
perl -i -pe 's#\Q"Hit Yes to wipe the file, No to append to it,\n"#"点击是覆盖为新文件，否附加到旧文件，\\n"#g' $file_name
perl -i -pe 's#\Q"or Cancel to disable logging."#"或者点击取消禁止日志记录。"#g' $file_name
perl -i -pe 's#\Q"%s Log to File"#"%s 日志记录到文件"#g' $file_name
perl -i -pe 's#\Q"%s Key File Warning"#"%s 密钥文件警告"#g' $file_name
perl -i -pe 's#\Q"You are loading an SSH-2 private key which has an\n"#"现在载入的是一个旧版本文件格式的 SSH2\\n"#g' $file_name
perl -i -pe 's#\Q"old version of the file format. This means your key\n"#" 私钥格式。这意味着该私钥文件不是\\n"#g' $file_name
perl -i -pe 's#\Q"file is not fully tamperproof. Future versions of\n"#"足够的安全。未来版本的 %s 可能会\\n"#g' $file_name
perl -i -pe 's#\Q"%s may stop supporting this private key format,\n"#"停止支持此私钥格式，\\n"#g' $file_name
perl -i -pe 's#\Q"so we recommend you convert your key to the new\n"#"建议将其转换为新的\\n"#g' $file_name
perl -i -pe 's#\Q"format.\n"#"格式。\\n"#g' $file_name
perl -i -pe 's#\Q"You can perform this conversion by loading the key\n"#"请使用 PuTTYgen 载入该密钥进行转换\\n"#g' $file_name
perl -i -pe 's#\Q"into PuTTYgen and then saving it again."#"然后保存。"#g' $file_name
perl -i -pe 's#\Q"Demo screenshot failure"#"演示截图失败"#g' $file_name
perl -i -pe 's#\Q"%s (port %d)"#"%s (端口 %d)"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name


# windows/gss.c
file_name="windows/gss.c"
echo [67%]开始汉化 windows/gss.c
perl -i -pe 's#\Q"Using GSSAPI from GSSAPI"#"使用 GSSAPI "#g' $file_name
perl -i -pe 's#\Q"Using SSPI from SECUR32.DLL"#"使用 SECUR32.DLL 中的 SSPI"#g' $file_name
perl -i -pe 's#\Q"Using GSSAPI from user-specified"#"使用用户指定的 GSSAPI"#g' $file_name
perl -i -pe 's#\Q"SSPI status OK"#"SSPI 状态正常"#g' $file_name
perl -i -pe 's#\Q"The handle passed to the function"#"传递给函数的句柄是无效的。"#g' $file_name
perl -i -pe 's#\Q" is invalid."#""#g' $file_name
perl -i -pe 's#\Q"The target was not recognized."#"目标未被识别。"#g' $file_name
perl -i -pe 's#\Q"The logon failed."#"登录失败。"#g' $file_name
perl -i -pe 's#\Q"The Local Security Authority cannot"#"无法联系当地安全机构。"#g' $file_name
perl -i -pe 's#\Q" be contacted."#""#g' $file_name
perl -i -pe 's#\Q"No credentials are available in the"#"安全包中没有可用的凭据。"#g' $file_name
perl -i -pe 's#\Q" security package."#""#g' $file_name
perl -i -pe 's#\Q"No authority could be contacted for authentication."#"无法联系任何机构进行身份验证。"#g' $file_name
perl -i -pe 's#\Q"The domain name of the authenticating party could be wrong,"#"身份验证方的域名可能是错误的，"#g' $file_name
perl -i -pe 's#\Q" the domain could be unreachable, or there might have been"#"域可能无法访问，或者可能存在信任关系失败。"#g' $file_name
perl -i -pe 's#\Q" a trust relationship failure."#""#g' $file_name
perl -i -pe 's#\Q"One or more of the SecBufferDesc structures passed as"#"作为 OUT 参数传递的一个或多个 SecBufferDesc 结构的缓冲区太小。"#g' $file_name
perl -i -pe 's#\Q" an OUT parameter has a buffer that is too small."#""#g' $file_name
perl -i -pe 's#\Q"The error is due to a malformed input token, such as a"#"该错误是由于输入标记格式错误造成的，例如"#g' $file_name
perl -i -pe 's#\Q" token corrupted in transit, a token"#"令牌在传输中损坏，令牌大小不正确，"#g' $file_name
perl -i -pe 's#\Q" of incorrect size, or a token passed into the wrong"#"或令牌传递给错误的安全包。"#g' $file_name
perl -i -pe 's#\Q" security package. Passing a token to"#""#g' $file_name
perl -i -pe 's#\Q" the wrong package can happen if client and server did not"#"如果客户端和服务器没有协商正确的安全包，"#g' $file_name
perl -i -pe 's#\Q" negotiate the proper security package."#"则可能会发生将令牌传递给错误包的情况。"#g' $file_name
perl -i -pe 's#\Q"Internal SSPI error"#"内部 SSPI 错误"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# windows/local-proxy.c
file_name="windows/local-proxy.c"
echo [68%]开始汉化 windows/local-proxy.c
perl -i -pe 's#\Q"Starting local proxy command: %s"#"启动本地代理命令：%s"#g' $file_name
perl -i -pe 's#\Q"Unable to create pipes for proxy command: %s"#"无法为代理命令创建管道: %s"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# windows/named-pipe-client.c
file_name="windows/named-pipe-client.c"
echo [69%]开始汉化 windows/named-pipe-client.c
perl -i -pe 's#\Q"Unable to open named pipe '\''%s'\'': %s"#"无法打开命名管道 %s: %s"#g' $file_name
perl -i -pe 's#\Q"Error waiting for named pipe '\''%s'\'': %s"#"等待命名管道时出错 %s: %s"#g' $file_name
perl -i -pe 's#\Q"Unable to get user SID: %s"#"无法获取用户 SID: %s"#g' $file_name
perl -i -pe 's#\Q"Unable to get named pipe security information: %s"#"无法获取命名管道安全信息：%s"#g' $file_name
perl -i -pe 's#\Q"Owner of named pipe '\''%s'\'' is not us"#"命名管道“%s”的所有者不是我们"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# windows/named-pipe-server.c
file_name="windows/named-pipe-server.c"
echo [70%]开始汉化 windows/named-pipe-server.c
perl -i -pe 's#\Q"Error while listening to named pipe: %s"#"侦听命名管道时出错：%s"#g' $file_name
perl -i -pe 's#\Q"unable to create named pipe '\''%s'\'': %s"#"无法创建命名管道“%s”: %s"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# windows/network.c
file_name="windows/network.c"
echo [71%]开始汉化 windows/network.c
perl -i -pe 's#\Q"PuTTY was built without IPv6 support"#"PuTTY 无 IPv6 支持编译版"#g' $file_name
perl -i -pe 's#\Q"Unable to load any WinSock library"#"无法加载任何 WinSock 库"#g' $file_name
perl -i -pe 's#\Q"Unable to initialise WinSock"#"无法初始化 WinSock"#g' $file_name
perl -i -pe 's#\Q"Network error: Permission denied"#"网络错误：权限被拒绝"#g' $file_name
perl -i -pe 's#\Q"Network error: Address already in use"#"网络错误：地址已在使用中"#g' $file_name
perl -i -pe 's#\Q"Network error: Cannot assign requested address"#"网络错误：无法分配请求的地址"#g' $file_name
perl -i -pe 's#\Q"Network error: Address family not supported by protocol family"#"网络错误：协议系列不支持地址系列"#g' $file_name
perl -i -pe 's#\Q"Network error: Operation already in progress"#"网络错误：操作已在进行中"#g' $file_name
perl -i -pe 's#\Q"Network error: Software caused connection abort"#"网络错误：软件导致连接中止"#g' $file_name
perl -i -pe 's#\Q"Network error: Connection refused"#"网络错误：连接被拒绝"#g' $file_name
perl -i -pe 's#\Q"Network error: Connection reset by peer"#"网络错误：对等方重置连接"#g' $file_name
perl -i -pe 's#\Q"Network error: Destination address required"#"网络错误：需要目标地址"#g' $file_name
perl -i -pe 's#\Q"Network error: Bad address"#"网络错误：地址错误"#g' $file_name
perl -i -pe 's#\Q"Network error: Host is down"#"网络错误：主机已关闭"#g' $file_name
perl -i -pe 's#\Q"Network error: No route to host"#"网络错误：没有到主机的路由"#g' $file_name
perl -i -pe 's#\Q"Network error: Operation now in progress"#"网络错误：操作正在进行中"#g' $file_name
perl -i -pe 's#\Q"Network error: Interrupted function call"#"网络错误：函数调用中断"#g' $file_name
perl -i -pe 's#\Q"Network error: Invalid argument"#"网络错误：参数无效"#g' $file_name
perl -i -pe 's#\Q"Network error: Socket is already connected"#"网络错误：套字节已连接"#g' $file_name
perl -i -pe 's#\Q"Network error: Too many open files"#"网络错误：打开的文件太多"#g' $file_name
perl -i -pe 's#\Q"Network error: Message too long"#"网络错误：消息太长"#g' $file_name
perl -i -pe 's#\Q"Network error: Network is down"#"网络错误：网络已关闭"#g' $file_name
perl -i -pe 's#\Q"Network error: Network dropped connection on reset"#"网络错误：重置时网络断开连接"#g' $file_name
perl -i -pe 's#\Q"Network error: Network is unreachable"#"网络错误：网络不可达"#g' $file_name
perl -i -pe 's#\Q"Network error: No buffer space available"#"网络错误：没有可用的缓冲区空间"#g' $file_name
perl -i -pe 's#\Q"Network error: Bad protocol option"#"网络错误：错误的协议选项"#g' $file_name
perl -i -pe 's#\Q"Network error: Socket is not connected"#"网络错误：套字节未连接"#g' $file_name
perl -i -pe 's#\Q"Network error: Socket operation on non-socket"#"网络错误：非套字节上的套字节操作"#g' $file_name
perl -i -pe 's#\Q"Network error: Operation not supported"#"网络错误：不支持操作"#g' $file_name
perl -i -pe 's#\Q"Network error: Protocol family not supported"#"网络错误：不支持协议族"#g' $file_name
perl -i -pe 's#\Q"Network error: Too many processes"#"网络错误：进程过多"#g' $file_name
perl -i -pe 's#\Q"Network error: Protocol not supported"#"网络错误：不支持协议"#g' $file_name
perl -i -pe 's#\Q"Network error: Protocol wrong type for socket"#"网络错误：套字节的协议类型错误"#g' $file_name
perl -i -pe 's#\Q"Network error: Cannot send after socket shutdown"#"网络错误：套字节关闭后无法发送"#g' $file_name
perl -i -pe 's#\Q"Network error: Socket type not supported"#"网络错误：不支持套字节类型"#g' $file_name
perl -i -pe 's#\Q"Network error: Connection timed out"#"网络错误：连接超时"#g' $file_name
perl -i -pe 's#\Q"Network error: Resource temporarily unavailable"#"网络错误：资源暂时不可用"#g' $file_name
perl -i -pe 's#\Q"Network error: Graceful shutdown in progress"#"网络错误：正在进行正常关机"#g' $file_name
perl -i -pe 's#\Q"Network is down"#"网络已关闭"#g' $file_name
perl -i -pe 's#\Q"Host does not exist"#"主机不存在"#g' $file_name
perl -i -pe 's#\Q"Host not found"#"主机未找到"#g' $file_name
perl -i -pe 's#\Q"gethostbyname: unknown error"#"gethostbyname：未知错误"#g' $file_name
perl -i -pe 's#\Q"<unknown>"#"<未知>"#g' $file_name
perl -i -pe 's#\Q"bad address family in sk_addrcopy"#"sk_addrcopy 中的错误地址系列"#g' $file_name
perl -i -pe 's#\Q"unix sockets not supported on this platform"#"此平台不支持 unix 套字节"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# windows/pageant.c
file_name="windows/pageant.c"
echo [72%]开始汉化 windows/pageant.c
perl -i -pe 's#\Q"Pageant Fatal Error"#"Pageant 致命错误"#g' $file_name
perl -i -pe 's#\Q"\251 "#"(C) "#g' $file_name
perl -i -pe 's#\Q". All rights reserved."#". 保留所有权利。"#g' $file_name
perl -i -pe 's#\Q"PuTTY Key File Warning"#"PuTTY 密钥文件警告"#g' $file_name
perl -i -pe 's#\Q"You are loading an SSH-2 private key which has an\n"#"现在载入的是一个旧版本文件格式的 SSH2\\n"#g' $file_name
perl -i -pe 's#\Q"old version of the file format. This means your key\n"#" 私钥格式。这意味着该私钥文件不是\\n"#g' $file_name
perl -i -pe 's#\Q"file is not fully tamperproof. Future versions of\n"#"足够的安全。未来版本的 PuTTY 可能会\\n"#g' $file_name
perl -i -pe 's#\Q"PuTTY may stop supporting this private key format,\n"#"停止对该私钥格式的支持。\\n"#g' $file_name
perl -i -pe 's#\Q"so we recommend you convert your key to the new\n"#"建议将其转换为新的\\n"#g' $file_name
perl -i -pe 's#\Q"format.\n"#"格式。\\n"#g' $file_name
perl -i -pe 's#\Q"You can perform this conversion by loading the key\n"#"请使用 PuTTYgen 载入该密钥进行转换\\n"#g' $file_name
perl -i -pe 's#\Q"into PuTTYgen and then saving it again."#"然后保存。"#g' $file_name
perl -i -pe 's#\Q"Select Private Key File"#"选择私钥文件"#g' $file_name
perl -i -pe 's#\Q"Pageant (PuTTY authentication agent)"#"Pageant (PuTTY 认证代理)"#g' $file_name
perl -i -pe 's#\Q"(No sessions)"#"(没有会话)"#g' $file_name
perl -i -pe 's#\Q"Unable to execute PuTTY!"#"无法执行 PuTTY！"#g' $file_name
perl -i -pe 's#\Q"Error"#"错误"#g' $file_name
perl -i -pe 's#\Q"Windows refuses to report a version"#"Windows 拒绝报告版本"#g' $file_name
perl -i -pe 's#\Q"Unable to access security APIs. Pageant will\n"#"无法访问安全认证 API 函数。\\nPageant"#g' $file_name
perl -i -pe 's#\Q"not run, in case it causes a security breach."#"无法运行，因为存在安全隐患。"#g' $file_name
perl -i -pe 's#\Q"Pageant Fatal Error"#"Pageant 致命错误"#g' $file_name
perl -i -pe 's#\Q"This program has been compiled for Win9X and will\n"#"本程序在 Win9x 下编译，无法运行在 NT 系统。\\n"#g' $file_name
perl -i -pe 's#\Q"not run on NT, in case it causes a security breach."#"因为存在安全隐患。"#g' $file_name
perl -i -pe 's#\Q"Pageant is already running"#"Pageant 已经运行了"#g' $file_name
perl -i -pe 's#\Q"Pageant Error"#"Pageant 错误"#g' $file_name
perl -i -pe 's#\Q"&New Session"#"新会话(&N)"#g' $file_name
perl -i -pe 's#\Q"&Saved Sessions"#"保存会话(&S)"#g' $file_name
perl -i -pe 's#\Q"&View Keys"#"查看密钥(&V)"#g' $file_name
perl -i -pe 's#\Q"Add &Key"#"增加密钥(&K)"#g' $file_name
perl -i -pe 's#\Q"&Help"#"帮助(&H)"#g' $file_name
perl -i -pe 's#\Q"&About"#"关于(&A)"#g' $file_name
perl -i -pe 's#\Q"E&xit"#"退出(&X)"#g' $file_name
perl -i -pe 's#\Q"Add key (encrypted)"#"增加密钥(加密)"#g' $file_name
perl -i -pe 's#\Q"Remove All Keys"#"删除所有密钥"#g' $file_name
perl -i -pe 's#\Q"Re-encrypt All Keys"#"重新加密所有密钥"#g' $file_name
perl -i -pe 's#\Q"Error: "#"错误："#g' $file_name
perl -i -pe 's#\Q"Error code: "#"错误代码："#g' $file_name
perl -i -pe 's#\Q"Unable to read configuration file, falling back to defaults"#"无法读取配置文件，回退到默认值"#g' $file_name
perl -i -pe 's#\Q"Unable to ExpandEnvironmentStrings for session path"#"无法展开会话路径的环境字符串"#g' $file_name
perl -i -pe 's#\Q"unable to get user SID"#"无法获取用户 SID"#g' $file_name
perl -i -pe 's#\Q"unable to get default SID"#"无法获取默认 SID"#g' $file_name
perl -i -pe 's#\Q"unable to get owner of file mapping: "#"无法获取文件映射的所有者："#g' $file_name
perl -i -pe 's#\Q"GetSecurityInfo returned: %s"#"GetSecurityInfo 返回： %s"#g' $file_name
perl -i -pe 's#\Q"wrong owning SID of file mapping"#"文件映射的拥有 SID 错误"#g' $file_name
perl -i -pe 's#\Q"security APIs not present\n"#"安全 API 不存在\\n"#g' $file_name
perl -i -pe 's#\Q"unable to obtain view of file mapping: %s"#"无法获得文件映射视图: %s"#g' $file_name
perl -i -pe 's#\Q"unable to query view of file mapping: %s"#"无法查询文件映射视图: %s"#g' $file_name
perl -i -pe 's#\Q"VirtualQuery returned too little data to get "#"VirtualQuery 返回的数据太少，无法获取区域大小"#g' $file_name
perl -i -pe 's#\Q"region size"#""#g' $file_name
perl -i -pe 's#\Q"mapping smaller than smallest possible request"#"映射小于可能的最小请求"#g' $file_name
perl -i -pe 's#\Q"Failed to run \"%s\": %s: %s"#"无法运行 %s: %s"#g' $file_name
perl -i -pe 's#\Q"Pageant can'\''t create a LogContext, so this can'\''t be called"#"Pageant 不能创建 LogContext，所以不能调用这个"#g' $file_name
perl -i -pe 's#\Q"unrecognised command-line option\n"#"无法识别的命令行选项\\n"#g' $file_name
perl -i -pe 's#\Q"Pageant command-line syntax error"#"Pageant命令行语法错误"#g' $file_name
perl -i -pe 's#\Q"Unable to open named pipe at %s "#"无法在 %s 处为 SSH 代理打开命名管道:\\n%s"#g' $file_name
perl -i -pe 's#\Q"for SSH agent:\n%s"#""#g' $file_name
perl -i -pe 's#\Q"Failed to run \"%s\": %s"#"无法运行 \\"%s\\": %s"#g' $file_name
perl -i -pe 's#\Q"Pageant command line error"#"Pageant 命令行错误"#g' $file_name
perl -i -pe 's#\Q"unrecognised option '\''%s'\''\n"#"无法识别的选项 '\''%s'\''\\n"#g' $file_name
perl -i -pe 's#\Q"Unable to write OpenSSH config "#"无法将 OpenSSH 配置文件写入 %s"#g' $file_name
perl -i -pe 's#\Q"file to %s"#""#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# windows/pageant.rc
file_name="windows/pageant.rc"
echo [73%]开始汉化 windows/pageant.rc
perl -i -pe 's#\Q"PuTTY SSH authentication agent"#"PuTTY SSH 认证代理"#g' $file_name
perl -i -pe 's#\Q"Pageant: Enter Passphrase"#"Pageant: 输入密码"#g' $file_name
perl -i -pe 's#\Q"Enter passphrase for key"#"请输入密钥的密码"#g' $file_name
perl -i -pe 's#\Q"O&K"#"确定(&K)"#g' $file_name
perl -i -pe 's#\Q"&Cancel"#"取消(&C)"#g' $file_name
perl -i -pe 's#\Q"Pageant Key List"#"Pageant 密钥列表"#g' $file_name
perl -i -pe 's#\Q"&Add Key"#"增加密钥(&A)"#g' $file_name
perl -i -pe 's#\Q"&Remove Key"#"移除密钥(&R)"#g' $file_name
perl -i -pe 's#\Q"&Help"#"帮助(&H)"#g' $file_name
perl -i -pe 's#\Q"&Close"#"关闭(&C)"#g' $file_name
perl -i -pe 's#\Q"About Pageant"#"关于 Pageant"#g' $file_name
perl -i -pe 's#\Q"&Close"#"关闭(&C)"#g' $file_name
perl -i -pe 's#\Q"View &Licence"#"查看许可证(&L)"#g' $file_name
perl -i -pe 's#\Q"Visit &Web Site"#"查看网站 (&W)"#g' $file_name
perl -i -pe 's#\Q"PuTTY Licence"#"PuTTY 许可证"#g' $file_name
perl -i -pe 's#\Q"OK"#"确定"#g' $file_name
perl -i -pe 's#\Q"Add Key (&encrypted)"#"增加密钥(&加密)"#g' $file_name
perl -i -pe 's#\Q"Re-e&ncrypt"#"重新加密"#g' $file_name
perl -i -pe 's#\Q"&Remove"#"删除"#g' $file_name
perl -i -pe 's#\Q"&Fingerprint type:"#"指纹类型"#g' $file_name
perl -i -pe 's#\Q"Pageant: Loading Encrypted Key"#"Pageant：加载加密密钥"#g' $file_name
perl -i -pe 's#\Q"Enter passphrase to load key"#"输入密码以加载密钥"#g' $file_name
perl -i -pe 's#\Q"Pageant: Decrypting Stored Key"#"Pageant：解密存储的密钥"#g' $file_name
perl -i -pe 's#\Q"A client of Pageant wants to use the following encrypted key:"#"Pageant的一个连接想要使用以下加密密钥："#g' $file_name
perl -i -pe 's#\Q"If you intended this, click in this box to make sure it has"#"如果您打算这样做，请单击此框以确保它具有输入焦点，"#g' $file_name
perl -i -pe 's#\Q"input focus, then enter the passphrase to decrypt the key."#"然后输入密码来解密密钥。"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name


# windows/platform.h
file_name="windows/platform.h"
echo [74%]开始汉化 windows/platform.h
perl -i -pe 's#\Q"PuTTY Private Key Files (*.ppk)\0*.ppk\0"#"PuTTY 私钥文件 (*.ppk)\\0*.ppk\\0"#g' $file_name
perl -i -pe 's#\Q"All Files (*.*)\0*\0\0\0"#"所有文件 (*.*)\\0*\\0\\0\\0"#g' $file_name
perl -i -pe 's#\Q"Wave Files (*.wav)\0*.WAV\0"#"声音文件 (*.wav)\\0*.WAV\\0"#g' $file_name
perl -i -pe 's#\Q"Dynamic Library Files (*.dll)\0*.dll\0"#"动态链接库文件 (*.dll)\\0*.dll\\0"#g' $file_name
perl -i -pe 's#\Q"system clipboard"#"系统剪贴板"#g' $file_name
perl -i -pe 's#\Q"System clipboard"#"系统剪贴板"#g' $file_name
perl -i -pe 's#\Q"Last selected text"#"上次选择的文本"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# windows/plink.c
file_name="windows/plink.c"
echo [75%]开始汉化 windows/plink.c
perl -i -pe 's#\Q"Plink: command-line connection utility\n"#"Plink: 命令行连接工具\\n"#g' $file_name
perl -i -pe 's#\Q"Usage: plink [options] [user@]host [command]\n"#"用法: plink [选项] [用户名@]主机 [命令]\\n"#g' $file_name
perl -i -pe 's#\Q"       (\"host\" can also be a PuTTY saved session name)\n"#"       (\\"主机\\" 也可以是 PuTTY 已有的会话名称)\\n"#g' $file_name
perl -i -pe 's#\Q"Options:\n"#"选项:\\n"#g' $file_name
perl -i -pe 's#\Q"  -V        print version information and exit\n"#"  -V        显示版本信息后退出\\n"#g' $file_name
perl -i -pe 's#\Q"  -pgpfp    print PGP key fingerprints and exit\n"#"  -pgpfp    显示 PGP 密钥指纹后退出\\n"#g' $file_name
perl -i -pe 's#\Q"  -v        show verbose messages\n"#"  -v        显示详细信息\\n"#g' $file_name
perl -i -pe 's#\Q"  -load sessname  Load settings from saved session\n"#"  -load 会话名  载入保存的会话信息\\n"#g' $file_name
perl -i -pe 's#\Q"            force use of a particular protocol\n"#"            强制使用特定协议\\n"#g' $file_name
perl -i -pe 's#\Q"  -P port   connect to specified port\n"#"  -P 端口   连接指定的端口\\n"#g' $file_name
perl -i -pe 's#\Q"  -l user   connect with specified username\n"#"  -l 用户名 使用指定的用户名连接\\n"#g' $file_name
perl -i -pe 's#\Q"  -batch    disable all interactive prompts\n"#"  -batch    禁止所有交互提示\\n"#g' $file_name
perl -i -pe 's#\Q"  -no-sanitise-stderr  don'\''t strip control chars from"#"  -no-sanitise-stderr  不要从标准错误中"#g' $file_name
perl -i -pe 's#\Q" standard error\n"#" 删除控制字符\\n"#g' $file_name
perl -i -pe 's#\Q"  -proxycmd command\n"#"  -proxycmd 命令\\n"#g' $file_name
perl -i -pe 's#\Q"            use '\''command'\'' as local proxy\n"#"            使用 '\''命令'\'' 作为本地代理\\n"#g' $file_name
perl -i -pe 's#\Q"  -sercfg configuration-string (e.g. 19200,8,n,1,X)\n"#"  -sercfg 配置字符串 (例如: 19200,8,n,1,X)\\n"#g' $file_name
perl -i -pe 's#\Q"            Specify the serial configuration (serial only)\n"#"            指定串口配置(仅限串口)\\n"#g' $file_name
perl -i -pe 's#\Q"The following options only apply to SSH connections:\n"#"以下选项仅适用于 SSH 连接:\\n"#g' $file_name
perl -i -pe 's#\Q"  -pw passw login with specified password\n"#"  -pw 密码  使用指定的密码登录\\n"#g' $file_name
perl -i -pe 's#\Q"  -D [listen-IP:]listen-port\n"#"  -D [监听-IP:]监听-端口\\n"#g' $file_name
perl -i -pe 's#\Q"            Dynamic SOCKS-based port forwarding\n"#"            基于 SOCKS 协议的动态端口转发\\n"#g' $file_name
perl -i -pe 's#\Q"  -L [listen-IP:]listen-port:host:port\n"#"  -L [监听-IP:]监听-端口:主机:端口\\n"#g' $file_name
perl -i -pe 's#\Q"            Forward local port to remote address\n"#"            转发本地端口到远程地址\\n"#g' $file_name
perl -i -pe 's#\Q"  -R [listen-IP:]listen-port:host:port\n"#"  -R [监听-IP:]监听-端口:主机:端口\\n"#g' $file_name
perl -i -pe 's#\Q"            Forward remote port to local address\n"#"            转发远程端口到本地地址\\n"#g' $file_name
perl -i -pe 's#\Q"  -X -x     enable / disable X11 forwarding\n"#"  -X -x     启禁用 X11 转发\\n"#g' $file_name
perl -i -pe 's#\Q"  -A -a     enable / disable agent forwarding\n"#"  -A -a     启禁用 agent 转发\\n"#g' $file_name
perl -i -pe 's#\Q"  -t -T     enable / disable pty allocation\n"#"  -t -T     启禁用 pty 转发\\n"#g' $file_name
perl -i -pe 's#\Q"  -1 -2     force use of particular protocol version\n"#"  -1 -2     强制使用特定协议版本\\n"#g' $file_name
perl -i -pe 's#\Q"  -4 -6     force use of IPv4 or IPv6\n"#"  -4 -6     强制使用 IPv4 或 IPv6 版本\\n"#g' $file_name
perl -i -pe 's#\Q"  -C        enable compression\n"#"  -C        允许压缩\\n"#g' $file_name
perl -i -pe 's#\Q"  -i key    private key file for user authentication\n"#"  -i 密钥   认证使用的密钥文件\\n"#g' $file_name
perl -i -pe 's#\Q"  -noagent  disable use of Pageant\n"#"  -noagent  禁用 Pageant 认证代理\\n"#g' $file_name
perl -i -pe 's#\Q"  -agent    enable use of Pageant\n"#"  -agent    启用 Pageant 认证代理\\n"#g' $file_name
perl -i -pe 's#\Q"  -noshare  disable use of connection sharing\n"#"  -noshare  禁用连接共享\\n"#g' $file_name
perl -i -pe 's#\Q"  -share    enable use of connection sharing\n"#"  -share    启用连接共享\\n"#g' $file_name
perl -i -pe 's#\Q"            manually specify a host key (may be repeated)\n"#"            手动指定主机密钥(可能重复)\\n"#g' $file_name
perl -i -pe 's#\Q"            do/don'\''t strip control chars from standard "#"            允许/请勿从标准输出/错误中"#g' $file_name
perl -i -pe 's#\Q"output/error\n"#"删除控制字符\\n"#g' $file_name
perl -i -pe 's#\Q"  -no-antispoof   omit anti-spoofing prompt after "#"  -no-antispoof   身份验证后省略"#g' $file_name
perl -i -pe 's#\Q"authentication\n"#"反欺骗提示\\n"#g' $file_name
perl -i -pe 's#\Q"  -m file   read remote command(s) from file\n"#"  -m 文件   从文件读取远程命令\\n"#g' $file_name
perl -i -pe 's#\Q"  -s        remote command is an SSH subsystem (SSH-2 only)\n"#"  -s        SSH 子系统远程命令(仅限 SSH-2)\\n"#g' $file_name
perl -i -pe 's#\Q"  -N        don'\''t start a shell/command (SSH-2 only)\n"#"  -N        不启动 shell 或执行命令(仅限 SSH-2)\\n"#g' $file_name
perl -i -pe 's#\Q"  -nc host:port\n"#"  -nc 主机:端口\\n"#g' $file_name
perl -i -pe 's#\Q"            open tunnel in place of session (SSH-2 only)\n"#"            打开隧道代替会话(仅限 SSH-2)\\n"#g' $file_name
perl -i -pe 's#\Q"  -sshlog file\n"#"  -sshlog 文件\\n"#g' $file_name
perl -i -pe 's#\Q"  -sshrawlog file\n"#"  -sshrawlog 文件\\n"#g' $file_name
perl -i -pe 's#\Q"            log protocol details to a file\n"#"            记录协议详细日志到指定文件\\n"#g' $file_name
perl -i -pe 's#\Q"            test whether a connection-sharing upstream exists\n"#"            测试是否存在上游共享连接\\n"#g' $file_name
perl -i -pe 's#\Q"Network is down"#"网络中断"#g' $file_name
perl -i -pe 's#\Q"WSAEventSelect(): unknown error"#"WSAEventSelect(): 未知错误"#g' $file_name
perl -i -pe 's#\Q"Unable to read from standard input: %s\n"#"无法从标准输入中读取: %s\\n"#g' $file_name
perl -i -pe 's#\Q"Unable to write to standard %s: %s\n"#"无法写入到标准 %s: %s\\n"#g' $file_name
perl -i -pe 's#\Q"plink: option \"%s\" requires an argument\n"#"plink: 选项 \\"%s\\" 需要一个参数\\n"#g' $file_name
perl -i -pe 's#\Q"plink: unknown option \"%s\"\n"#"plink: 未知选项 \\"%s\\"\\n"#g' $file_name
perl -i -pe 's#\Q"Internal fault: Unsupported protocol found\n"#"内部错误：发现不支持的协议\\n"#g' $file_name
perl -i -pe 's#\Q"Plink requires WinSock 2\n"#"Plink 需要 WinSock 2\\n"#g' $file_name
perl -i -pe 's#\Q"            disconnect if SSH authentication succeeds trivially\n"#"            如果 SSH 身份验证成功，则断开连接\\n"#g' $file_name
perl -i -pe 's#\Q"            control what happens when a log file already exists\n"#"            控制当日志文件已经存在时会发生什么\\n"#g' $file_name
perl -i -pe 's#\Q"Plink doesn'\''t support %s, which needs terminal emulation\n"#"Plink 不支持 %s，需要终端仿真\\n"#g' $file_name
perl -i -pe 's#\Q"Connection sharing not supported for this "#"此连接类型(%s)不支持连接共享\\n"#g' $file_name
perl -i -pe 's#\Q"connection type (%s)'\''\n"#""#g' $file_name
perl -i -pe 's#\Q"Running with restricted process ACL"#"使用受限进程 ACL 运行"#g' $file_name
perl -i -pe 's#\Q"Unable to open connection:\n%s"#"无法打开连接:\\n%s"#g' $file_name
perl -i -pe 's#\Q"Remote process exit code unavailable\n"#"远程进程退出代码不可用\\n"#g' $file_name
perl -i -pe 's#\Q"            force use of the bare ssh-connection protocol\n"#"            强制使用裸 ssh 连接协议\\n"#g' $file_name
perl -i -pe 's#\Q"  -pwfile file   login with password read from specified file\n"#"  -pwfile file   使用从指定文件读取的密码登录\\n"#g' $file_name
perl -i -pe 's#\Q"  -1 -2     force use of particular SSH protocol version\n"#"  -1 -2     强制使用特定的 SSH 协议版本\\n"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# windows/plink.rc
file_name="windows/plink.rc"
echo [76%]开始汉化 windows/plink.rc
perl -i -pe 's#\Q"Command-line SSH, Telnet, and Rlogin client"#"命令行 SSH、Telnet 和 Rlogin 客户端"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# windows/pscp.rc
file_name="windows/pscp.rc"
echo [77%]开始汉化 windows/pscp.rc
perl -i -pe 's#\Q"Command-line SCP/SFTP client"#"命令行 SCP/SFTP 客户端"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# windows/psftp.rc
file_name="windows/psftp.rc"
echo [78%]开始汉化 windows/psftp.rc
perl -i -pe 's#\Q"Command-line interactive SFTP client"#"命令行交互 SFTP 客户端"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# windows/pterm.c
file_name="windows/pterm.c"
echo [79%]开始汉化 windows/pterm.c
perl -i -pe 's#\Q"option \"%s\" requires an argument"#"选项 \\"%s\\" 需要一个参数"#g' $file_name
perl -i -pe 's#\Q"unrecognised option \\"%s\\""#"无法识别的选项“%s”"#g' $file_name
perl -i -pe 's#\Q"unexpected non-option argument \"%s\""#"意外的非选项参数 \\"%s\\""#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# windows/pterm.rc
file_name="windows/pterm.rc"
echo [80%]开始汉化 windows/pterm.rc
perl -i -pe 's#\Q"PuTTY-style wrapper for Windows command prompts"#"Windows 命令提示符的 PuTTY 样式包装器"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# windows/putty.c
file_name="windows/putty.c"
echo [81%]开始汉化 windows/putty.c
perl -i -pe 's#\Q"option \"%s\" requires an argument"#"选项 \\"%s\\" 需要一个参数"#g' $file_name
perl -i -pe 's#\Q"This procedure will remove ALL Registry entries\n"#"此过程将删除所有与 %s 相关联\\n"#g' $file_name
perl -i -pe 's#\Q"associated with %s, and will also remove\n"#"注册表项目，并且还将删除随机\\n"#g' $file_name
perl -i -pe 's#\Q"the random seed file. (This only affects the\n"#"种子文件。（这只会影响到当前\\n"#g' $file_name
perl -i -pe 's#\Q"currently logged-in user.)\n"#"登录的用户。）\\n"#g' $file_name
perl -i -pe 's#\Q"THIS PROCESS WILL DESTROY YOUR SAVED SESSIONS.\n"#"此操作将会摧毁你保存的会话。\\n"#g' $file_name
perl -i -pe 's#\Q"Are you really sure you want to continue?"#"真的确定要继续么？"#g' $file_name
perl -i -pe 's#\Q"%s Warning"#"%s 警告"#g' $file_name
perl -i -pe 's#\Q"%s expects an output filename"#"%s 需要一个输出文件名"#g' $file_name
perl -i -pe 's#\Q"%s expects input and output filenames"#"%s 需要输入和输出文件名"#g' $file_name
perl -i -pe 's#\Q"can'\''t open input file '\''%s'\''"#"无法打开输入文件“%s”"#g' $file_name
perl -i -pe 's#\Q"unexpected argument \"%s\""#"意外参数“%s”"#g' $file_name
perl -i -pe 's#\Q"unknown option \"%s\""#"未知选项“%s”"#g' $file_name
perl -i -pe 's#\Q"Unsupported protocol number found"#"发现不支持的协议号"#g' $file_name
perl -i -pe 's#\Q"%s Internal Error"#"%s 内部错误"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# windows/putty.rc
file_name="windows/putty.rc"
echo [82%]开始汉化 windows/putty.rc
perl -i -pe 's#\Q"SSH, Telnet and Rlogin client"#"SSH、Telnet 和 Rlogin 客户端"#g' $file_name
perl -i -pe 's#\Q"SSH, Telnet, Rlogin, and SUPDUP client"#"SSH、Telnet、Rlogin 和 SUPDUP 客户端"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# windows/putty-common.rc2
file_name="windows/putty-common.rc2"
echo [83%]开始汉化 windows/putty-common.rc2
perl -i -pe 's#\Q"About PuTTY"#"关于 PuTTY"#g' $file_name
perl -i -pe 's#\Q"&Close"#"关闭(&C)"#g' $file_name
perl -i -pe 's#\Q"View &Licence"#"查看许可证(&L)"#g' $file_name
perl -i -pe 's#\Q"Visit &Web Site"#"查看网站 (&W)"#g' $file_name
perl -i -pe 's#\Q"PuTTY Configuration"#"PuTTY 配置"#g' $file_name
perl -i -pe 's#\Q"PuTTY Event Log"#"PuTTY 事件日志"#g' $file_name
perl -i -pe 's#\Q"C&opy"#"复制(&O)"#g' $file_name
perl -i -pe 's#\Q"PuTTY Licence"#"PuTTY 许可证"#g' $file_name
perl -i -pe 's#\Q"OK"#"确定"#g' $file_name
perl -i -pe 's#\Q"PuTTY Security Alert"#"PuTTY 安全警报"#g' $file_name
perl -i -pe 's#\Q"The server'\''s host key is not cached in the registry. You have no"#"服务器的主机密钥未缓存在注册表中。你无法保证服务器是您认可的机器。"#g' $file_name
perl -i -pe 's#\Q"guarantee that the server is the computer you think it is."#""#g' $file_name
perl -i -pe 's#\Q"The server'\''s {KEYTYPE} key fingerprint is:"#"服务器的密钥指纹是 {KEYTYPE} "#g' $file_name
perl -i -pe 's#\Q"If you trust this host, press "#"如果您信任此主机，请按 "#g' $file_name
perl -i -pe 's#\Q" to add the key to {APPNAME}'\''s"#" 将密钥添加到 {APPNAME} 缓存"#g' $file_name
perl -i -pe 's#\Q"cache and carry on connecting."#""#g' $file_name
perl -i -pe 's#\Q"If you want to carry on connecting just once, without adding the key"#"如果您只想进行一次连接，无需添加密钥到缓存，连接一次”。"#g' $file_name
perl -i -pe 's#\Q"to the cache, press "#"请按 "#g' $file_name
perl -i -pe 's#\Q"If you do not trust this host, press "#"如果您不信任此主机，请按 "#g' $file_name
perl -i -pe 's#\Q" to abandon the connection."#"来放弃连接"#g' $file_name
perl -i -pe 's#\Q"Cancel"#"取消"#g' $file_name
perl -i -pe 's#\Q"Accept"#"接受"#g' $file_name
perl -i -pe 's#\Q"Connect Once"#"连接一次"#g' $file_name
perl -i -pe 's#\Q"More info..."#"更多信息..."#g' $file_name
perl -i -pe 's#\Q"Help"#"帮助"#g' $file_name
perl -i -pe 's#\Q"WARNING - POTENTIAL SECURITY BREACH!"#"警告 -潜在的安全漏洞！"#g' $file_name
perl -i -pe 's#\Q"The server'\''s host key does not match the one {APPNAME} has cached in"#"服务器的主机密钥与 {APPNAME} 缓存的不匹配。"#g' $file_name
perl -i -pe 's#\Q"the registry. This means that either the server administrator has"#"这意味着服务器管理员可能更改了主机密钥，或者您实际上已连接到另一个计算机伪装的服务器。"#g' $file_name
perl -i -pe 's#\Q"changed the host key, or you have actually connected to another"#""#g' $file_name
perl -i -pe 's#\Q"computer pretending to be the server."#""#g' $file_name
perl -i -pe 's#\Q"The new {KEYTYPE} key fingerprint is:"#"新的密钥指纹为：{KEYTYPE} "#g' $file_name
perl -i -pe 's#\Q"If you were expecting this change and trust the new key, press"#"如果您期待此更改并信任新密钥，请按 "#g' $file_name
perl -i -pe 's#\Q" to update {APPNAME}'\''s cache and continue connecting."#" 以更新 {APPNAME} 的缓存并继续连接。"#g' $file_name
perl -i -pe 's#\Q"If you want to carry on connecting but without updating the cache,"#"如果您想继续连接但不更新缓存，"#g' $file_name
perl -i -pe 's#\Q"press "#"按 "#g' $file_name
perl -i -pe 's#\Q"If you want to abandon the connection completely, press "#"如果您想完全放弃连接，请按 "#g' $file_name
perl -i -pe 's#\Q"Pressing "#"按 "#g' $file_name
perl -i -pe 's#\Q" is the ONLY guaranteed safe choice."#" 是唯一有保证的安全选择。"#g' $file_name
perl -i -pe 's#\Q"The host key is not cached for this server:"#"未为此服务器缓存主机密钥:"#g' $file_name
perl -i -pe 's#\Q"You have no guarantee that the server is the computer you think it is."#"您无法保证服务器就是您认为的计算机。"#g' $file_name
perl -i -pe 's#\Q"The host key does not match the one {APPNAME} has cached for this server:"#"主机密钥与 {APPNAME} 已为此服务器缓存的密钥不匹配："#g' $file_name
perl -i -pe 's#\Q"This means that either the server administrator has changed the"#"这意味着服务器管理员已更改"#g' $file_name
perl -i -pe 's#\Q"host key, or you have actually connected to another computer"#"主机密钥，或者您实际上已连接到另一台计算机"#g' $file_name
perl -i -pe 's#\Q"pretending to be the server."#"冒充的。"#g' $file_name
perl -i -pe 's#\Q"PuTTY: information about the server'\''s host key"#"PuTTY: 关于服务器主机密钥的信息"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# windows/puttygen.c
file_name="windows/puttygen.c"
echo [84%]开始汉化 windows/puttygen.c
perl -i -pe 's#\Q"PuTTYgen Fatal Error"#"PuTTYgen 致命错误"#g' $file_name
perl -i -pe 's#\Q"PuTTYgen Error"#"PuTTYgen 错误"#g' $file_name
perl -i -pe 's#\Q"PuTTY Private Key Files (*.ppk)\0*.ppk\0"#"PuTTY 私钥文件 (*.ppk)\\0*.ppk\\0"#g' $file_name
perl -i -pe 's#\Q"All Files (*.*)\0*\0\0\0"#"所有文件 (*.*)\\0*\\0\\0\\0"#g' $file_name
perl -i -pe 's#\Q"\251 "#"(C) "#g' $file_name
perl -i -pe 's#\Q". All rights reserved."#". 保留所有权利。"#g' $file_name
perl -i -pe 's#\Q"&Public key for pasting into authorized_keys file:"#"已认可密钥文件的公钥(&P)："#g' $file_name
perl -i -pe 's#\Q"&Public key for pasting into "#"显示的公钥由 "#g' $file_name
perl -i -pe 's#\Q"OpenSSH authorized_keys file:"#"OpenSSH 认可(&P)："#g' $file_name
perl -i -pe 's#\Q"PuTTY Key File Warning"#"PuTTY 密钥文件警告"#g' $file_name
perl -i -pe 's#\Q"You are loading an SSH-2 private key which has an\n"#"现在载入的是一个旧版本文件格式的 SSH2\\n"#g' $file_name
perl -i -pe 's#\Q"old version of the file format. This means your key\n"#" 私钥格式。这意味着该私钥文件不是\\n"#g' $file_name
perl -i -pe 's#\Q"file is not fully tamperproof. Future versions of\n"#"足够的安全。未来版本的 PuTTY 可能会\\n"#g' $file_name
perl -i -pe 's#\Q"PuTTY may stop supporting this private key format,\n"#"停止对该私钥格式的支持。\\n"#g' $file_name
perl -i -pe 's#\Q"so we recommend you convert your key to the new\n"#"建议将其转换为新的\\n"#g' $file_name
perl -i -pe 's#\Q"format.\n"#"格式。\\n"#g' $file_name
perl -i -pe 's#\Q"Once the key is loaded into PuTTYgen, you can perform\n"#"一旦密钥被载入到 PuTTYgen，你可以简单的\\n"#g' $file_name
perl -i -pe 's#\Q"this conversion simply by saving it again."#"使用保存文件来进行转换。"#g' $file_name
perl -i -pe 's#\Q"Couldn'\''t load private key (%s)"#"无法载入私钥 (%s)"#g' $file_name
perl -i -pe 's#\Q"PuTTYgen Error"#"PuTTYgen 错误"#g' $file_name
perl -i -pe 's#\Q"Successfully imported foreign key\n"#"成功导入其他格式密钥\\n"#g' $file_name
perl -i -pe 's#\Q"To use this key with PuTTY, you need to\n"#"请选择\\"保存私钥\\"命令将密钥保存为 PuTTY\\n"#g' $file_name
perl -i -pe 's#\Q"use the \"Save private key\" command to\n"#"自有格式，以便于 PuTTY 使用"#g' $file_name
perl -i -pe 's#\Q"save it in PuTTY'\''s own format."#"该密钥。\\n"#g' $file_name
perl -i -pe 's#\Q"PuTTYgen Notice"#"PuTTYgen 提示"#g' $file_name
perl -i -pe 's#\Q"Please wait while a key is generated..."#"正在生成密钥，请稍等..."#g' $file_name
perl -i -pe 's#\Q"Please generate some randomness by moving the mouse over the blank area."#"请在空白区域移动鼠标，以便产生随机数据。"#g' $file_name
perl -i -pe 's#\Q"&Load private key"#"载入私钥(&L)"#g' $file_name
perl -i -pe 's#\Q"Save p&ublic key"#"保存公钥(&U)"#g' $file_name
perl -i -pe 's#\Q"&Save private key"#"保存私钥(&S)"#g' $file_name
perl -i -pe 's#\Q"E&xit"#"退出(&X)"#g' $file_name
perl -i -pe 's#\Q"&File"#"文件(&F)"#g' $file_name
perl -i -pe 's#\Q"&Generate key pair"#"生成密钥对(&G)"#g' $file_name
perl -i -pe 's#\Q"SSH-&1 key (RSA)"#"SSH&1 密钥 (RSA)"#g' $file_name
perl -i -pe 's#\Q"SSH-2 &RSA key"#"SSH2 &RSA 密钥"#g' $file_name
perl -i -pe 's#\Q"SSH-2 &DSA key"#"SSH2 &DSA 密钥"#g' $file_name
perl -i -pe 's#\Q"SSH-2 &ECDSA key"#"SSH-2 &ECDSA 密钥"#g' $file_name
perl -i -pe 's#\Q"SSH-2 EdD&SA key"#"SSH-2 EdD&SA 密钥"#g' $file_name
perl -i -pe 's#\Q"SSH-2 ED&25519 key"#"SSH-2 ED&25519 密钥"#g' $file_name
perl -i -pe 's#\Q"Use probable primes (fast)"#"使用可用的素数（快速）"#g' $file_name
perl -i -pe 's#\Q"Use proven primes (slower)"#"使用经过验证的素数（较慢）"#g' $file_name
perl -i -pe 's#\Q"Use proven primes with even distribution (slowest)"#"使用经过验证的均匀分布的素数（最慢）"#g' $file_name
perl -i -pe 's#\Q"Use \"strong\" primes as RSA key factors"#"使用“强”像素作为 RSA 秘钥因子"#g' $file_name
perl -i -pe 's#\Q"Parameters for saving key files..."#"密钥文件参数"#g' $file_name
perl -i -pe 's#\Q"Show fingerprint as SHA256"#"以SHA256显示指纹"#g' $file_name
perl -i -pe 's#\Q"Show fingerprint as MD5"#"以MD5显示指纹"#g' $file_name
perl -i -pe 's#\Q"&Key"#"密钥(&K)"#g' $file_name
perl -i -pe 's#\Q"&Import key"#"导入密钥(&I)"#g' $file_name
perl -i -pe 's#\Q"Export &OpenSSH key"#"导出 OpenSSH 密钥(&O)"#g' $file_name
perl -i -pe 's#\Q"Export &OpenSSH key (force new file format)"#"导出 OpenSSH 密钥(强制新文件格式)"#g' $file_name
perl -i -pe 's#\Q"Export &ssh.com key"#"导出 ssh.com 密钥(&S)"#g' $file_name
perl -i -pe 's#\Q"Con&versions"#"转换(&V)"#g' $file_name
perl -i -pe 's#\Q"&About"#"关于(&A)"#g' $file_name
perl -i -pe 's#\Q"&Help"#"帮助(&H)"#g' $file_name
perl -i -pe 's#\Q"Key"#"密钥"#g' $file_name
perl -i -pe 's#\Q"No key."#"没有密钥"#g' $file_name
perl -i -pe 's#\Q"&Public key for pasting into authorized_keys file:"#"已认可密钥文件的公钥(&P)："#g' $file_name
perl -i -pe 's#\Q"Key f&ingerprint:"#"密钥指纹(&I)："#g' $file_name
perl -i -pe 's#\Q"Key &comment:"#"密钥注释(&C)："#g' $file_name
perl -i -pe 's#\Q"Key p&assphrase:"#"密钥密码(&A)："#g' $file_name
perl -i -pe 's#\Q"C&onfirm passphrase:"#"确认密码(&O)："#g' $file_name
perl -i -pe 's#\Q"Actions"#"动作"#g' $file_name
perl -i -pe 's#\Q"Generate a public/private key pair"#"生成公钥/私钥对"#g' $file_name
perl -i -pe 's#\Q"&Generate"#"生成(&G)"#g' $file_name
perl -i -pe 's#\Q"Load an existing private key file"#"载入已保存的私钥文件"#g' $file_name
perl -i -pe 's#\Q"&Load"#"载入(&L)"#g' $file_name
perl -i -pe 's#\Q"Save the generated key"#"保存生成的密钥"#g' $file_name
perl -i -pe 's#\Q"Save p&ublic key"#"保存公钥(&U)"#g' $file_name
perl -i -pe 's#\Q"&Save private key"#"保存私钥(&S)"#g' $file_name
perl -i -pe 's#\Q"Parameters"#"参数"#g' $file_name
perl -i -pe 's#\Q"Type of key to generate:"#"生成的密钥类型："#g' $file_name
perl -i -pe 's#\Q"Number of &bits in a generated key:"#"生成密钥位数(&B)："#g' $file_name
perl -i -pe 's#\Q"Cur&ve to use for generating this key:"#"用于生成此密钥的曲线(&V)："#g' $file_name
perl -i -pe 's#\Q"(nothing to configure for this key type)"#"（此密钥类型无需配置）"#g' $file_name
perl -i -pe 's#\Q"Out of thread resources"#"创建线程发生错误"#g' $file_name
perl -i -pe 's#\Q"Key generation error"#"密钥生成错误"#g' $file_name
perl -i -pe 's#\Q"PuTTYgen will not generate a key smaller than 256"#"PuTTYgen 不能生成低于 256 位的密钥。"#g' $file_name
perl -i -pe 's#\Q" bits.\nKey length reset to default %d. Continue?"#"\\n密钥位数将调整为默认的 %d，是否继续？"#g' $file_name
perl -i -pe 's#\Q"PuTTYgen Warning"#"PuTTYgen 警告"#g' $file_name
perl -i -pe 's#\Q"Keys shorter than %d bits are not recommended. "#"不建议使用少于 %d 位密钥。"#g' $file_name
perl -i -pe 's#\Q"Really generate this key?"#"真的要生成此密钥？"#g' $file_name
perl -i -pe 's#\Q"PuTTYgen Warning"#"PuTTYgen 警告"#g' $file_name
perl -i -pe 's#\Q"Cannot export an SSH-%d key in an SSH-%d"#"无法输出 SSH%d 密钥（SSH%d 格式）"#g' $file_name
perl -i -pe 's#\Q" format"#""#g' $file_name
perl -i -pe 's#\Q"PuTTYgen Error"#"PuTTYgen 错误"#g' $file_name
perl -i -pe 's#\Q"The two passphrases given do not match."#"两次输入的密码不一样。"#g' $file_name
perl -i -pe 's#\Q"Are you sure you want to save this key\n"#"确定不给该密钥设置密码保护么？\\n"#g' $file_name
perl -i -pe 's#\Q"without a passphrase to protect it?"#""#g' $file_name
perl -i -pe 's#\Q"PuTTYgen Warning"#"PuTTYgen 警告"#g' $file_name
perl -i -pe 's#\Q"Save private key as:"#"保存私钥为："#g' $file_name
perl -i -pe 's#\Q"Overwrite existing file\n%s?"#"覆盖已存在的文件\\n%s?"#g' $file_name
perl -i -pe 's#\Q"PuTTYgen Warning"#"PuTTYgen 警告"#g' $file_name
perl -i -pe 's#\Q"Unable to save key file"#"无法保存密钥文件"#g' $file_name
perl -i -pe 's#\Q"PuTTYgen Error"#"PuTTYgen 错误"#g' $file_name
perl -i -pe 's#\Q"Save public key as:"#"保存公钥为："#g' $file_name
perl -i -pe 's#\Q"Overwrite existing file\n%s?"#"覆盖已存在的文件\\n%s?"#g' $file_name
perl -i -pe 's#\Q"PuTTYgen Warning"#"PuTTYgen 警告"#g' $file_name
perl -i -pe 's#\Q"Unable to open key file"#"无法打开密钥文件"#g' $file_name
perl -i -pe 's#\Q"PuTTYgen Error"#"PuTTYgen 错误"#g' $file_name
perl -i -pe 's#\Q"Unable to save key file"#"无法保存密钥文件"#g' $file_name
perl -i -pe 's#\Q"PuTTYgen Error"#"PuTTYgen 错误"#g' $file_name
perl -i -pe 's#\Q"Load private key:"#"载入私钥："#g' $file_name
perl -i -pe 's#\Q"bad control id in idc_to_fptype"#"idc_to_fptype 中的控制 ID 错误"#g' $file_name
perl -i -pe 's#\Q"bad fptype in fptype_to_idc"#"fptype_to_idc 中的错误 fptype"#g' $file_name
perl -i -pe 's#\Q"we must have initialised keytype by now"#"我们现在必须初始化 keytype"#g' $file_name
perl -i -pe 's#\Q"demo passphrase"#"演示密码"#g' $file_name
perl -i -pe 's#\Q"Demo screenshot failure"#"演示截图失败"#g' $file_name
perl -i -pe 's#\Q"PuTTYgen command line error"#"PuTTYgen 命令行错误"#g' $file_name
perl -i -pe 's#\Q"unexpected extra argument '\''%s'\''\n"#"意外的额外参数“%s”\\n"#g' $file_name
perl -i -pe 's#\Q"unknown key type '\''%s'\''\n"#"未知键类型“%s”\\n"#g' $file_name
perl -i -pe 's#\Q"unknown fingerprint type '\''%s'\''\n"#"未知指纹类型“%s”\\n"#g' $file_name
perl -i -pe 's#\Q"unrecognised prime-generation mode '\''%s'\''\n"#"无法识别的主要生成模式“%s”\\n"#g' $file_name
perl -i -pe 's#\Q"PPK parameter '\''%s'\'' expected a value\n"#"PPK 参数“%s”需要一个值\\n"#g' $file_name
perl -i -pe 's#\Q"unrecognised kdf '\''%s'\''\n"#"无法识别的 kdf '\''%s'\''\\n"#g' $file_name
perl -i -pe 's#\Q"value '\''%s'\'' for PPK parameter '\''%s'\'': expected a "#"PPK 参数“%s”的值“%s”: 需要一个数字\\n"#g' $file_name
perl -i -pe 's#\Q"number\n"#""#g' $file_name
perl -i -pe 's#\Q"unrecognised PPK parameter '\''%s'\''\n"#"无法识别的 PPK 参数“%s”\\n"#g' $file_name
perl -i -pe 's#\Q"unrecognised option '\''%s'\''\n"#"无法识别的选项“%s”\\n"#g' $file_name
perl -i -pe 's#\Q"unsupported ECDSA bit length %d"#"不支持的 ECDSA 位长度 %d"#g' $file_name
perl -i -pe 's#\Q"unsupported EDDSA bit length %d"#"不支持的 EDDSA 位长度 %d"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# windows/puttygen.rc
file_name="windows/puttygen.rc"
echo [85%]开始汉化 windows/puttygen.rc
perl -i -pe 's#\Q"PuTTY SSH key generation utility"#"PuTTY SSH 密钥生成工具"#g' $file_name
perl -i -pe 's#\Q"PuTTY Key Generator"#"PuTTY 密钥生成器"#g' $file_name
perl -i -pe 's#\Q"PuTTYgen: Enter Passphrase"#"PuTTYgen: 输入密码"#g' $file_name
perl -i -pe 's#\Q"Enter passphrase for key"#"请输入密钥的密码"#g' $file_name
perl -i -pe 's#\Q"O&K"#"确定(&K)"#g' $file_name
perl -i -pe 's#\Q"&Cancel"#"取消(&C)"#g' $file_name
perl -i -pe 's#\Q"About PuTTYgen"#"关于 PuTTYgen"#g' $file_name
perl -i -pe 's#\Q"&Close"#"关闭(&C)"#g' $file_name
perl -i -pe 's#\Q"View &Licence"#"查看许可证(&L)"#g' $file_name
perl -i -pe 's#\Q"Visit &Web Site"#"访问网站 (&W)"#g' $file_name
perl -i -pe 's#\Q"PuTTY Licence"#"PuTTY 许可证"#g' $file_name
perl -i -pe 's#\Q"OK"#"确定"#g' $file_name
perl -i -pe 's#\Q"PuTTYgen: Private Key File Parameters"#"PuTTYgen: 私钥文件参数"#g' $file_name
perl -i -pe 's#\Q"PPK file version:"#"PPK 文件版本:"#g' $file_name
perl -i -pe 's#\Q"Key derivation function:"#"密钥导出函数:"#g' $file_name
perl -i -pe 's#\Q"Memory to use for passphrase hash:"#"用于密码哈希的内存:"#g' $file_name
perl -i -pe 's#\Q"Kbyte"#"KB"#g' $file_name
perl -i -pe 's#\Q"Time to use for passphrase hash:"#"用于密码哈希的时间:"#g' $file_name
perl -i -pe 's#\Q"ms"#"毫秒"#g' $file_name
perl -i -pe 's#\Q"passes"#"遍"#g' $file_name
perl -i -pe 's#\Q"Parallelism for passphrase hash:"#"密码哈希的并行性:"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# windows/puttytel.rc
file_name="windows/puttytel.rc"
echo [86%]开始汉化 windows/puttytel.rc
perl -i -pe 's#\Q"Telnet and Rlogin client"#"Telnet 和 Rlogin 客户端"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# windows/serial.c
file_name="windows/serial.c"
echo [87%]开始汉化 windows/serial.c
perl -i -pe 's#\Q"End of file reading from serial device"#"从串行设备读取文件结束"#g' $file_name
perl -i -pe 's#\Q"Error reading from serial device"#"从串行设备读取错误"#g' $file_name
perl -i -pe 's#\Q"Error writing to serial device"#"写入串行设备时出错"#g' $file_name
perl -i -pe 's#\Q"Configuring baud rate %lu"#"配置波特率 %lu"#g' $file_name
perl -i -pe 's#\Q"Configuring %u data bits"#"配置 %u 数据位"#g' $file_name
perl -i -pe 's#\Q"Invalid number of stop bits "#"无效的停止位数"#g' $file_name
perl -i -pe 's#\Q"(need 1, 1.5 or 2)"#"(需要 1, 1.5 或者 2)"#g' $file_name
perl -i -pe 's#\Q"Configuring %s"#"配置 %s"#g' $file_name
perl -i -pe 's#\Q"Configuring %s parity"#"配置 %s 奇偶校验"#g' $file_name
perl -i -pe 's#\Q"Configuring %s flow control"#"配置 %s 流控制"#g' $file_name
perl -i -pe 's#\Q"Configuring serial port: %s"#"配置串口: %s"#g' $file_name
perl -i -pe 's#\Q"Configuring serial timeouts: %s"#"配置串行超时： %s"#g' $file_name
perl -i -pe 's#\Q"Opening serial device %s"#"打开串行设备 %s"#g' $file_name
perl -i -pe 's#\Q"Opening '\''%s'\'': %s"#"正在打开“%s”: %s"#g' $file_name
perl -i -pe 's#\Q"Finished serial break"#"完成连续中断"#g' $file_name
perl -i -pe 's#\Q"Starting serial break at user request"#"应用户请求启动连续中断"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# windows/sftp.c
file_name="windows/sftp.c"
echo [88%]开始汉化 windows/sftp.c
perl -i -pe 's#\Q"Unable to create command input thread\n"#"无法创建命令输入线程\\n"#g' $file_name
perl -i -pe 's#\Q"Running with restricted process ACL"#"使用受限进程 ACL 运行"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# windows/sharing.c
file_name="windows/sharing.c"
echo [89%]开始汉化 windows/sharing.c
perl -i -pe 's#\Q"Unable to call CryptProtectMemory: %s"#"无法调用 CryptProtectMemory: %s"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# windows/storage.c
file_name="windows/storage.c"
echo [90%]开始汉化 windows/storage.c
perl -i -pe 's#\Q"Recent sessions"#"最近会话"#g' $file_name
perl -i -pe 's#\Q"Default Settings"#"默认设置"#g' $file_name
perl -i -pe 's#\Q"Error: "#"错误："#g' $file_name
perl -i -pe 's#\Q"Error code: "#"错误代码："#g' $file_name
perl -i -pe 's#\Q"Error"#"错误"#g' $file_name
perl -i -pe 's#\Q"Unable to ExpandEnvironmentStrings for session path"#"无法展开会话路径的环境字符串"#g' $file_name
perl -i -pe 's#\Q"Unable to read configuration file, falling back to defaults"#"无法读取配置文件，回退到默认值"#g' $file_name
perl -i -pe 's#\Q"Unable to create directory for storing sessions"#"无法创建用于存储会话的目录"#g' $file_name
perl -i -pe 's#\Q"Unable to open file for writing"#"无法打开文件进行写入"#g' $file_name
perl -i -pe 's#\Q"Unable to save settings"#"无法保存设置"#g' $file_name
perl -i -pe 's#\Q"Unable to load file for reading"#"无法加载文件进行读取"#g' $file_name
perl -i -pe 's#\Q"Unable to read session from file"#"无法从文件中读取会话"#g' $file_name
perl -i -pe 's#\Q"Unable to delete settings."#"无法删除设置。"#g' $file_name
perl -i -pe 's#\Q"Host key is cached but in registry. "#"主机密钥被缓存但在注册表中。"#g' $file_name
perl -i -pe 's#\Q"Do you want to move it to file? \n\n"#"要将其移动到文件中吗？ \\n\\n"#g' $file_name
perl -i -pe 's#\Q"Yes \t-> Move (delete key in registry)\n"#"是 \\t-> 移动（删除注册表中的键）\\n"#g' $file_name
perl -i -pe 's#\Q"No \t-> Copy (keep key in registry)\n"#"否 \\t-> 复制（在注册表中保留密钥）\\n"#g' $file_name
perl -i -pe 's#\Q"Cancel \t-> nothing will be done\n"#"取消 \\t-> 什么都不会做\\n"#g' $file_name
perl -i -pe 's#\Q"Security risk"#"安全风险"#g' $file_name
perl -i -pe 's#\Q"Unable to create file (key won'\''t be deleted from registry)"#"无法创建文件（密钥不会从注册表中删除）"#g' $file_name
perl -i -pe 's#\Q"Unable to save key to file (key won'\''t be deleted from registry)"#"无法将密钥保存到文件（密钥不会从注册表中删除）"#g' $file_name
perl -i -pe 's#\Q"Unable to delete registry value"#"无法删除注册表值"#g' $file_name
perl -i -pe 's#\Q"Unable to create file"#"无法创建文件"#g' $file_name
perl -i -pe 's#\Q"Unable to save key to file"#"无法将密钥保存到文件"#g' $file_name
perl -i -pe 's#\Q"Unable to delete '\''%s'\'': %s"#"无法删除“%s”: %s"#g' $file_name
perl -i -pe 's#\Q"Unable to create jumplist file"#"无法创建跳转列表文件"#g' $file_name
perl -i -pe 's#\Q"Unable to load jumplist file"#"无法加载跳转列表文件"#g' $file_name
perl -i -pe 's#\Q"Unable to open file for writing"#"无法打开文件进行写入"#g' $file_name
perl -i -pe 's#\Q"Unable to save jumplist"#"无法保存跳转列表"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# windows/version.rc2
file_name="windows/version.rc2"
echo [91%]开始汉化 windows/version.rc2
perl -i -pe 's#\Q"080904B0"#"080404B0"#g' $file_name
perl -i -pe 's#\Q"PuTTY suite"#"PuTTY 套件"#g' $file_name
perl -i -pe 's#\Q"Copyright \251 "#"版权所有(C) "#g' $file_name
perl -i -pe 's#\Q0x809, 1200#0x804, 0x4B0#g' $file_name
perl -i -pe 's#\Q(UK English, Unicode)#(CN 中文, 中华人民共和国)#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# windows/window.c
file_name="windows/window.c"
echo [92%]开始汉化 windows/window.c
perl -i -pe 's#\Q"%s Error"#"%s 错误"#g' $file_name
perl -i -pe 's#\Q"Unable to open connection to\n%s\n%s"#"无法连接到\\n%s\\n%s"#g' $file_name
perl -i -pe 's#\Q"%.800s\n"#"%.800s 的连接\\n"#g' $file_name
perl -i -pe 's#\Q"%.70s (inactive)"#"%.70s (不活动的)"#g' $file_name
perl -i -pe 's#\Q"&Restart Session"#"重启会话(&R)"#g' $file_name
perl -i -pe 's#\Q"%s Fatal Error"#"%s 致命错误"#g' $file_name
perl -i -pe 's#\Q"Windows refuses to report a version"#"Windows 拒绝报告版本"#g' $file_name
perl -i -pe 's#\Q"%s Fatal Error"#"%s 致命错误"#g' $file_name
perl -i -pe 's#\Q"Failed to initialize COM subsystem"#"初始化 COM 子系统失败"#g' $file_name
perl -i -pe 's#\Q"unknown option \"%s\""#"未知选项 \\"%s\\""#g' $file_name
perl -i -pe 's#\Q"&Paste"#"粘贴(&P)"#g' $file_name
perl -i -pe 's#\Q"&Event Log"#"事件日志记录(&E)"#g' $file_name
perl -i -pe 's#\Q"Ne&w Session..."#"新会话(&W)..."#g' $file_name
perl -i -pe 's#\Q"&Duplicate Session"#"复制会话(&D)"#g' $file_name
perl -i -pe 's#\Q"Sa&ved Sessions"#"保存会话(&V)"#g' $file_name
perl -i -pe 's#\Q"Chan&ge Settings..."#"修改设置(&G)..."#g' $file_name
perl -i -pe 's#\Q"C&opy All to Clipboard"#"复制所有内容到剪贴板(&O)"#g' $file_name
perl -i -pe 's#\Q"C&lear Scrollback"#"清除滚动条(&L)"#g' $file_name
perl -i -pe 's#\Q"Rese&t Terminal"#"重启终端(&T)"#g' $file_name
perl -i -pe 's#\Q"&Full Screen"#"全屏(&F)"#g' $file_name
perl -i -pe 's#\Q"&Help"#"帮助(&H)"#g' $file_name
perl -i -pe 's#\Q"&About %s"#"关于 %s(&A)"#g' $file_name
perl -i -pe 's#\Q"(No sessions)"#"(没有会话)"#g' $file_name
perl -i -pe 's#\Q"S&pecial Command"#"指定命令(&P)"#g' $file_name
perl -i -pe 's#\Q"%s Exit Confirmation"#"%s 退出确认"#g' $file_name
perl -i -pe 's#\Q"Are you sure you want to close this session?%s%s"#"确定要关闭本会话么？%s%s"#g' $file_name
perl -i -pe 's#\Q"%s (inactive)"#"%s (不活动的)"#g' $file_name
perl -i -pe 's#\Q"Serialised configuration data was invalid"#"序列化配置数据无效"#g' $file_name
perl -i -pe 's#\Q"unexpected argument \"%s\""#"无效参数\\"%s\\""#g' $file_name
perl -i -pe 's#\Q"&Copy"#"&复制"#g' $file_name
perl -i -pe 's#\Q"Running with restricted process ACL"#"使用受限进程 ACL 运行"#g' $file_name
perl -i -pe 's#\Q"%s Command Line Error"#"%s 命令行错误"#g' $file_name
perl -i -pe 's#\Q"Connection closed by remote host"#"连接被远程主机关闭"#g' $file_name
perl -i -pe 's#\Q"----- Session restarted -----"#"----- 会话重新启动 -----"#g' $file_name
perl -i -pe 's#\Q"Unable to play sound file\n%s\nUsing default sound instead"#"无法播放声音文件\\n%s\\n改用默认声音"#g' $file_name
perl -i -pe 's#\Q"%s Sound Error"#"%s 声音错误"#g' $file_name
perl -i -pe 's#\Q"Primary font H=%d, AW=%d, MW=%d\n"#"主要字体 H=%d, AW=%d, MW=%d\\n"#g' $file_name
perl -i -pe 's#\Q"Unable to create terminal window: %s"#"无法创建终端窗口: %s"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# windows/utils/security.c
file_name="windows/utils/security.c"
echo [93%]开始汉化 windows/utils/security.c
perl -i -pe 's#\Q"unable to construct SID for current user: %s"#"无法为当前用户构造 SID: %s"#g' $file_name
perl -i -pe 's#\Q"unable to construct SID for world: %s"#"无法为世界构造 SID: %s"#g' $file_name
perl -i -pe 's#\Q"unable to construct SID for "#"无法为本地同一用户访问构造 SID: %s"#g' $file_name
perl -i -pe 's#\Q"local same-user access only: %s"#""#g' $file_name
perl -i -pe 's#\Q"unable to construct ACL: %s"#"无法构造 ACL： %s"#g' $file_name
perl -i -pe 's#\Q"unable to allocate security descriptor: %s"#"无法分配安全描述符：%s"#g' $file_name
perl -i -pe 's#\Q"unable to initialise security descriptor: %s"#"无法初始化安全描述符： %s"#g' $file_name
perl -i -pe 's#\Q"unable to set owner in security descriptor: %s"#"无法在安全描述符中设置所有者： %s"#g' $file_name
perl -i -pe 's#\Q"unable to set DACL in security descriptor: %s"#"无法在安全描述符中设置 DACL：%s"#g' $file_name
perl -i -pe 's#\Q"unable to construct ACL: %s"#"无法构造 ACL：%s"#g' $file_name
perl -i -pe 's#\Q"Unable to set process ACL: %s"#"无法设置进程 ACL： %s"#g' $file_name
perl -i -pe 's#\Q"ACL restrictions not compiled into this binary"#"ACL 限制未编译到此二进制文件中"#g' $file_name
perl -i -pe 's#\Q"Could not restrict process ACL: %s"#"无法限制进程 ACL:%s"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# windows/utils/split_into_argv.c
file_name="windows/utils/split_into_argv.c"
echo [94%]开始汉化 windows/utils/split_into_argv.c
perl -i -pe 's#\Q"These are the fingerprints of the PuTTY PGP Master Keys. They can\n"#"这些是 PuTTY PGP 主密钥的指纹。他们能\\n"#g' $file_name
perl -i -pe 's#\Q"be used to establish a trust path from this executable to another\n"#"用于建立从该可执行文件到另一个可执行文件的信任路径\\n"#g' $file_name
perl -i -pe 's#\Q"one. See the manual for more information.\n"#"有关详细信息，请参阅手册。\\n"#g' $file_name
perl -i -pe 's#\Q"(Note: these fingerprints have nothing to do with SSH!)\n"#"（注意：这些指纹与 SSH 无关！）\\n"#g' $file_name
perl -i -pe 's#\Q"PuTTY Master Key as of "#"PuTTY 万能钥匙 "#g' $file_name
perl -i -pe 's#\Q"Previous Master Key ("#"以前的万能钥匙("#g' $file_name
perl -i -pe 's#\Q"PGP fingerprints"#"PGP指纹"#g' $file_name
perl -i -pe 's#\Q"unrecognised option: \"%s\"\n"#"无法识别的选项： \\"%s\\"\\n"#g' $file_name
perl -i -pe 's#\Q"failed test %d (|%s|) arg %d: |%s| should be |%s|\n"#"失败测试 %d (|%s|) arg %d: |%s|应该是 |%s|\\n"#g' $file_name
perl -i -pe 's#\Q"test %d (|%s|) arg %d: |%s| == |%s|\n"#"测试 %d (|%s|) 参数 %d: |%s| == |%s|\\n"#g' $file_name
perl -i -pe 's#\Q"failed test %d (|%s|): %d args returned, should be %d\n"#"测试 %d (|%s|) 失败：返回 %d 个参数，应该是 %d\\n"#g' $file_name
perl -i -pe 's#\Q"failed test %d (|%s|): %d args returned, should be more\n"#"测试 %d (|%s|) 失败：返回 %d 个参数，应该更多\\n"#g' $file_name
perl -i -pe 's#\Q"passed %d failed %d (%s mode)\n"#"通过 %d 失败 %d (%s 模式)\\n"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# windows/utils/win_strerror.c
file_name="windows/utils/win_strerror.c"
echo [95%]开始汉化 windows/utils/win_strerror.c
perl -i -pe 's#\Q"(unable to format: FormatMessage returned %u)"#"（无法格式化：FormatMessage 返回 %u）"#g' $file_name
perl -i -pe 's#\Q"Error %d: %s"#"错误 %d: %s"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# windows/utils/pgp_fingerprints_msgbox.c
file_name="windows/utils/pgp_fingerprints_msgbox.c"
echo [96%]开始汉化 windows/utils/pgp_fingerprints_msgbox.c
perl -i -pe 's#\Q"These are the fingerprints of the PuTTY PGP Master Keys. They can\n"#"这些是 PuTTY PGP 主密钥的指纹。他们能\\n"#g' $file_name
perl -i -pe 's#\Q"be used to establish a trust path from this executable to another\n"#"用于建立从该可执行文件到另一个可执行文件的信任路径\\n"#g' $file_name
perl -i -pe 's#\Q"one. See the manual for more information.\n"#"有关详细信息，请参阅手册。\\n"#g' $file_name
perl -i -pe 's#\Q"(Note: these fingerprints have nothing to do with SSH!)\n"#"（注意：这些指纹与 SSH 无关！）\\n"#g' $file_name
perl -i -pe 's#\Q"PuTTY Master Key as of "#"PuTTY 万能钥匙 "#g' $file_name
perl -i -pe 's#\Q"Previous Master Key ("#"以前的万能钥匙 ("#g' $file_name
perl -i -pe 's#\Q"PGP fingerprints"#"PGP指纹"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name

# windows/controls.c
file_name="windows/controls.c"
echo [96%]开始汉化 windows/controls.c
perl -i -pe 's#\Qdefine CHECKBOXHEIGHT 8#define CHECKBOXHEIGHT 9#g' $file_name
perl -i -pe 's#\Qdefine RADIOHEIGHT 8#define RADIOHEIGHT 9#g' $file_name
perl -i -pe 's#\Q"&Up"#"上(&U)"#g' $file_name
perl -i -pe 's#\Q"&Down"#"下(&D)"#g' $file_name
perl -i -pe 's#\Q"Bro&wse..."#"浏览(&W)"#g' $file_name
perl -i -pe 's#\Q"Change..."#"修改..."#g' $file_name
perl -i -pe 's#\Q"All Files (*.*)\0*\0\0\0"#"所有文件 (*.*)\\0*\\0\\0\\0"#g' $file_name
perl -i -pe 's#\Q"Font: %s, %sdefault height"#"字体: %s, %s默认高度"#g' $file_name
perl -i -pe 's#\Q"Font: %s, %s%d-%s"#"字体: %s, %s%d %s"#g' $file_name
perl -i -pe 's#\Q"pixel"#"像素"#g' $file_name
perl -i -pe 's#\Q"point"#"点"#g' $file_name
perl -i -pe 's#\Q"bad control type in winctrl_layout"#"winctrl_layout 中的控件类型错误"#g' $file_name
perl -i -pe 's#\Q"no radio button was checked"#"没有选中单选按钮"#g' $file_name
perl -i -pe 's#\Q"bad control type in label_change"#"label_change 中的控制类型错误"#g' $file_name
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' $file_name


echo [99%]开始优化
#替换默认字体
perl -i -pe 's#\Q("Courier New", false, 10, ANSI_CHARSET)#("新宋体", false, 12, GB2312_CHARSET)#g' windows/utils/defaults.c
perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' windows/utils/defaults.c











# #防止乱码
# perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' *.c *.h
# perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' windows/{*.c,*.h,*.rc,*.rc2}
# perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' ssh/{*.c,*.h}
# perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' utils/{*.c,*.h}
# perl -i -MEncode -ne 'print encode("gb2312",decode("utf8",$_))' windows/utils/*.c




# clear
#开始编译
echo "\e[33m ======================= 开始编译 ======================= \e[0m"
echo "\n"
sleep 1

#清理残留
rm -rf ./build && rm -rf ./output && mkdir build && mkdir output
#编译
cmake -DCMAKE_TOOLCHAIN_FILE=cmake/toolchain-mingw.cmake -B "build" . && cd ./build && cmake --build .
#转移文件
mv *.exe ../output
cd ../

clear
#编译完成
echo "\e[33m ======================= 编译完成 ======================= \e[0m"
echo "\n"
echo "\n"
echo "\n"
echo "恭喜!!如果你看到这行字还没有报错,那么就表示编译成功了"
echo "\n"
echo "文件输出目录: output"

