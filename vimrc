function! MySys()
    if has("win16") || has("win32") || has("win64") || has("win95")
        return "windows"
    elseif has("unix")
        return "linux"
    endif
endfunction
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
hi Search term=standout ctermfg=0 ctermbg=3
if has("autocmd")
    autocmd FileType python setlocal ts=4 sw=4 expandtab
    "let the cursor jump to the positon opend last time
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set smartindent
set completeopt=preview,menu
set autowrite
set foldmethod=indent 

inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
set textwidth=80
autocmd BufNewFile,BufRead *.tex set spell

set fileformats=unix
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle  "godlygeek/tabular"
Bundle "nathanaelkane/vim-indent-guides"
let g:UltiSnipsExpandTrigger="<C-z>"
let g:UltiSnipsListSnippets="<C-i>"
"let g:indent_guides_enable_on_vim_startup = 0
"let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_tab_guides = 2 
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
"set cursorcolumn
"hi CursorColumn ctermbg=blue ctermfg=red
" 
map <leader>cl :call SetColorColumn()<CR>
function! SetColorColumn()
let col_num = virtcol(".")
let cc_list = split(&cc, ',')
if count(cc_list, string(col_num)) <= 0
execute "set cc+=".col_num
else
execute "set cc-=".col_num
endif
endfunction
