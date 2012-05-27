" Be iMproved
set nocompatible

" Required for vundle - will be set correctly after vundle settings
filetype off

" vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" vundle - required!
Bundle 'gmarik/vundle'

" vim-fugitive
Bundle 'tpope/vim-fugitive'

" nerdcommenter
Bundle 'scrooloose/nerdcommenter'

" nerdtree
Bundle 'scrooloose/nerdtree'

" ctrlp
Bundle 'kien/ctrlp.vim'

" omnicppcomplete
Bundle 'OmniCppComplete'

" taglist
Bundle 'taglist.vim'

" xmledit
Bundle 'xmledit'

" localvimrc
Bundle 'localvimrc'

" DoxygenToolKit
Bundle 'DoxygenToolkit.vim'

" shebang
Bundle 'Shebang'

" Align
Bundle 'Align'

" A.vim - Alternate Files quickly (.c --> .h etc)
Bundle 'a.vim'

" errormarker.vim : Highlights and sets error markers for lines with compile
" errors
Bundle 'errormarker.vim'

" Syntax highlighting
syntax on

" Get filetype automatically
filetype plugin indent on

" enable 256 colors
set t_Co=256

" Map leader key to comma (,)
let mapleader=","

" Tab settings
set expandtab
set shiftwidth=2
set softtabstop=2

" Indenting
set cindent
set autoindent
set smartindent

" Folding
set nofoldenable

" Set c1ipboard to x-windows selection
set clipboard=unnamed

" Turn on incremental search with ignore case (except explicit caps)
set incsearch
set ignorecase
set smartcase

" Change window
nnoremap <leader>1 1
nnoremap <leader>2 2
nnoremap <leader>3 3
nnoremap <leader>4 4

" Set tag locations
set tags=tags;/
set tags+=~/.vim/tag/stl_tags

" A.vim
map  <F2>    :A<CR>
imap <F2>    <ESC>:A<CR>

" nerdtree
map  <F3>    :NERDTreeToggle<CR>
imap <F3>    <ESC>:NERDTreeToggle<CR>

" Taglist
map  <F4>    :TlistToggle<CR><C-W><a-right>
imap <F4>    <ESC>:TlistOpen<CR><C-W><a-right>

" make
map  <F5>    :w<CR>:make<CR>
imap <F5>    <ESC>:w<CR>:make<CR>

" errormarker
map  <S-F5>  :ErrorAtCursor<CR>
imap <S-F5>  <ESC>:ErrorAtCursor<CR>

" shebang
map  <F6>    :call SetExecutable()<CR>
imap <F6>    <ESC>:call SetExecutable()<CR>

" Doxygen
map  <F7>    :Dox<CR>
imap <F7>    <ESC>:Dox<CR>

" ctags
map  <F8>    :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --links=no .<CR>
imap <F8>    <ESC>:!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --links=no .<CR>

" Spelling
map  <F9>    :set spell!<CR>
imap <F9>    <ESC>:set spell!<CR>

" Next error to F10
map  <F10>   :cn<CR>
imap <F10>   <ESC>:cn<CR>

" :Align =
map  <S-F10> :Align =<CR>
imap <S-F10> <ESC>:Align =<CR>

" shortcut to auto indent entire file
map  <F11>   1G=G''
imap <F11>   <ESC>1G=Ga''

" Window changing
map  <a-left>       :bp<CR>
imap <a-left>  <ESC>:bp<CR>
map  <a-right>      :bn<CR>
imap <a-right> <ESC>:bn<CR>

" taglist configuration
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth         = 60
let Tlist_Close_On_Select  = 1

" OmniCompletion
let OmniCpp_NamespaceSearch   = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess        = 1
let OmniCpp_MayCompleteDot    = 1
let OmniCpp_MayCompleteArrow  = 1
let OmniCpp_MayCompleteScope  = 1
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

highlight clear
highlight Pmenu         ctermfg=0 ctermbg=2
highlight PmenuSel      ctermfg=0 ctermbg=7
highlight PmenuSbar     ctermfg=7 ctermbg=0
highlight PmenuThumb    ctermfg=0 ctermbg=7

set completeopt=menuone,menu,longest,preview

" remap code completion to Ctrl+Space
inoremap <Nul> <C-x><C-o>

" smart home
function! SmartHome()
  let s:col = col(".")
  normal! ^
  if s:col == col(".")
    normal! 0
  endif
endfunction
nnoremap <silent> <Home> :call SmartHome()<CR>
inoremap <silent> <Home> <C-O>:call SmartHome()<CR>

" copy up to 1000 lines from one file to another
set viminfo='1000,\"2000,s2000,h

" Set spell language
set spelllang=de_ch

" support local vim config in .lvimrc
let g:localvimrc_ask=0

" open files at the last opened position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

" Delete .netrwhist ( netrw history file ) after leaving vim
au VimLeave * if filereadable(".netrwhist") | call delete(".netrwhist") | endif

" remove trailing whitespace on write
au BufWritePre * :%s/\s\+$//e

" highlight User1 ctermfg=White ctermbg=LightGrey
hi! User1 ctermfg=LightGrey cterm=bold  ctermbg=52 guifg=Black guibg=#665555
hi! User2 ctermfg=DarkGreen cterm=bold  ctermbg=52 guifg=Green guibg=#443333
hi! User3 ctermfg=DarkCyan  cterm=bold  ctermbg=52 guifg=Cyan  guibg=#443333
hi! User4 ctermfg=DarkCyan  cterm=bold  ctermbg=52 guifg=Cyan  guibg=#443333

" informative status line
set laststatus=2 " Always show the statusline
set statusline=%4*---%1*\ %F%m%r%h%w\ %2*%{fugitive#statusline()}%1*\ %{&ff}\ %Y\ \[0x\%02.2B=\%03.3b]\ [%l,%v\ %p%%\ %Lb]\ %3*\[%F\]%1*

" wildignore
set wildignore+=*.o,*.obj,.git,*.pyc,*.so,*/.git/*

" ignore some directories and files in ctrlp plugin
let g:ctrlp_custom_ignore='\.git/*'

" errormarker settings
let errormarker_errorgroup="ErrorMsg"
let errormarker_warninggroup="Todo"

" errorformat for make and errormarker
let &errorformat="%*[^/]%f:%l:%c: %t%*[^:]:%m,%*[^/]%f:%l: %t%*[^:]:%m," . &errorformat
