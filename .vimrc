set nocompatible              " be iMproved, required
filetype off                  " required

set number
set showcmd
" set incsearch
" set hlsearch
set expandtab

" подсвечивать строку с курсором
set cursorline

" по умолчанию - латинская раскладка
set iminsert=0

" по умолчанию - латинская раскладка при поиске
set imsearch=0

" игнорировать регистр при поиске
set ic

" подсвечивать поиск
set hls

" использовать инкрементальный поиск
set is

" установить шрифт
" set guifont=courier_new:h10:cRUSSIAN
" set guifont=DroidSansMono\ Nerd\ Font\ 11

" для работы с русскими словами (чтобы w, b, * понимали русские слова)
set iskeyword=@,48-57,_,192-255

" задать размер табуляции в четыре пробела
set ts=4

" перенос по словам, а не по буквам
set linebreak
set dy=lastline

" прокручивать (скроллить) текст колёсиком мыши и вставлять выделенное в X`ах мышкой в Vim нажатием средней кнопки мыши (нажать на колёсико мыши)
set mouse=a
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" по <F4> открывается новая вкладка (tab) и выводится список каталогов и файлов текущего каталога. Клавишами управления курсором можно выбрать каталог или файл. Нажатие <Enter> на каталог отобразит его содержимое в том же режиме (можно путешествовать по каталогам), а нажатие <Enter> на файле - откроет его в этой же вкладке. Работает быстрый поиск-перемещение по "/"
imap <F4> <Esc>:browse tabnew<CR>
map <F4> <Esc>:browse tabnew<CR>

" по <F5> позволяет переключать вкладки справа-налево, по-порядку, отображая открытые в них файлы
imap <F5> <Esc> :tabprev <CR>i
map <F5> :tabprev <CR>

" по <F6> позволяет переключать вкладки слева-направо, по-порядку, отображая открытые в них файлы.
imap <F6> <Esc> :tabnext <CR>i
map <F6> :tabnext <CR>

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'vim-xkbswitch'
" Plugin 'bling/vim-airline'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'ryanoasis/vim-devicons'
Plugin 'plasticboy/vim-markdown.git'
Plugin 'LaTeX-Suite-aka-Vim-LaTeX'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'SirVer/ultisnips'
Plugin 'lervag/vimtex'

call vundle#end()
filetype plugin indent on

" 'vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" latex-live-preview
let g:livepreview_previewer = 'zathura'

" vim-xkbswitch
let g:XkbSwitchEnabled = 1
let g:XkbSwitchIMappings = ['ru']

" display lightline
set laststatus=2
set noshowmode

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
let g:UltiSnipsEditSplit="vertical"

" NERDTree
map <C-o> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeGitStatusShowIgnored = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" Разное ...

" Включает подсветку синтаксиса
syntax enable

":set spell spelllang=ru,en       включить проверку орфографии
":set nospell                     выключить проверку орфографии
"]s                               следующее слово с ошибкой
"[s                               предыдущее слово с ошибкой
"z=                               замена слова на альтернативу из списка
"zg                               good word
"zw                               wrong word
"zG                               ignore word

set smartcase   " Do smart case matching
set autowrite   " Automatically save before commands like :next and :make

" size of a hard tabstop
set tabstop=4

" size of an indent
set shiftwidth=4

" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=4

set textwidth=80

set t_Co=256

:set wildmenu      " При авто-дополнении в командной строке над ней выводятся возможные варианты

:set list          " Отображать табуляцию и переводы строк
