# vim regular configuration

```vim
" 4 blank replace tab
set ts=4
set expandtab
set autoindent

" edit and upate vimrc
:nmap ,s :source $VIM/_vimrc
:nmap ,v :e $VIM/_vimrc

" fmt go file
" when close file，execute go fmt on buffer
autocmd FileType go autocmd BufWritePre <buffer> Fmt

" display status bar
set statusline=[%n]\ %f%m%r%h\ \|\ \ pwd:\ %{CurDir()}\ \ \|%=\|\ %l,%c\ %p%%\ \|\ ascii=%b,hex=%b%{((&fenc==\"\")?\"\":\"\ \|\ \".&fenc)}\ \|\ %{$USER}\ @\ %{hostname()}\
```


# tips

`<C-N><C-P>`          : isert mode word autocomplete

`<C-X><C-L>`          : inser mode line autocomplete

`/<C-R><C-W>`         : search <cword>

`/<C-R><C-A>`         : search <cWORD>

" select some lines and press keyboard 2>,then selected lines will indentation 2 tab

`Ex`                  : display directory files

" upper and lower shift

`guu`                             : line lower
`gUU`                             : line upper
`g~~`                             : line shift
`guw`                             : word lower
`gUw`                             : word upper
`g~w`                             : word shift

`gf`                              : opne file where curor on

`<C-R>=5*5`                       : insert 25 (mini calctor)


" mark and move
`\'.`              : jump to the last modified line
``.`               : jump to the last modified point
`<C-O>`            : jump back
`<C-I>`            : jump forward
`:ju(mps)`         : list jump points

" mutilple file operation

`bn`               : next buffer
`bp`               : previouse buffer
`wn`               : write and netx buffer
`wp`               : write and previsouse buffer
:bd              : 把这个文件从buffer列表中做掉
:bun             : 卸掉buffer (关闭这个buffer的窗口但是不把它从列表中做掉)
:badd file.c     : 把文件file.c添加到buffer列表
:b 3             : 跳到第3个buffer
:b main          : 跳到一个名字中包含main的buffer,例如main.c               : (ultra，这个怎么翻译？:()
:sav php.html    : 把当前文件存为php.html并打开php.html
:sav! %<.bak     : 换一个后缀保存
:e!              : 返回到修改之前的文件(修改之后没有存盘)
:w /path/%       : 把文件存到一个地儿
:e #             : 编辑标记为#的buffer(这个buffer必须含有一个可编辑的文件)
                 : 用ls命令就能看到哪一个buffer有#
                 : %a表示当前正在编辑的buffer
                 : u 表示不能编辑或者已经被做掉的buffer
:e #3            : 编辑编号为3的buffer(这个buffer必须含有一个可编辑的文件)
:rew             : 回到第一个可编辑的文件
:brew            : 回到第一个buffer
:sp fred.txt     : 在一个水平分割的窗口中打开文件fred.txt # 译注：vs fred.txt可以实现垂直分割
:sball           : 把当前所有含有可编辑文件的buffer显示到一个分割窗口中              : (偶该考虑把super翻译成 高级指令 了,ft)
:map   <F5> :ls<CR>:e # : 在normal模式下按F5键，则会显示所有含有一个\r\n                 : 可编辑文件的buffer，然后提示你输入buffer的序号，
                 : 输入后回车，则编辑这个buffer
# 译注：这是一个键盘绑定\r\n:set hidden      : 允许不保存buffer而切换buffer (w/o=without)


# plugin

1. buffer explore

    'bufexplorer.vim,http://www.vim.org/script.php?script_id=42'

   `\be`                             : list buffers in current buffer explore

   `\bs`                             : list buffers op split explore
