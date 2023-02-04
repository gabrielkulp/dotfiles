"https://www.guckes.net/vim/setup.html
set nocp
set showcmd
silent! colorscheme molokai
"clear the background color, regardless of theme
autocmd ColorScheme * highlight Normal ctermbg=None
autocmd ColorScheme * highlight NonText ctermbg=None
set cursorline
" use italics
highlight Comment cterm=italic
"let &t_ZH="\e[3m"
"let &t_ZR="\e[23m"

" WHY IS MATCHING BACKWARDS
set showmatch
"hi MatchParen cterm=bold ctermbg=none ctermfg=magenta
highlight MatchParen cterm=underline ctermbg=black ctermfg=NONE
highlight MatchParen gui=underline guibg=black guifg=NONE

"restore cursor position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"filetype plugin indent on
set noet
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set smarttab
set bg=dark
syntax on

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" remove split character or use box drawing to remove gaps
" :set fillchars=vert:│
:set fillchars=vert:\ 

set foldmethod=syntax
set foldnestmax=10
set nofoldenable

autocmd FileType python
      \ setlocal expandtab
autocmd BufReadPre,FileReadPre *.py set expandtab
autocmd FileType yaml
      \ setlocal expandtab
	  \ tabstop=2
	  \ softtabstop=2
	  \ shiftwidth=2
autocmd BufReadPre,FileReadPre *.keymap set ts=6 sw=6 expandtab
autocmd FileType markdown
	  \ setlocal spell

set spelllang=en_us
set spellfile=~/.vim/en.utf-8.add

set linebreak
set breakindent
set display+=lastline
set display+=uhex " display unprintable characters in hex
set hlsearch " search with highlight
"set number relativenumber
set title

set cm=blowfish2

" cursor movement relative to line wrapping in normal mode
noremap <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <expr> k (v:count == 0 ? 'gk' : 'k')
noremap <expr> <Down> (v:count == 0 ? 'g<Down>' : '<Down>')
noremap <expr> <Up> (v:count == 0 ? 'g<Up>' : '<Up>')

" cursor movement relative to line wrapping in edit mode
inoremap <Up>   <C-O>gk
inoremap <Down> <C-O>gj

" center display after searching
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" reselect visual block after shifting
vnoremap < <gv
vnoremap > >gv

" nnoremap <C-n> :NERDTreeToggle<CR>
"nnoremap <leader>n :NERDTreeFocus<CR>
"nnoremap <C-n> :NERDTree<CR>
"nnoremap <C-t> :NERDTreeToggle<CR>
"nnoremap <C-f> :NERDTreeFind<CR>

augroup colorcolumn
  autocmd!
  autocmd FileType gitcommit
        \ if exists('+colorcolumn') |
        \   set colorcolumn=73 |
        \ else |
        \   let w:m2 = matchadd('ErrorMsg', '\%>72v.\+', -1) |
        \ endif
augroup END

" column 80 in red
"augroup colorcolumn
"  autocmd!
"  if exists('+colorcolumn')
"    set colorcolumn=81
"  else
"    autocmd BufWinEnter * let w:m2 = matchadd('ErrorMsg', '\%>80v.\+', -1)
"  endif
"augroup END

let g:ale_linters = {'tex': ['chktex', 'cspell']}
let g:ale_c_cc_options = '-std=c11 -Wall -disable-checker security.insecureAPI.DeprecatedOrUnsafeBufferHandling'
let g:ale_sign_error = '┣━'
" ⭘⦿●⦁⸰•🠞
let g:ale_sign_warning = '├─'
"·
" don't lint right away when opening a file
let g:ale_lint_on_enter = 0
" do lint when saving, even if nothing's changed
let g:ale_lint_on_save = 1
