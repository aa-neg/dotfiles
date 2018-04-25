" ================ Plugins ==================== {{{
call plug#begin( '~/.config/nvim/bundle')

Plug 'w0rp/ale', { 'do': 'npm install -g prettier' }
Plug 'nelstrom/vim-visual-star-search'
Plug 'Raimondi/delimitMate'
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'javascript.jsx'] }
Plug 'manasthakur/vim-commentor'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'Yggdroot/indentLine'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'gregsexton/MatchTag', { 'for': ['html', 'javascript.jsx'] }
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neosnippet'
Plug 'brooth/far.vim'
Plug 'vimwiki/vimwiki'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ludovicchabant/vim-gutentags'
Plug 'kristijanhusak/vim-js-file-import'
Plug 'FooSoft/vim-argwrap'
Plug 'morhetz/gruvbox'
Plug 'Quramy/tsuquyomi'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'othree/html5.vim'
"Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'posva/vim-vue'
Plug 'mhartington/oceanic-next'
Plug 'lifepillar/vim-solarized8'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

call plug#end()
"}}}
" ================ General Config ==================== {{{
"
set spell

let g:mapleader = ','                                                           "Change leader to a comma

let g:gruvbox_italic = 1                                                        "Use italic for comments
let g:gruvbox_invert_selection = 0                                              "Do not invert highlighing on selection
let g:gruvbox_sign_column = 'none'                                              "Do not use background for sign column

set termguicolors
set title                                                                       "change the terminal's title
set number                                                                      "Line numbers are good
" set relativenumber                                                              "Show numbers relative to current line
set history=500                                                                 "Store lots of :cmdline history
set showcmd                                                                     "Show incomplete cmds down the bottom
set noshowmode                                                                  "Hide showmode because of the powerline plugin
set gdefault                                                                    "Set global flag for search and replace
set guicursor=a:blinkon500-blinkwait500-blinkoff500                             "Set cursor blinking rate
"set cursorline                                                                  "Highlight current line
set smartcase                                                                   "Smart case search if there is uppercase
set ignorecase                                                                  "case insensitive search
set mouse=a                                                                     "Enable mouse usage
set showmatch                                                                   "Highlight matching bracket
set nostartofline                                                               "Jump to first non-blank character
set timeoutlen=1000 ttimeoutlen=0                                               "Reduce Command timeout for faster escape and O
set fileencoding=utf-8                                                          "Set utf-8 encoding on write
set wrap                                                                        "Enable word wrap
set linebreak                                                                   "Wrap lines at convenient points
set listchars=tab:\ \ ,trail:·                                                  "Set trails for tabs and spaces
set list                                                                        "Enable listchars
set lazyredraw                                                                  "Do not redraw on registers and macros
"set background=dark                                                             "Set background to dark
set hidden                                                                      "Hide buffers in background
set conceallevel=2 concealcursor=i                                              "neosnippets conceal marker
set splitright                                                                  "Set up new vertical splits positions
set splitbelow                                                                  "Set up new horizontal splits positions
set path+=**                                                                    "Allow recursive search
set inccommand=nosplit                                                          "Show substitute changes immidiately in separate split
set fillchars+=vert:\│                                                          "Make vertical split separator full line
set pumheight=30                                                                "Maximum number of entries in autocomplete popup
set exrc                                                                        "Allow using local vimrc
set secure                                                                      "Forbid autocmd in local vimrc
set grepprg=rg\ --vimgrep                                                       "Use ripgrep for grepping
set tagcase=smart                                                               "Use smarcase for tags
set updatetime=500                                                              "Cursor hold timeout
set synmaxcol=300                                                               "Use syntax highlighting only for 300 columns

silent! colorscheme oceanicNext
hi Normal guibg=NONE ctermbg=NONE
hi Conceal ctermbg=NONE guibg=NONE
hi CursorLine ctermbg=NONE guibg=NONE
hi NonText ctermbg=NONE guibg=NONE
hi SpecialKey ctermbg=NONE guibg=NONE
"hi Normal ctermbg=NONE guibg=NONE ctermfg=NONE guifg=NONE
"hi! NonText ctermbg=NONE guibg=NONE ctermfg=NONE guifg=NONE

" hi link jsFuncCall GruvboxBlue

" }}}
" ================ Turn Off Swap Files ============== {{{

