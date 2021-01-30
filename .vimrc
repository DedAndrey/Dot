set nocompatible              " be iMproved, required
filetype off                  " required

set number
set showcmd
" set incsearch
" set hlsearch
set expandtab

" подсвечивать строку с курсором
set cursorline

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

" Список автоматически определяемых кодировок в порядке убывания приоритета
set fileencodings=utf-8

" по умолчанию - латинская раскладка
set iminsert=0
" по умолчанию - латинская раскладка при поиске
set imsearch=0

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

" display lightline
	set laststatus=2
	set noshowmode

" Включает подсветку синтаксиса
syntax enable

" Проверка орфографии

":set spell spelllang=ru,en				включить проверку орфографии
":setlocal spell spelllang=ru_yo,en_us
":set nospell							выключить проверку орфографии
"]s				следующее слово с ошибкой
"[s				предыдущее слово с ошибкой
"z=				замена слова на альтернативу из списка
"zg				добавляет слово, находящееся под курсором
"zG				то же, что и zg, но слово будет добавлено только для текущей сессии работы
"zw				то же, что и zg, однако слово будет помечено как ошибочно-написанное
"zW				то же, что и zw, однако слово будет добавлено только для текущей сессии работы
"zug и zuw		отменяет действие zg и zw соответственно.
"zuG и zuW		отменяет действие zG и zW соответственно.

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

set autoread

:set wildmenu      " При автодополнении в командной строке над ней выводятся возможные варианты

:set list          " Отображать табуляцию и переводы строк


""" Плагины """

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'lyokha/vim-xkbswitch'
	let g:XkbSwitchEnabled = 1
	let g:XkbSwitchIMappings = ['ru']
	let g:XkbSwitchAssistNKeymap = 1    " for commands r and f
	let g:XkbSwitchAssistSKeymap = 1    " for search lines
	let g:XkbSwitchNLayout = 'us'
	let g:XkbSwitchILayout = 'us'
	let b:XkbSwitchILayout = 'us'
	autocmd BufEnter * let b:XkbSwitchILayout = 'us'
	let g:XkbSwitchLoadOnBufRead = 0
	let g:XkbSwitchSkipFt = ['nerdtree']
"	let g:XkbSwitchIMappingsSkipFt = ['tex']
	set ttimeoutlen=50

Plugin 'scrooloose/nerdtree'
"	map <C-o> :NERDTreeToggle<CR>
	nnoremap <leader>n :NERDTreeFocus<CR>
	nnoremap <C-n> :NERDTree<CR>
	nnoremap <C-t> :NERDTreeToggle<CR>
	nnoremap <C-f> :NERDTreeFind<CR>
	" Open the existing NERDTree on each new tab.
	autocmd BufWinEnter * silent NERDTreeMirror
	" Start NERDTree when Vim is started without file arguments.
	autocmd StdinReadPre * let s:std_in=1
	autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
	" Exit Vim if NERDTree is the only window left.
	autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
		\ quit | endif
	let NERDTreeShowHidden=1

Plugin 'ryanoasis/vim-devicons'

Plugin 'Xuyuanp/nerdtree-git-plugin'
	let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0
"	let g:NERDTreeGitStatusShowIgnored = 1 " a heavy feature may cost much more time. default: 0
"	let g:NERDTreeGitStatusShowClean = 1 " default: 0
"	let g:NERDTreeGitStatusConcealBrackets = 1 " default: 0
"	let g:NERDTreeGitStatusUntrackedFilesMode = 'all' " a heave feature too. default: normal
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

Plugin 'tpope/vim-fugitive'

Plugin 'tpope/vim-surround'

Plugin 'tpope/vim-repeat'

Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
	let g:NERDTreeFileExtensionHighlightFullName = 1
	let g:NERDTreeExactMatchHighlightFullName = 1
	let g:NERDTreePatternMatchHighlightFullName = 1
	let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
	let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

Plugin 'xuhdev/vim-latex-live-preview'
	let g:livepreview_previewer = 'zathura'

Plugin 'lervag/vimtex'
	let g:tex_flavor='latex'
	let g:vimtex_view_method='zathura'
	let g:vimtex_quickfix_mode=0
	set conceallevel=1
	let g:tex_conceal='abdmg'

Plugin 'ludovicchabant/vim-gutentags'
Plugin 'skywind3000/gutentags_plus'
	let g:gutentags_modules = ['ctags', 'gtags_cscope']		" enable gtags module
	let g:gutentags_project_root = ['.root']				" config project root markers.
	let g:gutentags_cache_dir = expand('~/.cache/tags')		" generate datebases in my cache directory, prevent gtags files polluting my project
	let g:gutentags_plus_switch = 1							" change focus to quickfix window after search (optional)

"Plugin 'junegunn/fzf'

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
	let g:UltiSnipsExpandTrigger="<tab>"
	let g:UltiSnipsJumpForwardTrigger="<c-b>"
	let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"	let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
	let g:UltiSnipsEditSplit="vertical"

Plugin 'sheerun/vim-polyglot'

Plugin 't9md/vim-quickhl'
	nmap <Space>m <Plug>(quickhl-manual-this)
	xmap <Space>m <Plug>(quickhl-manual-this)
	nmap <Space>w <Plug>(quickhl-manual-this-whole-word)
	xmap <Space>w <Plug>(quickhl-manual-this-whole-word)
	nmap <Space>c <Plug>(quickhl-manual-clear)
	vmap <Space>c <Plug>(quickhl-manual-clear)
	nmap <Space>M <Plug>(quickhl-manual-reset)
	xmap <Space>M <Plug>(quickhl-manual-reset)
	nmap <Space>j <Plug>(quickhl-cword-toggle)
	nmap <Space>] <Plug>(quickhl-tag-toggle)
	map H <Plug>(operator-quickhl-manual-this-motion)

Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'roxma/vim-tmux-clipboard'

Plugin 'preservim/nerdcommenter'
	filetype plugin on
	let g:NERDCreateDefaultMappings = 1
	let g:NERDSpaceDelims = 1
	let g:NERDCompactSexyComs = 1
	let g:NERDDefaultAlign = 'left'
	let g:NERDAltDelims_java = 1
	let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
	let g:NERDCommentEmptyLines = 1
	let g:NERDTrimTrailingWhitespace = 1
	let g:NERDToggleCheckAllLines = 1
	nnoremap <silent> <leader>c} V}:call NERDComment('x', 'toggle')<CR>
	nnoremap <silent> <leader>c{ V{:call NERDComment('x', 'toggle')<CR>

Plugin 'kien/ctrlp.vim'
	let g:ctrlp_map = '<c-p>'
	let g:ctrlp_cmd = 'CtrlP'
	let g:ctrlp_working_path_mode = 'ra'

Plugin 'ervandew/supertab'
	let g:SuperTabDefaultCompletionType = "<c-p>"
	let g:SuperTabDefaultCompletionType = 'context'
"	autocmd FileType *
"		\ if &omnifunc != '' |
"		\   call SuperTabChain(&omnifunc, "<c-p>") |
"		\ endif

Plugin 'vim-airline/vim-airline'
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#tabline#left_sep = ' '
	let g:airline#extensions#tabline#left_alt_sep = '|'
	let g:airline#extensions#tabline#formatter = 'unique_tail'

Plugin 'vim-airline/vim-airline-themes'
	let g:airline_theme='minimalist'

Plugin 'jeetsukumaran/vim-buffergator'

call vundle#end()
filetype plugin indent on
