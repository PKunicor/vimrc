" 基本配置
" 
"设置编码方式
set encoding=utf-8
" 设置行号
set number


" 设置gvim的字体
set guifont=Consolas:h12

" 设置gvim下和外部的复制粘贴
"vmap <C-c> "+y
"vmap <C-x> "+c
"vmap <C-v> c<ESC>"+p
"imap <C-v> <C-r><C-o>+

" 常规模式禁用方向键
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>

" 插入模式禁用方向键
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" 支持使用鼠标
set mouse=a

" 按下回车键后，下一行的缩进会自动跟上一行的缩进保持一致
set autoindent

"智能缩进  
set smartindent "

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
set statusline=\ %F%m%r%h%w\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ POS=%04l,%04v\ \ \ \ %p%%\ \ \ \ NumOfLine=%L
"set statusline=\ %F%m%r%h%w\ \ \ \ ASCII=\%03.3b\ \ \ \ HEX=\%02.2B\ \ \ \ POS=%04l,%04v\ \ \ \ %p%%\ \ \ \ NumOfLine=%L"

" 显示行尾的空格
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

" 光标遇到括号时，自动高亮对应的另一半括号
"set showmatch
"取消高亮括号
let loaded_matchparen=1

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
call plug#begin('$VIM/vimfiles/plugged')
"安装插件代码"
" 在vim中使用git命令
Plug 'tpope/vim-fugitive', {'on': []}

" 在vim行号旁显示git diff的差异标记
Plug 'airblade/vim-gitgutter', {'on': []}
Plug 'luochen1990/rainbow'
Plug 'altercation/solarized'
Plug 'ycm-core/YouCompleteMe', {'on': []}
Plug 'rhysd/vim-clang-format', {'on': []}
call plug#end()          

"
" Brief help
" :PlugInstall  
" :PlugClean   
" :PlugStatus



"""""""""""""""""""""""""""""""""""""""""""
"插件配置部分 
"""""""""""""""""""""""""""""""""""""""""""
"延迟加载
" 配置：
" 500 毫秒后调用 LoadPlug，且只调用一次, 见 `:h timer_start()`

call timer_start(500, 'Loadplug')

function! Loadplug(timer) abort
  call plug#load('YouCompleteMe')
  call plug#load('vim-gitgutter')
  call plug#load('vim-fugitive')
  call plug#load('vim-clang-format')
endfunction
""""""""""""""""""""""""""""""""""""""""""
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



"""""""""""""""""""""""""""""""""""""""""""
"颜色主题"
set background=light
" 语法高亮。自动识别代码，使用多种颜色表示
syntax enable
" 选择颜色主题(已经下载好并放到$VIM/vim82/colors文件夹下) ，推荐自行下载使用solarized主题
colorscheme solarized



"""""""""""""""""""""""""""""""""""""""""""
"YouCompleteMe配置
"set runtimepath+=$VIM/vimfiles/bundle/YouCompleteMe
" 寻找全局配置文件
"let g:ycm_global_ycm_extra_conf='$VIM/vimfiles/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
"自动语义补全
"  \   'c' : ['->', '.'],
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'cpp' : ['->', '.', '::'],
  \ }
"文件类型白名单
let g:ycm_filetype_whitelist = {    
			\ "c":1,
			\ "cpp":1, 
            \}
set completeopt=menu,menuone
"set completeopt+=popup  "弹出式窗口
let g:ycm_add_preview_to_completeopt = 0

let g:ycm_auto_trigger = 0                                  "开启语义触发器
let g:ycm_collect_identifiers_from_tags_files = 0           " 开启 YCM基于标签引擎
let g:ycm_collect_identifiers_from_comments_and_strings = 0 " 注释与字符串中的内容也用于补全
let g:ycm_seed_identifiers_with_syntax = 0                  " 语法关键字补全
let g:ycm_confirm_extra_conf = 0                            " 关闭加载.ycm_extra_conf.py提示
"let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']  " 映射按键,没有这个会拦截掉tab, 导致其他插件的tab不能用.
"let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']   "选择前一个匹配的字符串
let g:ycm_complete_in_comments = 0                          " 在注释输入中也能补全
let g:ycm_complete_in_strings = 0                           " 在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0 " 注释和字符串中的文字也会被收入补全
"let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0                           " 禁用语法检查
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"       " 回车即选中当前项
"nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>     " 跳转到定义处
let g:ycm_min_num_of_chars_for_completion=99                 " 从第2个键入字符就开始罗列匹配项
let g:ycm_echo_current_diagnostic =0                         " 禁止光标回显诊断文本
let g:ycm_auto_hover = ''                                    " 短暂延迟后显示光标位置弹出窗口
let g:ycm_keep_logfiles = 0                                  " 关闭保留日志文件
let g:ycm_add_preview_to_completeopt = 0                     " 将preview字符串添加到completeopt选项中
let g:ycm_autoclose_preview_window_after_completion = 1      " 自动关闭窗口
let g:ycm_autoclose_preview_window_after_insertion = 1       " 离开插入模式后自动关闭窗口
let g:ycm_key_invoke_completion = '<c-z>'                    " 使用快捷键唤醒匹配