set noswapfile
set nobackup
set nowritebackup

" }}}
" ================ Persistent Undo ================== {{{

" Keep undo history across sessions, by storing in file.
silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
set undodir=~/.config/nvim/backups
set undofile

" }}}
" ================ Indentation ====================== {{{

set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set breakindent
set smartindent
set colorcolumn=80
" set nofoldenable
" set foldmethod=syntax

" }}}
" ================ Auto commands ====================== {{{

augroup vimrc
    autocmd!
augroup END

autocmd vimrc QuickFixCmdPost [^l]* cwindow                                     "Open quickfix window after grepping
autocmd vimrc BufWritePre * call StripTrailingWhitespaces()                     "Auto-remove trailing spaces
autocmd vimrc InsertEnter * set nocul                                           "Remove cursorline highlight
autocmd vimrc InsertLeave * set cul                                             "Add cursorline highlight in normal mode
autocmd vimrc FocusGained,BufEnter * checktime                                  "Refresh file when vim gets focus
autocmd vimrc FileType javascript nmap <buffer><silent><C-]> <Plug>(JsGotoDefinition)
autocmd vimrc FileType javascript xmap <buffer><silent><C-]> <Plug>(JsGotoDefinition)
autocmd vimrc FileType javascript nmap <buffer><silent><Leader>] <C-W>v<Plug>(JsGotoDefinition)
autocmd vimrc FileType javascript xmap <buffer><silent><Leader>] <C-W>vgv<Plug>(JsGotoDefinition)

" }}}
" ================ Completion ======================= {{{

