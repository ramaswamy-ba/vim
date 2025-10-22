set number
set hlsearch
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set ignorecase
set incsearch
set smartcase
set hlsearch
set splitright splitbelow
set mouse=a
set bg=dark
set noerrorbells
set novisualbell

set autoindent
set smartindent

set belloff=all
filetype plugin on
filetype plugin indent on

syntax on

autocmd BufRead,BufNewFile *.proto set filetype=cpp
autocmd FileType cpp set mps+=<:> "finding matching closing template bracket
autocmd FileType c,cpp setlocal keywordprg=:Cppman
au VimEnter * if &diff | set bg=dark | colorscheme habamax | else | colorscheme desert| endif

set makeprg=/usr/local/opt/gcc/bin/g++\ -std=c++2a\ %\ -o\ %<
set path=.,/usr/local/opt/gcc/include/c++/14,/usr/local/include,/usr/include

source ~/.vim/function.vim
source ~/.vim/abbrevation.vim
source ~/.vim/maps.vim
source ~/.vim/plugins.vim
source ~/.vim/lsp_map.vim

 function! AddTemplateFromFile()
     let template_path = expand('~/.vim/templates/cpp_template.cpp')
     if getline(1) == '' && filereadable(template_path)
         "execute '0r ' . template_path
         silent execute '0r ' . fnameescape(template_path)
         echo "Added"
     endif
 endfunction

 autocmd BufNewFile *.cpp call AddTemplateFromFile()
