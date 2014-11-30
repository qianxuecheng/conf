"设置行号
set nu 
"设置语法高亮
syntax enable
syntax on
set background=dark
"设置配色方案solarized or murphy
colorscheme murphy
"设置自动缩进
set autoindent
set smartindent
"设置字符编码
set encoding=utf-8
set fileencoding=utf-8
"设置终端字符编码
set termencoding=utf-8
"设置vi不兼容
set nocompatible
"设置帮助语言
set helplang=cn
"设置tab键宽度
set tabstop=4
set softtabstop=4
"设置shift宽度
set shiftwidth=4
"设置tab space不兼容
set noexpandtab
"文件类型
filetype on
filetype plugin on
filetype indent on
filetype plugin indent on
"共享剪贴板 visual mode
"vmap y :w !pbcopy<CR><CR>
"normal mode
"nmap yy :.w !pbcopy<CR><CR>
"nmap p :r !pbpaste<CR><CR>
"设置确认 
set confirm
"设置补全
set completeopt=preview,longest,menu
"设置搜索高亮
set hlsearch
set incsearch
"设置括号匹配高亮
set showmatch
"插入模式括号自动补全
:inoremap (  ()<Esc>i
:inoremap )  <c-r>=ClosePair(')')<CR>
:inoremap {  {<CR><CR>}<ESC>0ki<Tab>
:inoremap }  <c-r>=ClosePair('}')<CR>
:inoremap [ []<Esc>i
:inoremap ]  <c-r>=ClosePair(']')<CR>
:inoremap ' ''<Esc>i
:inoremap " ""<Esc>i
function ClosePair(char)
if getline('.')[col('.')-1]==a:char
	return "\<Right>"
else
	return a:char
endif
endf

"新建文件模版
autocmd BufNewFile   *.py exec  ":call SetTitle()"
"设置标题
func SetTitle()
	"文件类型.py
	"if &filetype=='py'
	if expand("%:e")=='py'
		call setline(1,"\################")
		call append(line("."),"\#!/usr/bin/env python")
		call append(line(".")+1,"#coding:utf8")
		call append(line(".")+2,"__author__='xuecheng.qian'")
		call append(line(".")+3,"\################")
	endif
	autocmd BufNewFile * normal G
endfunc
