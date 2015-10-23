filetype plugin on
set paste
set nocompatible
set relativenumber
syntax on
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufRead *.py set smarttab
autocmd BufRead *.py map <buffer> <S-e> :w<CR>:!/usr/bin/env python %
autocmd BufRead *.py set expandtab
autocmd BufRead *.py set autoindent
autocmd BufRead *.py highlight BadWhitespace ctermbg=red guibg=red
autocmd BufRead *.py match BadWhitespace /^\t\+/
autocmd BufRead *.py match BadWhitespace /\s\+$/

autocmd BufRead *.js highlight BadWhitespace ctermbg=red guibg=red
autocmd BufRead *.js match BadWhitespace /^\t\+/
autocmd BufRead *.js match BadWhitespace /\s\+$/

autocmd BufRead *.html highlight BadWhitespace ctermbg=red guibg=red
autocmd BufRead *.html match BadWhitespace /^\t\+/
autocmd BufRead *.html match BadWhitespace /\s\+$/

autocmd BufRead *.cpp set autoindent 
autocmd BufRead *.h set autoindent 

autocmd BufRead *.md syntax=markdown
"autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(
highlight NobreakSpace ctermbg=red guibg=red
match NobreakSpace / /

autocmd BufRead,BufNewFile *.twig set filetype=htmljinja
"if has("autocmd")
"    autocmd FileType python set complete+=k~/.vim/pydiction-1.2/pydiction isk+=.,(
"endif " has("autocmd"

set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab

set expandtab
set smartindent


"the status bar is always displayed

set laststatus=2 
if has("statusline")
    set statusline=%<%f%h%m%r%=%l,%c\ %P  
elseif has("cmdline_info")
    set ruler " display cursor position
endif

" desactivate the arrow key in order to force myself
" to only use hjkl
map <Left> <Esc>                                                                
map <Down> <Esc>
map <Up> <Esc>
map <Right> <Esc>
"imap <Left> <Esc>

"using TAB will complete as much as possible and other tab will display 
" one by one the other possibility
set wildmode=longest,full 

" in order to autocomplete php (and also SQL/HTML embed in it
let php_sql_query=1                                                                                        
let php_htmlInStrings=1

"I've never really used them 
set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap files

" in order to use the mouse
set mouse=a
  
set autochdir
"
set showcmd


"let g:ycm_key_list_select_completion = ['\<TAB>', '<Down>']

let g:clang_library_path = "/usr/lib/"
" syntastic
"let g:syntastic_auto_loc_list=1
""let g:syntastic_check_on_open=1
"let g:syntastic_disabled_filetypes=['html']
"let g:syntastic_enable_signs=1

colorscheme torte

let g:go_fmt_command = "goimports"

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

let g:syntastic_go_checkers = ['go', 'golint', 'govet']
let g:syntastic_aggregate_errors = 1

execute pathogen#infect()
