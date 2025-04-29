set nocompatible
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" Добавляем go/bin в PATH, чтобы Vim видел установленные tools
let $PATH = expand('$HOME/go/bin') . ':' . $PATH

set encoding=utf-8
set fileencodings=utf-8

filetype off                  " required

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
let g:NERDTreeQuitOnOpen = 1
let g:go_def_mode  = 'gopls'
let g:go_info_mode = 'gopls'
let mapleader=" "
let g:gruvbox_contrast_dark='hard'
let g:airline#extensions#tabline#enabled = 1
set showtabline=1
" Отключение колесика мыши
set mouse=
set background=dark
set hlsearch
set incsearch
set number
set autowrite
set path+=**


nnoremap <Leader><Leader> <Plug>(easymotion-prefix)
" Чтобы провалиться в функцию
nmap <Leader>gd :GoDef<CR>
" Чтобы вурнуться назад 
nmap <Leader>gb :GoDefPop<CR>

" Гит
nmap <silent> <Leader><Leader>пе :call<SID>GitPrompt()<CR>
nmap <silent> <Leader><Leader>gt :call<SID>GitPrompt()<CR>
function! s:GitPrompt() abort
  let flags = input('git ')
  if empty(flags)
    echohl WarningMsg | echom "Empty command" | echohl None
    return
  endif
  execute 'Git ' . flags 
endfunction
nmap <Leader>gtd :Gdiffsplit<CR>

nmap <leader>h :bp<CR>
nmap <leader>l :bn<CR>
nmap <leader>x :bd<CR>

" Проводник по проекту
nmap <C-N> :NERDTreeToggle<CR>
" Поиск текста по файлаы
nmap <silent> <Leader><Leader>a :Ag!<Space>

" Отключение клавиш со стрелками
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>
