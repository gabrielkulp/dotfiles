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

set showmatch
set matchtime=0
" uninvert bracket highlighting (why is it so bad by default?)
au BufNewFile,BufRead * hi MatchParen ctermfg=208 ctermbg=NONE

"restore cursor position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"filetype plugin indent on
set noexpandtab
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
" https://items.sjbach.com/319/configuring-vim-right.html
set hidden

" remove split character or use box drawing to remove gaps
" :set fillchars=vert:│
set fillchars=vert:\ 
set showbreak=↪\
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨,space:•
" use :list to actually display these whitespace markers

set foldmethod=syntax
set foldnestmax=10
set nofoldenable

set wildmenu " nicer tab completion for commands
"set wildmenu=list:longest " match commands as typed so far?
set ignorecase
set smartcase " search is case-sensitive only if there's a capital
set scrolloff=5 " context around cursor when scrolling

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" viewport scrolling with ctrl+arrows, 3 lines at a time
noremap <C-Up> 3<C-y>
noremap <C-Down> 3<C-e>


filetype on
filetype plugin on
filetype indent on

autocmd FileType python
      \ setlocal expandtab
autocmd BufReadPre,FileReadPre *.py set expandtab
autocmd FileType yaml
      \ setlocal expandtab
	  \ tabstop=2
	  \ softtabstop=2
	  \ shiftwidth=2
autocmd FileType markdown
	  \ setlocal spell
autocmd BufReadPre,FileReadPre *.keymap set ts=6 sw=6 expandtab
autocmd BufRead,BufNewFile .aliases setfiletype bash

" same as default "ruler" status line, but append HH:MM time
set noruler
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set statusline+=\ %{strftime('%R')}
set laststatus=2

set spelllang=en_us
set spellfile=~/.vim/en.utf-8.add

set linebreak
set breakindent
set display+=lastline
set display+=uhex " display unprintable characters in hex
set hlsearch " search with highlight
set incsearch " ..dynamically while typed
nohlsearch " ..but not right now
"set number relativenumber
set title
"set shortmess=atI " shorten messages like "Press ENTER or type"...

set cm=blowfish2

" use arrow keys to navigate autocomplete popup in insert mode
inoremap <expr> <Up> (pumvisible() ? "<C-p>" : "<Up>")
inoremap <expr> <Down> (pumvisible() ? "<C-n>" : "<Down>")

" cursor movement relative to line wrapping in normal mode
noremap <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <expr> k (v:count == 0 ? 'gk' : 'k')
noremap <expr> <Down> (v:count == 0 ? 'g<Down>' : '<Down>')
noremap <expr> <Up> (v:count == 0 ? 'g<Up>' : '<Up>')

" cursor movement relative to line wrapping in insert mode
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
let g:ale_sign_error = '=>'
" ⭘⦿●⦁⸰•🠞
let g:ale_sign_warning = '->'
"·
let g:ale_set_signs=1 " extra column on left
let g:ale_virtualtext_cursor=1 " add text when cursor is near
let g:ale_set_balloons=1 " popup on mouseover
let g:ale_hover_cursor=1 " also popup on mouseover?
let g:ale_floating_preview=1 " idk
set balloonevalterm " only works with mouse >:(

" don't lint right away when opening a file
let g:ale_lint_on_enter = 0
" do lint when saving, even if nothing's changed
let g:ale_lint_on_save = 1