set wildmode=list:full
set wildignore=*.o,*.obj,*~                                                     "stuff to ignore when tab completing
set wildignore+=*.git*
set wildignore+=*.meteor*
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*cache*
set wildignore+=*logs*
set wildignore+=*node_modules/**
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" }}}
" ================ Scrolling ======================== {{{

set scrolloff=8                                                                 "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=5

" }}}
" ================ Statusline ======================== {{{

hi User1 guifg=#FF0000 guibg=#504945 gui=bold
hi User2 guifg=#FFFFFF guibg=#FF1111 gui=bold
hi User3 guifg=#2C323C guibg=#E5C07B gui=bold
set statusline=\ %{toupper(mode())}                                             "Mode
set statusline+=\ \│\ %{fugitive#head()}                                        "Git branch
set statusline+=%{GitFileStatus()}                                              "Git file status
set statusline+=\ \│\ %4F                                                       "File path
set statusline+=\ %1*%m%*                                                       "Modified indicator
set statusline+=\ %w                                                            "Preview indicator
set statusline+=\ %r                                                            "Read only indicator
set statusline+=\ %q                                                            "Quickfix list indicator
set statusline+=\ %=                                                            "Start right side layout
set statusline+=\ %{&enc}                                                       "Encoding
set statusline+=\ \│\ %y                                                        "Filetype
" set statusline+=\ \│\ %p%%                                                      "Percentage
set statusline+=\ \│\ %c                                                        "Column number
set statusline+=\ \│\ %l/%L                                                     "Current line number/Total line numbers
set statusline+=\ %{gutentags#statusline('\│\ ')}                               "Tags status
set statusline+=\ %2*%{AleStatusline('error')}%*                                "Errors count
set statusline+=%3*%{AleStatusline('warning')}%*                                "Warning count

"}}}
" ================ Abbreviations ==================== {{{

cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qa qa
cnoreabbrev Bd bd
cnoreabbrev bD bd
cnoreabbrev wrap set wrap
cnoreabbrev nowrap set nowrap

" }}}
" ================ Functions ======================== {{{

function! StripTrailingWhitespaces()
  if &modifiable
    let l:l = line('.')
    let l:c = col('.')
    call execute('%s/\s\+$//e')
    call histdel('/', -1)
    call cursor(l:l, l:c)
  endif
endfunction

function! AleStatusline(type)
  let l:count = ale#statusline#Count(bufnr(''))
  if a:type ==? 'error' && l:count['error']
    return printf(' %d E ', l:count['error'])
  endif

  if a:type ==? 'warning' && l:count['warning']
    let l:space = l:count['error'] ? ' ': ''
    return printf('%s %d W ', l:space, l:count['warning'])
  endif

  return ''
endfunction

function! GitFileStatus()
  if !exists('b:gitgutter')
    return ''
  endif
  let l:summary = get(b:gitgutter, 'summary', [0, 0, 0])
  let l:result = l:summary[0] == 0 ? '' : ' +'.l:summary[0]
  let l:result .= l:summary[1] == 0 ? '' : ' ~'.l:summary[1]
  let l:result .= l:summary[2] == 0 ? '' : ' -'.l:summary[2]
  if l:result !=? ''
    return ' '.l:result
  endif
  return l:result
endfunction

function! CloseBuffer(...) abort
  if &buftype !=? ''
    return execute('bd!')
  endif
  let l:nerdtreeOpen = g:NERDTree.IsOpen()
  let l:windowCount = winnr('$')
  let l:totalBuffers = len(getbufinfo({ 'buflisted': 1 }))
  let l:isNerdtreeLast = l:nerdtreeOpen && l:windowCount ==? 2
  let l:noSplits = !l:nerdtreeOpen && l:windowCount ==? 1
  let l:bang = a:0 > 0 ? '!' : ''
  if l:totalBuffers > 1 && (l:isNerdtreeLast || l:noSplits)
    let l:command = 'bp'
    if buflisted(bufnr('#'))
      let l:command .= '|bd'.l:bang.'#'
    endif
    return execute(l:command)
  endif
  return execute('q'.l:bang)
endfunction

function! SetupDiffColor() abort
  let l:diffAddColor = synIDattr(synIDtrans(hlID('DiffAdd')), 'reverse') ? 'fg' : 'bg'
  let l:diffDeleteColor = synIDattr(synIDtrans(hlID('DiffDelete')), 'reverse') ? 'fg' : 'bg'
  let l:diffAdd = synIDattr(synIDtrans(hlID('DiffAdd')), l:diffAddColor)
  let l:diffDelete = synIDattr(synIDtrans(hlID('DiffDelete')), l:diffDeleteColor)
  let l:normalBg = synIDattr(synIDtrans(hlID('Normal')), 'bg')
  let l:bg = '#282f28'
  exe 'hi DiffAdd guifg='.l:diffAdd.' guibg='.l:bg.' gui=NONE'
  exe 'hi DiffChange guifg='.l:diffAdd.' guibg='.l:bg.' gui=NONE'
  exe 'hi DiffText  guifg='.l:bg.' guibg='.l:diffAdd.' gui=NONE'
  exe 'hi DiffDelete guifg='.l:diffDelete.' guibg='.l:normalBg.' gui=NONE'
endfunction

" }}}
" ================ Custom mappings ======================== {{{

" Comment map
" nmap <Leader>c gcc
nmap D-/ gcc
" Line comment command
xmap <Leader>c gc

" Map save to Ctrl + S
map <c-s> :w<CR>
imap <c-s> <C-o>:w<CR>
nnoremap <Leader>s :w<CR>

" Open vertical split
nnoremap <Leader>v <C-w>v

" Move between slits
nnoremap <c-h> <C-w>h
nnoremap <c-j> <C-w>j
nnoremap <c-k> <C-w>k
nnoremap <c-l> <C-w>l
nnoremap <c-Space> <C-w>p
tnoremap <c-h> <C-\><C-n><C-w>h
tnoremap <c-l> <C-\><C-n><C-w>l
tnoremap <c-Space> <C-\><C-n><C-w>p

" Down is really the next line
nnoremap j gj
nnoremap k gk

" Expand snippets on tab if snippets exists, otherwise do autocompletion
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\ : pumvisible() ? "\<C-n>" : "\<TAB>"
" If popup window is visible do autocompletion from back
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Fix for jumping over placeholders for neosnippet
smap <expr><TAB> neosnippet#jumpable() ?
\ "\<Plug>(neosnippet_jump)"
\: "\<TAB>"

" Map for Escape key
inoremap jj <Esc>
tnoremap <Leader>jj <C-\><C-n>

" Yank to the end of the line
nnoremap Y y$

" Copy to system clipboard
vnoremap <C-c> "+y
" Paste from system clipboard with Ctrl + v
inoremap <C-v> <Esc>"+p
nnoremap <Leader>p "0p
vnoremap <Leader>p "0p
nnoremap <Leader>h viw"0p

" Move to the end of yanked text after yank and paste
nnoremap p p`]
vnoremap y y`]
vnoremap p p`]

" Move selected lines up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Clear search highlight
nnoremap <Leader><space> :noh<CR>

" Handle syntastic error window
nnoremap <Leader>e :lopen<CR>
nnoremap <silent><Leader>q :call CloseBuffer()<CR>
nnoremap <silent><Leader>Q :call CloseBuffer(1)<CR>

" Find current file in NERDTree
nnoremap <Leader>hf :NERDTreeFind<CR>
" Open NERDTree
nnoremap <Leader>n :NERDTreeToggle<CR>

" Toggle between last 2 buffers
nnoremap <leader><tab> <c-^>

" Filesearch plugin map for searching in whole folder
nnoremap <leader>f :F

" Toggle buffer list
"nnoremap <C-p> :Files<CR>
nnoremap <C-p> :CtrlP<CR>
"nnoremap <Leader>b :Buffers<CR>
"nnoremap <Leader>t :BTags<CR>
"nnoremap <Leader>m :History<CR>

" Indenting in visual mode
xnoremap <s-tab> <gv
xnoremap <tab> >gv

" Resize window with shift + and shift -
nnoremap + <c-w>5>
nnoremap _ <c-w>5<

" Center highlighted search
nnoremap n nzz
nnoremap N Nzz

"Disable ex mode mapping
map Q <Nop>

" Jump to definition in vertical split
nnoremap <Leader>] <C-W>v<C-]>

" Reformat and fix linting errors
nnoremap <Leader>R :ALEFix<CR>
" Wrap/Unwrap lines
nnoremap <leader>r :ArgWrap<CR>

" Close all other buffers except current one
nnoremap <Leader>db :silent w <BAR> :silent %bd <BAR> e#<CR>

" }}}
" ================ Plugins setups ======================== {{{

let g:ctrlsf_default_root = 'project'
let g:vue_disable_pre_processors=1 " slows down all the stupid preprocessors

let g:NERDTreeChDirMode = 2                                                     "Always change the root directory
let g:NERDTreeMinimalUI = 1                                                     "Disable help text and bookmark title
let g:NERDTreeShowHidden = 1                                                    "Show hidden files in NERDTree
let g:NERDTreeUpdateOnCursorHold = 0                                            "Disable nerdtree git plugin updating on cursor hold

let g:indentLine_color_tty_light = 7 " (default: 4)

let g:user_emmet_leader_key = '<c-e>'                                           "Change trigger emmet key
let g:polyglot_disabled = ['javascript', 'typescript', 'css']

let g:neosnippet#disable_runtime_snippets = {'_' : 1}                           "Snippets setup
let g:neosnippet#snippets_directory = ['~/.config/nvim/snippets']               "Snippets directory

let g:deoplete#enable_at_startup = 1                                            "Enable deoplete autocompletion
let g:deoplete#file#enable_buffer_path = 1                                      "Autocomplete files relative to current buffer
let g:deoplete#tag#cache_limit_size = 20000000                                  "Allow tags file up to ~20 MB
let g:deoplete#max_list = 30                                                    "Show maximum of 30 entries in autocomplete popup
let g:deoplete#enable_camel_case = 1                                            "Enable camel case completion

let g:delimitMate_expand_cr = 1                                                 "Auto indent on enter

let g:ctrlp_working_path_mode = 'wa'
let g:ctrlp_switch_buffer = 'Et'

let g:ale_completion_enabled = 1
let g:ale_linters = {'javascript': ['eslint']}                                  "Lint js with eslint
let g:ale_fixers = {
\  'javascript': ['prettier', 'eslint'],
\  'typescript': ['prettier']
\}                       "Fix eslint errors
let g:ale_javascript_prettier_options = '--print-width 100'                     "Set max width to 100 chars for prettier
let g:ale_sign_error = '✖'                                                      "Lint error sign
let g:ale_sign_warning = '⚠'                                                    "Lint warning sign

" let g:jsx_ext_required = 1                                                      "Force jsx extension for jsx filetype
let g:javascript_plugin_jsdoc = 1                                               "Enable syntax highlighting for js doc blocks

let g:far#source = 'agnvim'

call SetupDiffColor()

" }}}
" vim:foldenable:foldmethod=marker
