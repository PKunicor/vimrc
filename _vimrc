" 基本配置
" 
"
" 设置行号
set number
" 语法高亮。自动识别代码，使用多种颜色表示
syntax enable
" 选择颜色主题(已经下载好并放到$VIM/vim82/colors文件夹下) ，推荐自行下载使用solarized主题
"colorscheme solarized"

" 设置gvim的字体
set guifont=Consolas:h12

" 设置gvim下和外部的复制粘贴
"vmap <C-c> "+y
"vmap <C-x> "+c
"vmap <C-v> c<ESC>"+p
"imap <C-v> <C-r><C-o>+

" 支持使用鼠标
"set mouse=a

" 按下回车键后，下一行的缩进会自动跟上一行的缩进保持一致
set autoindent
"智能缩进
"set smartindent 

" 按下Tab键后，vim显示的空格数
set tabstop=2

" normal模式下，>>增加一级缩进、<<取消一级缩进、==取消全部缩进时，每一级缩进的空格数
set shiftwidth=2

" 自动将Tab转为空格(防止Tab键在不同编辑器缩进不一致导致问题)
set expandtab

" Tab转为多少个空格
set softtabstop=2


" 光标所在行高亮
set cursorline
highlight CursorLine   cterm=NONE ctermbg=black guibg=NONE guifg=NONE

" 关闭自动折行
set nowrap

" 垂直滚动时，光标距离顶部/底部的距离（单位：行）
set scrolloff=5

" 水平滚动时，光标距离行首或行尾的距离（单位：字符）
set sidescrolloff=30

" 设置行宽，即一行显示多少字符
set textwidth=1000

" 是否显示状态栏：0表示不显示，1表示只在多窗口显示，2表示显示
set laststatus=2

" 设置状态条显示的信息：文件名、光标所在字符的ASCII码、光标所在字符的ASCII码的十六进制、光标所在的位置、光标所在行之上的内容占整个文件的百分比、文件总行数
set statusline=\ %F%m%r%h%w\ \ \ \ ASCII=\%03.3b\ \ \ \ HEX=\%02.2B\ \ \ \ POS=%04l,%04v\ \ \ \ %p%%\ \ \ \ NumOfLine=%L

" 显示行尾的空格
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

" 光标遇到括号时，自动高亮对应的另一半括号
set showmatch

" 命令行模式下，在底部显示当前键入的指令。例如键入dd删除一行时，键入第一个d，底部右侧显示d，完全键入dd时，操作完成，底部显示消失
set showcmd

" 搜索时，高亮显示搜索结果
set hlsearch

" 搜索时，每输入一个字符，自动跳到第一个匹配的结果
set incsearch

" 搜索时忽略大小写
set ignorecase

" 不创建交换文件
set noswapfile

" 保留 撤销 操作历史
set undofile
" 设置操作历史文件的保存位置
set undodir=$VIM\.undo
" vim需要记住多少次历史操作
set history=1000

" 命令模式下，底部操作指令按下 Tab 键自动补全。第一次按下 Tab，会显示所有匹配的操作指令的清单；第二次按下 Tab，会依次选择各个指令
set wildmenu
set wildmode=longest:list,full

" 定义F1快捷键为切换vim窗口
map &ltF1&gt &ltC-w&gtw

"设置文件的代码形式 utf8
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,cp936

" 文件配置
"新建.c,.h,.sh,.java文件，自动插入文件头 
"不要这个功能"


set pythonthreedll=python39.dll

""""""""""""""""""""""""""""""""""""""""""
"Vundle插件安装部分
""""""""""""""""""""""""""""""""""""""""""
" Vundle配置"
set nocompatible              " 设置vim和vi不兼容。在兼容模式下运行时，Vim 大部分增强及改善的功能就不可用了,vundle要求必须有
filetype off                  " required
" set the runtime path to include Vundle and initialize

" 所有的插件安装必须在此行语句之后
set rtp+=$VIM/vimfiles/bundle/Vundle.vim/
call vundle#begin('$VIM/vimfiles/bundle/')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Keep Plugin commands between vundle#begin/end.
"安装插件代码"
" 在vim中使用git命令
Plugin 'tpope/vim-fugitive'
" 在vim行号旁显示git diff的差异标记
Plugin 'airblade/vim-gitgutter'
Plugin 'luochen1990/rainbow'



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line





"""""""""""""""""""""""""""""""""""""""""""
"插件配置部分 
"""""""""""""""""""""""""""""""""""""""""""
"彩虹括号"

let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
	let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}







" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction