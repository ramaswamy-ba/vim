source ~/.vim/run_vertical.vim

command! -nargs=0 Make call Compile()
function Compile()
    let main_win_buf = bufwinnr(expand("%:p:t"))

    silent! execute set mp=g++\ -std=c++2c\ -fconcepts\ -D_GLIBCXX_USE_CXX11_ABI=0\ -ggdb\ -lpthread -o\ %<\ %'
    silent! execute 'make'
    silent! execute '15cw'
    silent! execute 'redraw'

    if main_win_buf > 0
        silent execute main_win_buf . 'wincmd w'
    endif
endfunction

command! -nargs=? Run call s:RunFunc(<q-args>)
function! s:RunFunc(args) abort
    let runCmd = ""
    if empty(a:args)
        let runCmd = expand('%:p:r')
    else
        let runCmd = join(map(split(a:args), 'expand(v:val)'))
    endif

    let main_win_buf = bufwinnr(expand("%:p:t"))

    if !empty(runCmd)
        "echo 'Executing: '.runCmd
        call ExecuteInshellv(runCmd)
    endif
    if main_win_buf > 0
        silent execute main_win_buf . 'wincmd w'
    endif
    echo "Window " .main_win_buf
endfunction
