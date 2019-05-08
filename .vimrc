syntax enable
syntax on

" gtags configure
" To use the default key/mouse mapping:
let GtagsCscope_Auto_Map = 1
" To ignore letter case when searching:
let GtagsCscope_Ignore_Case = 1
" To use absolute path name:
let GtagsCscope_Absolute_Path = 1
" To deterring interruption:
let GtagsCscope_Keep_Alive = 1
" If you hope auto loading:
let GtagsCscope_Auto_Load = 1
let GtagsCscope_Quiet = 1
" To use 'vim -t ', ':tag' and '<C-]>'
set cscopetag
let Gtags_Auto_Map = 1
" output cscope result to quickfix 
set cscopequickfix=s-,g-,c-,d-,i-,t-,e-,f-
" open quickfix window by default
" in case vim -t xxx match so many tags
" the results can be show in quickfix
" rather than scroll in a buffer
copen
" quit vim when only left quickfix window
autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix" | quit | endif

:nmap \s :cs find s <C-R>=expand("<cword>")<CR><CR>
:nmap \a :cs find a <C-R>=expand("<cword>")<CR><CR>
:nmap \d :cs find d <C-R>=expand("<cword>")<CR><CR>
:nmap \g :cs find g <C-R>=expand("<cword>")<CR><CR>
:nmap \i :cs find i <C-R>=expand("<cword>")<CR><CR>
:nmap \c :cs find c <C-R>=expand("<cword>")<CR><CR>
:nmap \e :cs find e <C-R>=expand("<cword>")<CR><CR>
:nmap \t :cs find t <C-R>=expand("<cword>")<CR><CR>
:nmap \f :cs find f <C-R>=expand("<cword>")<CR><CR>

" taglist configure
" open taglist and close quickfix
" close taglist and open quickfix
function! g:GTTaglist()
  let winnum = bufwinnr("__Tag_List__")
  if winnum != -1
    botright copen
  else
    cclose
  endif
  :TlistToggle
endfunction

command! -nargs=0 GTTaglist call g:GTTaglist()
:nmap <F9> : GTTaglist<CR>

" airline configure
let g:airline#extensions#tabline#enabled = 1

" ctrlp configure
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = 'find %s -type f'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" tag preview configure
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
