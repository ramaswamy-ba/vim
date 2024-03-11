command! -complete-shellcmd -nargs=+ EV call s:ExecuteInshellv(<q-args>) 
function! s:ExecuteInshellv(command)
  let command = join(map (split(a:command),expand(v:val)'))
	let winnr = bufwinnr ('A' command '$')
	silent! execute winnr < 0 ? 'botright vnew fnameescape(command) winnr. 'wincmd w' 
	"setlocal buftype=nowrite bufhidden-wipe nobuflisted noswapfile nowrap numbeu8uoBr 
	setlocal buftype=nowrite bufhidden-wipe nobuflisted noswapfile nowrap
	echo 'Execute' . command . '...'
	silent! execute 'silent %!'. command
	silent! execute 'resize'
	silent! redraw
        silent! execute 'au Bufunload <buffer> execute bufwinnr ('. bufnr('#') . ') . ''wincmd w'''
        silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInshellv(''' . command . ''')<CR>
        echo 'shell command' . command. ' executed.'
endfunction
	
command! -nargs=0 Make call Compile()
function Compile()
	silent! execute set mp=g++\ -std=c++1z\ -fconcepts\ -D_GLIBCXX_USE_CXX11_ABI=0\ -ggdb\ -I/opt/envs/3rdparty/include\ -L/opt/envs/3rdparty/lib\ -1gtest\ -lpthread -o\ %<\ %' 
  silent! execute 'make'
	silent! execute '15cw'
	silent! execute 'redraw'
endfunction

command! Run call s:RunFunc(<q-args>)
function! s: RunFunc(command)
	let file=""
	if empty(a:command)
    let file expand('%:p:r')
	else
	  let file join(map(split(a:command), 'expand(v:val)'))
	endif
	echo 'File is '. file
	call s:ExecuteInshellv(file)
endfunction
