set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/base16-vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'benmills/vimux'
Plugin 'w0rp/ale'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Bundle 'edkolev/tmuxline.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Plugin 'Nopik/vim-nerdtree-direnter'
Plugin 'leafgarland/typescript-vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'yegappan/mru'
Plugin 'majutsushi/tagbar'
Plugin 'chrisbra/NrrwRgn'
Plugin '907th/vim-auto-save'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-surround'
Plugin 'mhinz/vim-signify'
Plugin 'gregsexton/gitv'
Plugin 'sodapopcan/vim-twiggy'
Plugin 'tpope/vim-obsession'
Plugin 'dhruvasagar/vim-prosession'
Plugin 'Raimondi/delimitMate'

" vim snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
" /vim snippets

Plugin 'ryanoasis/vim-devicons'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
set encoding=UTF-8

set shell=/bin/bash
set colorcolumn=100
set belloff=all
set clipboard^=unnamed,unnamedplus

set mouse=a

let mapleader = ','

nnoremap <Leader>. :e#<CR>

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" replace shortcut
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
nnoremap <Leader>S :s/\<<C-r><C-w>\>/

" leader+e to edit selection in new window
xmap <leader>e <Plug>NrrwrgnDo
xmap <leader>E <Plug>NrrwrgnBangDo

" Reload config
map <c-s> :source ~/.vimrc<CR>

syntax on
" set colorcolumn=90

set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

set hidden
set history=100

filetype indent on
set nowrap
set tabstop=4
set shiftwidth=2
set expandtab
set smartindent
set autoindent
set showmatch

set diffopt+=vertical

set updatetime=500

" Map fugitive Gdiff
nmap <leader>gd :Gdiff<CR>

" Map fugitive Gstatus
nmap <leader>gs :Gstatus<CR>

" Map fugitive Gblame
nmap <leader>gb :Gblame<CR>

" Gitv
let g:Gitv_DoNotMapCtrlKey = 1

" Vim signify
let g:signify_realtime = 0
"
" Fix highlighting for spell checks in terminal
function! s:base16_customize() abort
  " Colors: https://github.com/chriskempson/base16/blob/master/styling.md
  " Arguments: group, guifg, guibg, ctermfg, ctermbg, attr, guisp
  call Base16hi("SpellBad",   "", "", g:base16_cterm08, g:base16_cterm00, "", "")
  call Base16hi("SpellCap",   "", "", g:base16_cterm0A, g:base16_cterm00, "", "")
  call Base16hi("SpellLocal", "", "", g:base16_cterm0D, g:base16_cterm00, "", "")
  call Base16hi("SpellRare",  "", "", g:base16_cterm0B, g:base16_cterm00, "", "")
endfunction

augroup on_change_colorschema
  autocmd!
  autocmd ColorScheme * call s:base16_customize()
augroup END

" Ale config
" Enable completion where available.
let g:ale_completion_enabled = 1
let g:ale_fixers = {'javascript': ['prettier', 'eslint'],
                   \'typescript':['tslint']}
map <F3> :ALEGoToDefinition<CR>
map <leader>f :ALEFix<CR>
map <leader>aj :ALENext<cr>
map <leader>ak :ALEPrevious<cr>

" highlight ALEError ctermbg=none cterm=underline

" Fix bug escape airline
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

" Ale error warning integration with airline
let g:airline#extensions#tabline#enabled = 1

" air-line
let g:airline_powerline_fonts = 1
"set guifont=Inconsolata\ for\ Powerline

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

let g:airline_theme='base16'
let g:airline_solarized_bg='dark'
hi Normal ctermbg=NONE guibg=NONE

" Tmuxline
let g:tmuxline_preset = 'base16'
" let g:tmuxline_preset = 'nightly_fox'
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '#(whoami)',
      \'c'    : '#(uptime -p)',
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W', '#F'],
      \'x'    : '#(curl wttr.in?format=+%%l:%%t+%%w)',
      \'y'    : ['%R:%S', '%a', '%b %d', '%Y'],
      \'z'    : '#H'}

"Tagbar
nmap <leader>t :TagbarToggle<CR>
"let g:tagbar_ctags_bin='~/.v/b/ctags'

let g:tagbar_type_typescript = {
  \ 'ctagsbin' : 'tstags',
  \ 'ctagsargs' : '-f-',
  \ 'kinds': [
    \ 'e:enums:0:1',
    \ 'f:function:0:1',
    \ 't:typealias:0:1',
    \ 'M:Module:0:1',
    \ 'I:import:0:1',
    \ 'i:interface:0:1',
    \ 'C:class:0:1',
    \ 'm:method:0:1',
    \ 'p:property:0:1',
    \ 'v:variable:0:1',
    \ 'c:const:0:1',
  \ ],
  \ 'sort' : 0
\ }

"NerdTree options
let NERDTreeShowHidden=1
" let NERDTreeMapOpenInTab='<ENTER>'
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>j :NERDTreeFind<CR>

"NerdCommenter options
let NERDSpaceDelims=1

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" CtrlP config
" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

" Use a leader instead of the actual named binding
nmap <leader>p :CtrlP<cr>

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>r :CtrlPMRU<cr>


" Install plugins
map <Leader>I :PluginInstall<CR>

" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>

" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>

" Zoom the tmux runner pane
map <Leader>vz :VimuxZoomRunner<CR>
