scriptencoding utf-8
set enc=utf-8
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()
" documentation for this plugin loader
Plug 'junegunn/vim-plug'

" better defaults
Plug 'tpope/vim-sensible'

" some nice themes
Plug 'flazz/vim-colorschemes'

" markdown highlighting
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

call plug#end()




" Styled and colored underline support
let &t_AU = "\e[58:5:%dm"
let &t_8u = "\e[58:2:%lu:%lu:%lum"
let &t_Us = "\e[4:2m"
let &t_Cs = "\e[4:3m"
let &t_ds = "\e[4:4m"
let &t_Ds = "\e[4:5m"
let &t_Ce = "\e[4:0m"
" Strikethrough
let &t_Ts = "\e[9m"
let &t_Te = "\e[29m"
" Truecolor support
if exists('+termguicolors')
  let &t_8f = "\e[38:2:%lu:%lu:%lum"
  let &t_8b = "\e[48:2:%lu:%lu:%lum"
  let &t_RF = "\e]10;?\e\\"
  let &t_RB = "\e]11;?\e\\"
  set termguicolors
endif
" Bracketed paste
let &t_BE = "\e[?2004h"
let &t_BD = "\e[?2004l"
let &t_PS = "\e[200~"
let &t_PE = "\e[201~"
" Cursor control
let &t_RC = "\e[?12$p"
let &t_SH = "\e[%d q"
let &t_RS = "\eP$q q\e\\"
let &t_SI = "\e[5 q"
let &t_SR = "\e[3 q"
let &t_EI = "\e[1 q"
let &t_VS = "\e[?12l"
" Focus tracking
let &t_fe = "\e[?1004h"
let &t_fd = "\e[?1004l"
execute "set <FocusGained>=\<Esc>[I"
execute "set <FocusLost>=\<Esc>[O"
" Window title
let &t_ST = "\e[22;2t"
let &t_RT = "\e[23;2t"

" vim hardcodes background color erase even if the terminfo file does
" not contain bce. This causes incorrect background rendering when
" using a color theme with a background color in terminals such as
" kitty that do not support background color erase.
let &t_ut=''






"https://www.guckes.net/vim/setup.html
set nocp
set showcmd
"set cursorline
"silent! colorscheme molokai
"silent! colorscheme onehalfdark " doesn't use transparent background
silent! colorscheme pencil
"clear the background color, regardless of theme
autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
autocmd ColorScheme * highlight NonText ctermbg=NONE guibg=NONE
autocmd ColorScheme * highlight Comment cterm=italic
autocmd ColorScheme * highlight Special ctermbg=NONE guibg=NONE
" use italics
"let &t_ZH="\e[3m"
"let &t_ZR="\e[23m"
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=black guibg=black
autocmd BufWinEnter,InsertLeave * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace //

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
set bg=dark

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" https://items.sjbach.com/319/configuring-vim-right.html
set hidden

" remove split character or use box drawing to remove gaps
au BufNewFile,BufRead * set fillchars=vert:\│
hi! VertSplit ctermfg=darkgray ctermbg=NONE guifg=darkgray guibg=NONE
"set fillchars=vert:\ 
set showbreak=↪
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨,space:•
" use :list to actually display these whitespace markers
" filler character after end of file
set fcs=eob:•

set foldmethod=syntax
set foldnestmax=10
set nofoldenable

set ignorecase
set smartcase " search is case-sensitive only if there's a capital
set scrolloff=5 " context around cursor when scrolling

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp,/data/data/com.termux/files/usr/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp,/data/data/com.termux/files/usr/tmp

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
"set noruler
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

" quickly list and jump buffers
nnoremap gb :ls<CR>:b<Space>

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

" run :Pdf to make it so that every time you save, Pandoc makes a PDF
command Pdf	autocmd BufWritePost *.md :Pandoc pdf -V geometry:margin=1in --highlight=tango
"command Pdf	:w | :Pandoc pdf -V geometry:margin=1in --highlight=tango


nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_linters = {'tex': ['chktex', 'cspell']}
let g:ale_c_cc_options = '-std=c11 -Wall -disable-checker security.insecureAPI.DeprecatedOrUnsafeBufferHandling'
let g:ale_sign_error = '=>'
" ⭘⦿●⦁⸰•🠞
let g:ale_sign_warning = '->'
"·
highlight ALEWarning ctermbg=240 cterm=undercurl
highlight ALEError ctermbg=52
set signcolumn=number " draw signs over (relative)number column
let g:ale_set_signs=0 " extra column on left
let g:ale_virtualtext_cursor=0 " don't add text when cursor is near
let g:ale_floating_preview=1 " GVim only? Otherwise use ALEDetail like below:
" show popup with full error when cursor dwells for 1 second
let g:ale_detail_to_floating_preview=1
au CursorHold,CursorHoldI * if exists(":ALEDetail") | ALEDetail | endif
set updatetime=2000
let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰', '│', '─']
"let g:ale_floating_window_border = [' ', '▔', '▔', '▔', '▁', '▁', ' ', '▁']
let g:ale_floating_preview_popup_opts = {"highlight": "ctermbg=NONE", "close": "none"}
"let g:ale_floating_preview_popup_opts = {"close": "none", "borderhighlight": ["ctermbg=NONE"]}
"borderhighlight

" lint right away when opening a file
let g:ale_lint_on_enter = 1
" do lint when saving, even if nothing's changed
let g:ale_lint_on_save = 1

