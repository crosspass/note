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

select some lines and press keyboard 2>,then selected lines will indentation 2 tab

`Ex`                  : display directory files


# plugin

1. buffer explore

    'bufexplorer.vim,http://www.vim.org/script.php?script_id=42'

   `\be`                             : list buffers in current buffer explore

   `\bs`                             : list buffers op split explore