"""""""""""""""""""""""""""""""""""""""""""
"vim-clang-format 配置
"需要下载LLVM
"""""""""""""""""""""""""""""""""""""""""""
             "AccessModifierOffset" : -2,                    " 访问修饰符偏移量
             "AlwaysBreakTemplateDeclarations" : "true",     " 总是打破模板声明
             "Standard" : "C++11",
             "AllowShortLoopsOnASingleLine" : "false"        " 不允许循环单行
             "AllowShortIfStatementsOnASingleLine" : "false" " 不允许if单行
             "AllowShortFunctionsOnASingleLine" : "false"    " 不允许函数方法单行
             "AllowAllParametersOfDeclarationOnNextLine" : "false","参数不换行
             "AlignTrailingComments" : "true"                " 注释左对齐
             "AlignEscapedNewlinesLeft" : "true",            " 左对齐
             "BreakBeforeBraces" : "Custom"                  " 大括号打破使用的样式 ,全部单独设置,默认false
             "BraceWrapping" : {"BeforeElse" : "true"},      " 设置单独的大括号格式
             "MaxEmptyLinesToKeep" : 100000                  " 最大的空行数
             "ColumnLimit" : 0                               " 每行字符限制  没有限制
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -2,                    
            \ "AlwaysBreakTemplateDeclarations" : "true",     
            \ "Standard" : "C++11",
            \ "AllowShortLoopsOnASingleLine" : "false",       
            \ "AllowShortIfStatementsOnASingleLine" : "false",
            \ "AllowShortFunctionsOnASingleLine" : "false", 
            \ "AllowAllParametersOfDeclarationOnNextLine" : "false",
            \ "AlignTrailingComments" : "true",
            \ "AlignEscapedNewlinesLeft" : "true",            
            \ "BreakBeforeBraces" : "Custom",
            \ "BraceWrapping" : {"BeforeElse" : "true"},
            \ "MaxEmptyLinesToKeep" : 100000,
            \ "ColumnLimit" : 0
            \}
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>
"""""""""""""""""""""""""""""""""""""""""""
"编译运行
"""""""""""""""""""""""""""""""""""""""""""
function! CompileRun()
  execute "w"
  "C程序
  if &filetype == 'c'
    execute "terminal gcc -fexec-charset=GBK -Wall -g -o %< %"
    "c++程序
  elseif &filetype == 'cpp'
    execute "terminal g++ -fexec-charset=GBK -Wall -g -o %< %"
  endif
endfunction
"结束定义CompileRun

"定义Run函数
function Run()
  if &filetype == 'c' || &filetype == 'cpp'
    silent execute "!%<.exe"
  endif
endfunction

"定义Debug函数，用来调试程序

function! Debug()
  execute "w"
  "C程序
  if &filetype == 'c'
    execute "terminal gcc -fexec-charset=GBK -Wall -g -o %< %"
    silent execute "!gdb %<.exe"
  elseif &filetype == 'cpp'
    execute "terminal g++ -fexec-charset=GBK -Wall -g -o %< %"
    silent execute "!gdb %<.exe"
endif
endfunction
"结束定义Debug
"设置程序的运行和调试的快捷键F5和Ctrl-F5
map <F5> :call CompileRun()<CR>
map <F6> :call Run()<CR>
map <F10> :call Debug()<CR>
"""""""""""""""""""""""""""""""""""""""""""

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

"必须加载末尾才有作用
" 关闭保留 撤销 操作历史
set noundofile
"设置操作历史文件的保存位置
"set undodir=$VIM\.undo
" vim需要记住多少次历史操作
"set history=1000

"关闭备份文件"
set nobackup

"取消回车生成注释
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


