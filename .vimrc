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
set encoding=utf-8
set fileencoding=utf-8

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

:set wildmenu	" При автодополнении в командной строке над ней выводятся возможные варианты

:set list		" Отображать табуляцию и переводы строк

" source ~/.cache/calendar.vim/credentials.vim

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
"	let g:XkbSwitchSkipFt = ['nerdtree']
"	let g:XkbSwitchIMappingsSkipFt = ['tex']
	set ttimeoutlen=50

Plugin 'tpope/vim-fugitive'

Plugin 'tpope/vim-surround'

Plugin 'tpope/vim-repeat'

Plugin 'lervag/vimtex'
	let g:tex_flavor='latex'
	let g:vimtex_view_method='zathura'
	let g:vimtex_quickfix_mode=0
	set conceallevel=1
	let g:tex_conceal='abdmg'

Plugin 'junegunn/fzf'
	let g:fzf_preview_window = ['up:40%', 'ctrl-/']
	nnoremap <silent> <leader>F :FZF<CR>
	nnoremap <silent> <leader>f :FZF ~<CR>
	" This is the default extra key bindings
	let g:fzf_action = {
	\ 'Enter': 'tab split',
	\ 'ctrl-x': 'split',
	\ 'ctrl-v': 'vsplit' }
	" Default fzf layout
	" - down / up / left / right
	let g:fzf_layout = { 'down': '40%' }
	" - Popup window
"	let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.5 } }
	" Enable per-command history
	" - History files will be stored in the specified directory
	" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
	"   'previous-history' instead of 'down' and 'up'.
	let g:fzf_history_dir = '~/.local/share/fzf-history'

Plugin 'mcchrish/nnn.vim'
	" Disable default mappings
	let g:nnn#set_default_mappings = 0
	" Start nnn in the current file's directory
	nnoremap <leader>n :NnnPicker %:p:h<CR>
" Opens the n³ window in a split
	let g:nnn#layout = { 'left': '~30%' } " or right, up, down
	let g:nnn#action = {
		\ '<c-t>': 'tab split',
		\ '<c-x>': 'split',
		\ '<c-v>': 'vsplit' }

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

Plugin 'wincent/terminus'

"Plugin 'doums/oterm'
"let g:oterm = {
"	\ 'down': 40,
"	\ 'min': 5,
"	\ 'tab': 0,
"	\ 'no_hide_status': 0
"	\}
"nmap <Leader>o <Plug>OTerm

Plugin 'voldikss/fzf-floaterm'
Plugin 'voldikss/vim-floaterm'
	let g:floaterm_wintype = 'float' " ('split' or 'vsplit')
	let g:floaterm_position = 'bottom' " ('top', 'auto', 'left', 'right', 'topleft', 'topright', 'bottomleft', 'bottomright', 'center')
	let g:floaterm_width = 0.8
	let g:floaterm_height = 0.5
	let g:floaterm_keymap_new    = '<F7>'
	let g:floaterm_keymap_prev   = '<F8>'
	let g:floaterm_keymap_next   = '<F9>'
	let g:floaterm_keymap_kill   = '<F10>'
	let g:floaterm_keymap_toggle = '<F12>'

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
	let g:airline_theme='raven'
"	let g:airline_theme='monochrome'
"	let g:airline_theme='jellybeans'
"	let g:airline_theme='minimalist'

Plugin 'jeetsukumaran/vim-buffergator'

Plugin 'mg979/vim-visual-multi'
	let g:VM_mouse_mappings = 1

	" Plugin 'wellle/targets.vim'

call vundle#end()
filetype plugin indent on
