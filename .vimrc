set nocompatible
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

set encoding=utf-8
set fileencodings=utf-8

filetype off

" Чтобы возле файлов отображались буквы: M,A,U,R,D,E,I,C - от гита
let g:NERDTreeGitStatusIndicatorMapCustom = {'Modified' : 'M', 'Staged' : 'A', 'Untracked' : 'U', 'Renamed'   : 'R', 'Unmerged'  : 'E', 'Deleted'   : 'D', 'Dirty'     : 'M', 'Ignored'   : 'I', 'Clean'     : 'C', 'Unknown'   : '?'}

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'rking/ag.vim'
Plugin 'Xuyuanp/nerdtree-git-plugin' " Показывает какие файлы были изменены
Plugin 'rhysd/git-messenger.vim' " Показвыает кто последний менял строку и хеш коммита
Plugin 'tpope/vim-fugitive' " для работы с гитом: git commit(Gcommit), git status(Gstatus)
Plugin 'VundleVim/Vundle.vim'
Plugin 'mhinz/vim-signify' " Показывает какие строки были изменены, удалены, редактированны
Plugin 'ctrlpvim/ctrlp.vim' " Поиск файла через ctrl+p
Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " Проводник
Plugin 'morhetz/gruvbox' " Цвевотвые темы
Plugin 'ycm-core/YouCompleteMe' " Автокомплиты
Plugin 'vim-scripts/Auto-Pairs' " Чтобы автоматически закрывающаяся скобка, ковычка и тд ставились
Plugin 'easymotion/vim-easymotion' " Для легчайшего перемещения по коду внутри файла
Plugin 'vim-airline/vim-airline'
call vundle#end()

filetype plugin indent on

" autocmd TextChanged,TextChangedI * call sy#start()

syntax on
colorscheme gruvbox

let g:ackprg = 'ag --vimgrep --no-heading --smart-case --nocolor'
let NERDTreeShowHidden=1
let g:go_def_mode  = 'gopls'
let g:go_info_mode = 'gopls'
let mapleader=" "
let g:gruvbox_contrast_dark='hard'


" Отключение колесика мыши
set mouse=
set background=dark
set hlsearch
set incsearch
set number
set autowrite
set path+=**


nnoremap <Leader><Leader> <Plug>(easymotion-prefix)
" Чтобы провалиться в функцию shortcut: ,+g+d
nmap <Leader>gd :GoDef<CR>
" Чтобы вурнуться назад shortcut: ,+g+b
nmap <Leader>gb :GoDefPop<CR>

" Гит
nmap <silent> <Leader><Leader>gt :call<SID>GitPrompt()<CR>
function! s:GitPrompt() abort
  let flags = input('git ')
  if empty(flags)
    echohl WarningMsg | echom "Empty command" | echohl None
    return
  endif
  execute 'Git ' . flags 
endfunction

nmap <Leader>gtm <Plug>(git-messenger)
nmap <Leader>gts :Git status<CR>
nmap <Leader>gtps :Git push<CR>
nmap <Leader>gtpl :Git pull<CR>

nmap <silent> <Leader>gtb :call<SID>GitBranchPrompt()<CR>
function! s:GitBranchPrompt() abort
  let flags = input('git branch ')
  execute 'Git branch ' . flags
endfunction
nmap <Leader>gtd :Gdiffsplit<CR>

nmap <silent> <Leader>gtco :call<SID>GitCheckoutPrompt()<CR>
function! s:GitCheckoutPrompt() abort
  let flags = input('git checkout ')
  if empty(flags)
    echohl WarningMsg | echom "Branch name cannot be empty" | echohl None
    return
  endif
  execute 'Git checkout ' . flags 
endfunction
" Проводник по проекту
nmap <C-N> :NERDTreeToggle<CR>
" Поиск текста по файлаы
nmap <silent> <Leader><Leader>a :Ag!<Space>

" Отключение клавиш со стрелками
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>

inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

cnoremap <Up> <NOP>
cnoremap <Down> <NOP>
cnoremap <Left> <NOP>
cnoremap <Right> <NOP>

