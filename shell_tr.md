#tr
tr是用来从标准输入中通过替换或删除操作进行字符转换，tr主要用于删除文件中控制字符或进行字符转换。使用tr时要有2模式个参数：参数1用于查询，参数2用于处理各种转换。tr刚执行时，字符串1中的字符被映射到字符串2中的字符，然后转换操作开始.

###一般格式:
  ```shell
  tr -c -d -s ["string1_to_translate_from"] ["string2_to_triampsulata_te_to"]
  ```
  + -c:用字符串1中字符集的补集替换此字符,要求字符集为ASCII 
  + -d:删除字符串1中所有输入字符 
  + -s:删除所有重复出现字符序列,只保留一个,即将重复出现字符串压缩为一个字符串
###字符范围:
  + [a-z]:a-z内的字符组成的字符串 
  + [A-Z]:A-Z内的字符组成的字符串 
  + [0-9]:数字串 
  + /octal:一个三位的八进制数,对应有效的ASCII字符 
  + \[O*n\]:表示字符O重复出现指定次数n,例[O*2]表示匹配[OO]字符串
###去除重复出现的字符
```
$more cops.txt
And the cowwwwws went homeeeeeeee Or did theyyyy
```
*如果要去除重复字符或将其压缩在一起,可以使用-s选项,因为都是字母,故使用[a-z]: 
```
$tr -s "[a-z]" <cops.txt 
And the cows went home Or did they
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
###大小写转换
   除了删除控制字符,转换大小写是tr最常用的功能.为此需指定即将转换的小写字符[a-z]和转换结果[A-Z]
  + 例1:tr从一个包含大小写字母的字符串中接受输入:
```
$echo "May Day,May Day,Going Down..."|tr "[a-z]" "[A-Z]" MAY DAY,MAY DAY,GOING DOWN...
```
 + 同样也可以使用字符类[:lower:]和[:upper:] 
```
$echo "May Day,May Day,Going Down..."|tr "[:lower:]" "[:upper:]" MAY DAY,MAY DAY,GOING DOWN...
$echo "MAY DAY,MAY DAY,GOING DOWN..."|tr "[A-Z]" "[a-z]" may day,may day,going down...
```
###删除指定字符
    偶尔会从下载文件中删除之包含字母或数字的列。需要结合使用-c和-s选项来完成此功能。下面的文件包含一个星期的日程表，任务是从其中删除所有数字只保留日期。日期有大写，也有小写格式，因此需指定两个字符范围[a-z]和[A-Z]。命令`tr-cs"[a-z][A-Z]""[\012*]"`将文件每行所有不包含在[a-z]或[A-Z]的字符串放在字符串1中并转换为一新行。-s选项表明压缩所有新行,-c表明保留所有字母不动:
```
$more diary.txt
monday 10:50 
Tuesday 15:30 
wednesday 15:30 
thurday 10:30 
Friday 09:20
$tr -cs "[a-z][A-Z]" "[\012*]"<diary.txt
```
