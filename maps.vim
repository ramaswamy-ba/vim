map c* *<C-O>:%s///gn<CR>
map <C-w>e :vertical wincmd f<CR>
"merge tabs into windows
map <C-w>W :Tabmerge<CR>

"Normal mode maps
nmap <silent> <F7> :NERDTreeToggle<CR>
nmap <silent> <F8> :NERDTreeMirror<CR>

"Command line maps
cmap qw :wind q
