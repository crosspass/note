#tr
tr是用来从标准输入中通过替换或删除操作进行字符转换，tr主要用于删除文件中控制字符或进行字符转换。

###一般格式:
  ```shell
  tr -c -d -s [set1] [set2]
  ```
  + -c:用字符串1中字符集的补集替换此字符,要求字符集为ASCII 
  + -d:删除字符串1中所有输入字符 
  + -s:删除所有重复出现字符序列,只保留一个,即将重复出现字符串压缩为一个字符串
  + -t: truncate-set1，将SET1用SET2转换，一般缺省为-t

###去除重复出现的字符
```
echo aaacccddd | tr -s [a-z]
acd
```

###删除空行
可使用-s来作这项工作。换行的八进制表示位\012,例: 
```
$more plane.txt 
and 0500 399999 2773888 or


093999 3766666 data 39
$tr -s "[\012]"<plane.txt
and 0500 399999 2773888 or 093999 3766666 data 39
```
*注意：此处用-s删除了多余的换行符，如果用-d，则会删除所有的换行符。
###大小写转换
  除了删除控制字符，转换大小写是tr最常用的功能，为此需指定即将转换的小写字符[a-z]和转换结果[A-Z]
  例1，tr从一个包含大小写字母的字符串中接受输入：
```
$echo "May Day,May Day,Going Down..."|tr "[a-z]" "[A-Z]" MAY DAY,MAY DAY,GOING DOWN...
```
 + 同样也可以使用字符类[:lower:]和[:upper:] 
```
$echo "May Day,May Day,Going Down..."|tr "[:lower:]" "[:upper:]" MAY DAY,MAY DAY,GOING DOWN...
$echo "MAY DAY,MAY DAY,GOING DOWN..."|tr "[A-Z]" "[a-z]" may day,may day,going down...
```
###删除指定字符
```shell
$ cat test.txt
Monday     09:00
Tuesday    09:10
Wednesday  10:11
Thursday   11:30
Friday     08:00
Saturday   07:40
Sunday     10:00
#现在要删除处理星期之外的所有字符
#-d代表删除，[0-9]代表所有的数字，[: ]代表冒号和空格
$ cat test.txt | tr -d "[0-9][: ]"
Monday
Tuesday
Wednesday
Thursday
Friday
Saturday
Sunday
```
