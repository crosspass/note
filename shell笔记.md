#经常用到的命令
1. 获取脚本运行的路径
`DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"`
2. 生成ssh连接的密码`ssh-keygen -t rsa` 上述命令执行后，隐藏目录~/.ssh下会出现两个文件：idrsa和idrsa.pub。其中，idrsa.pub为
公钥文件。将该文件的内容追加到对端主机linuxb上~/.ssh目录下的authorizedkeys文件中，若该文件不存在，可自行创建之。

#shell基础知识
###条件判断方式

 + 条件表达式是命令
```shell
if
command
then
...
fi
```
 + 条件表达式是真假值表达式
```shell
if [ express ]
then
...
fi
```
 + 条件表达式是test测试真价值表达式
```shell
if test express
then
...
fi
```
 + 条件表达式的快捷方式
```shell
[ express] && command
```
 + shell的if和c的if的区别

shell的if|c的if
---------|-----
0为真|正好相反0为假
不支持整型变量直接if必须`if [ i -ne 0 ]` | 支持整型变量if(i)
支持字符串变量 `if [ str ]` | 不支持字符串变量

+ 以多条command或函数为if的条件
```shell
echo -n "input:"
read user
if
#多条命令之间相当于“and”
grep $user /etc/passwd >/tmp/null      
who -u | grep $user
#上边的指令都执行成功,返回值$?为0，0为真，运行then
then
 echo "$user has logged"
#指令执行失败，$?为1，运行else 
else                           
 echo "$user has not logged"
fi  
```
###条件表达式
+ 文件表达式
  + `[ -f file ]` 文件存在
  + `[ -d dirname ]` 目录存在
  + `[ -s file ]` 文件存在且非空
  + `[ -r file ]` 文件存在且可读
  + `[ -w file ]` 文件存在且可写
  + `[ -x file ]` 文件存在且可执行
+ 整数变量表达式
  + `[ i -eq j ]` 相等
  + `[ i -ne j ]` 不等于
  + `[ i -le j ]` 小于或等于
  + `[ i -ge j ]` 大于或等于
  + `[ i -lt j ]` 小于
  + `[ i -gt j ]` 大于
+ 字符串变量表达式
  + `[ str1 = str2 ]` 等于，***字符只能用等号做比较，等号两边要有空格***
  + `[ str1 != str2 ]` 不等于
  + `[ -n str ]` 非空字符串返回0
  + `[ -z str ]` 空字符串返回0
  + `[ str ] ` 同 `[ -n str]`

###逻辑表达式
+ 逻辑非 `[ ! express ]`
+ 逻辑与 `[ exp1 -a exp2 ]`
+ 逻辑或 `[ exp1 -o exp2 ]`

###杂项
+ sleep命令
  + sleep 1    睡眠1秒
  + sleep 1s   睡眠1秒
  + sleep 1m   睡眠1分
  + sleep 1h   睡眠1小时 
+ getopts使用例子
```shell
#!/bin/bash 
QUIET=
VERBOSE=
DEVICE=
LOGFILE=/tmp/default

usage()
{
    echo "Usage: `basename $0` [-qv] [-l LOGFILE] -d DEVICE input_file [input_file2...]"
    exit 1
}

[ $# -eq 0 ] && usage

#option_string以冒号开头表示屏蔽脚本的系统提示错误，自己处理错误提示。
#后面接合法的单字母选项，选项后若有冒号，则表示该选项必须接具体的参数
while getopts :qvd:l: OPTION
do
    case $OPTION in
        q)
            QUIET=y
            ;;
        v)
            VERBOSE=y
            ;;
        d)
            DEVICE=$OPTARG        #$OPTARG为特殊变量，表示选项的具体参数
            ;;
        l)
            LOGFILE=$OPTARG
            ;;
        \?)                       #如果出现错误，则解析为?
            usage
            ;;
    esac
done

#$OPTIND为特殊变量，表示第几个选项，初始值为1
shift $(($OPTIND - 1))      #除了选项之外，该脚本必须接至少一个参数
if [ $# -eq 0 ]; then
    usage
fi

if [ -z "$DEVICE" ]; then   #该脚本必须提供-d选项
    echo "You must specify DEVICE with -d option"
    exit
fi


echo "you chose the following options.."
echo "Quiet=$QUIET VERBOSE=$VERBOSE DEVICE=$DEVICE LOGFILE=$LOGFILE"

for file in $@          #依次处理剩余的参数
do
    echo "Processing $file"
done
```

#遇到的问题：
1. 运行go的执行单元测试用例时，手工运行shell正常，但是在crontab中运行就出问题
  + 初步怀疑是执行的路径问题，更改为在脚本中切换到脚本的文件所在的路径，问题还是不能解决。
  + 寻找调试方式，想不到好的调试方式，原本在crontab中将执行的sh的结果进行重定向追加到log文件中，但是没有达到目录，这种重定向只能把shell中正常的输出重定向到log文件中。问题被卡住，没有好的调试方式的确很让人头疼。尝试用2>t.log，这种方式将错误日志输出到log，以前只是按照shell脚本的样例将错误输出到/dev/null，并没有思考这样做的实际效果。因此没有想到这种log方式，从而浪费了很多的时间在猜测错误的产生原因上面。
  + 找到调试的方式后是迈向成功的关键一步，通过查看log日志发现是手工执行的命令在crontab中竟然不能执行,发现的确是环境变量的原因导致的，crontab的PATH中只有/bin:/usr/bin 2个可执行命令的路径和用户登录下的PATH相差很大。
2. 运行的ledis服务在本机可访问，但是远程不可访问。
  + 排除iptables的问题
  + 通过shell命令lsof -i :port可以查看到port是local
