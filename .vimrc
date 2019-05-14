
set nocompatible
set backspace=indent,eol,start
syntax on
syntax enable
filetype plugin indent on
set autoread
set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,gb2312,gbk,gb18030
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set autoindent
set smartindent
set ruler
set paste

"gtags settings
set cscopetag
let GtagsCscope_Auto_Load = 1
let CtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1
set cscopequickfix=s-,g-,d-,c-,t-,e-,f-,i-

"open quickfix window if needed
autocmd QuickFixCmdPost [^l]* nested botright cwindow

"key maps for gtags
"find : Query for a pattern            (Usage: find a|c|d|e|f|g|i|s|t name)
"       a: Find assignments to this symbol
"       c: Find functions calling this function
"       d: Find functions called by this function
"       e: Find this egrep pattern
"       f: Find this file
"       g: Find this definition
"       i: Find files #including this file
"       s: Find this C symbol
"       t: Find this text string
:nmap \a :cs find a <C-R>=expand("<cword>")<CR><CR>
:nmap \c :cs find c <C-R>=expand("<cword>")<CR><CR>
:nmap \d :cs find d <C-R>=expand("<cword>")<CR><CR>
:nmap \e :cs find e <C-R>=expand("<cword>")<CR><CR>
:nmap \f :cs find f <C-R>=expand("<cword>")<CR><CR>
:nmap \g :cs find g <C-R>=expand("<cword>")<CR><CR>
:nmap \i :cs find i <C-R>=expand("<cword>")<CR><CR>
:nmap \s :cs find s <C-R>=expand("<cword>")<CR><CR>
:nmap \t :cs find t <C-R>=expand("<cword>")<CR><CR>

"taglist settings
let Tlist_Inc_Winwidth=0
let Tlist_Use_Right_Window=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Auto_Open=1

:nmap <F8> :TlistToggle<CR>
function! g:TlistFocus()
  let save_winnr = winnr()
  let winnum = bufwinnr("__Tag_List__")
  if winnum == -1
    :TlistToggle
    let winnum = bufwinnr("__Tag_List__")
  endif
  if winnum != -1
      if save_winnr != winnum
        exe winnum . 'wincmd w'
      endif
  endif
endfunction
"focus to Tag list window via CTL command
command! -nargs=0 -bar CTL call g:TlistFocus()

" airline configure
let g:airline#extensions#tabline#enabled = 1

"lightline settings
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif

"ale settings
let g:ale_completion_enabled = 1

"multiple-cursor settings
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<C-a>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<C-a>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-N>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

"tag preview configure
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<CR>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<CR>

"fzf configure
set rtp+=~/.fzf

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'left': '~40%' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'gtags'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

nmap <C-p> :Files<CR>
nmap <C-e> :Buffers<CR>

" press s in qf window to open tag in new split window
autocmd FileType qf nnoremap <silent><buffer> s <Enter><C-W>s
" press v in qf window to open tag in new vertical split window
autocmd FileType qf nnoremap <silent><buffer> v <Enter><C-W>v
" press t in qf window to open tag in new tab
autocmd FileType qf nnoremap <silent><buffer> t <Enter><C-W>T
