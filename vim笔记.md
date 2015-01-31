# vim regular configuration

```vim
" 4 blank replace tab
set ts=4
set expandtab
set autoindent

" fmt go file
" when close file，execute go fmt on buffer
autocmd FileType go autocmd BufWritePre <buffer> Fmt

" display status bar
set statusline=[%n]\ %f%m%r%h\ \|\ \ pwd:\ %{CurDir()}\ \ \|%=\|\ %l,%c\ %p%%\ \|\ ascii=%b,hex=%b%{((&fenc==\"\")?\"\":\"\ \|\ \".&fenc)}\ \|\ %{$USER}\ @\ %{hostname()}\
```
