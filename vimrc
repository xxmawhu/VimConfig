function! MySys()
    "return srting: 'linux', or 'windows'
    "determine the operate system 
    if has("win16") || has("win32") || has("win64") || has("win95")
        return "windows"
    elseif has("unix")
        return "linux"
    endif
endfunction

""""""""""""""""""""""""""
" 通用设置
""""""""""""""""""""""""""
syntax on
filetype indent on
filetype plugin on 
filetype plugin indent on
set number
set magic
set lz
set ruler
set ts=4  expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set backspace=indent,eol,start
set showmatch
set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8
set encoding=utf-8
set matchtime=2
set smartindent
set completeopt=preview,menu
set autowrite
set foldmethod=indent 
" 每行长度为80字符
set textwidth=80
" 自动折行
set wrap
hi Search term=standout ctermfg=0 ctermbg=3
set matchtime=2
set hlsearch
hi Search term=standout ctermfg=0 ctermbg=3
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 针对py脚本，设置tab键。早期的python要求必须要4个空格对齐，虽然新的
" 版本可以用两个空格，但是强烈建议不要用4个空格对齐
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
    autocmd FileType python setlocal ts=4 sw=4 expandtab
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"每次重新打开文件，光标停留在原来的位置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i

"执行拼写检查，针对tex文件，一般的文件不需要检查单词的拼写问题
autocmd BufNewFile,BufRead *.tex set spell
autocmd BufNewFile,BufRead *.txt set spell
autocmd BufNewFile,BufRead *.md set spell

set nocompatible              " be iMproved, required
" filetype off                  " required
set shell=/bin/bash
set fileformats=unix
let g:UltiSnipsExpandTrigger="<C-z>"
let g:UltiSnipsListSnippets="<C-i>"
"let g:indent_guides_enable_on_vim_startup = 0
"let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_tab_guides = 2 
let g:indent_guides_auto_colors = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 配色方案
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
"set cursorcolumn
"hi CursorColumn ctermbg=blue ctermfg=red
" 
function! SetColorColumn()
    let col_num = virtcol(".")
    let cc_list = split(&cc, ',')
    if count(cc_list, string(col_num)) <= 0
        execute "set cc+=".col_num
    else
        execute "set cc-=".col_num
    endif
endfunction
map <leader>cl :call SetColorColumn()<CR>

""""""""""""""""""""""""""""""""""""""""""
"Add path
""""""""""""""""""""""""""""""""""""""""""""
"set path+=/besfs/users/lihb/software/SL6/root-6.18.00/include

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle的设置
" https://github.com/VundleVim/Vundle.vim
""""""""""""""""""""""""""i""""""""""""""""""""""""""""""
""
" ycm
""
"let g:ycm_clangd_binary_path = '/besfs/users/lihb/software/SL6/llvm/stage1/install/bin'

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

"a good auto complete plug for python
Plugin 'davidhalter/jedi-vim'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'https://github.com/xxmawhu/vim-copyright.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.

" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'gmarik/vundle'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" indent guide line
Plugin 'xxmawhu/indentLine'
Plugin 'nathanaelkane/vim-indent-guides'
" 自动补全
"Plugin 'Valloric/YouCompleteMe'

" 注释工具， 选中行，依次按 `\`, `c` , `c`
Plugin 'scrooloose/nerdcommenter'

" 对齐
" 按照一定的符号对语句块进行对齐
" aligning the selected block text with symbol `xx`,
" such as :Tabular\=
" such as :Tabular\&
" such as :Tabular\,
Plugin  'godlygeek/tabular'
" 利用Vim管理仓库
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
"
" configure for copyright
let g:file_copyright_name = "Xin-Xin MA"
let g:file_copyright_email = "xxmawhu@163.com"
let g:file_copyright_auto_filetypes = ['sh', 'plx', 'pl', 'pm', 'py', 'python', 'h', 'hpp', 'c', 'cpp', 'java', 'cxx', 'cc', 'hh']

let g:file_copyright_comment_prefix_map  = {
            \"python": "\#", "py":"\#",
            \"cpp":"/*", "c":"/*", "h":"/*", "hpp":"/*",
            \"go":"/*",
            \"vim":"\"",
            \"tex":"\%",
            \"sh":"\#", "shell":"\#",
            \}

let g:file_copyright_comment_mid_prefix_map = {
            \"python": "\#", "py":"\#",
            \"cpp":"\#", "c":"\#", "h":"\#", "hpp":"\#",
            \"go":"\#",
            \"vim":"\"",
            \"tex":"\%",
            \"sh":"\#", "shell":"\#",
            \}

let g:file_copyright_comment_end_map = {
            \"cpp":"*/", "c":"*/", "h":"*/", "hpp":"*/",
            \"go":"*/",
            \}

" use ctrl+p to trigger an auto-completion    
let g:jedi#completions_command = "<C-p>"
autocmd CompleteDone * pclose
map gs :Gstatus<CR>
