# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="fino-time"
ZSH_THEME="my"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# традиционный стиль перенаправлений fd
unsetopt MULTIOS
# поддержка ~… и file completion после = в аргументах
setopt MAGIC_EQUAL_SUBST
# не обрабатывать escape sequence в echo без -e
setopt BSD_ECHO
# поддержка комментариев в командной строке
setopt INTERACTIVE_COMMENTS
# поддержка $(cmd) в $PS1 etc.
setopt PROMPT_SUBST

setopt EXTENDED_GLOB

autoload -U compinit && compinit

# чуствительность к регистру. Как я указал в начале статьи, он сам может исправлять регистр если видит что в текущем ничего не найдено. Если это мешает, установив данный параметр в true, поведение будет привычное bash.
# CASE_SENSITIVE="true"

# включает автоматическую замену между "_" и "-". Аналогично параметру выше, но касается только дефиса и подчеркивания.
# HYPHEN_INSENSITIVE="true"

# позволяет отключить автоматическое обновления Oh My Zsh.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# задает переодичность проверки обновлений.
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# позволяте отключить цветовую палитру при выводе команды ls.
# DISABLE_LS_COLORS="true"

# отключение автоматического заголовка терминала.
export DISABLE_AUTO_TITLE="true"

# включает корректировку команд. Например, вводя compozer он выдаст запрос: correct 'compozer' to 'composer'?.
ENABLE_CORRECTION="true"

# включает точки ожидания ввода аргументов. Например введя composer и нажав Tab, он будет перебирать доступные команды (из-за одноименного плагина), а если ввести java и нажать таб, у него нет вариантов автодополнения (они будут появляться по мере их успешнного ввода в терминале и кэшироваться) он будет отображать красные точки для обязательного ввода которые можно отменить только Ctrl + C.
COMPLETION_WAITING_DOTS="true"

# отключает пометку неиспользуемых файлов в пределе Git репозитория как "грязных", что увеличивает скорость скана для git.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# позволяет менять формат даты для команды history.
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# позволяет добавить дополнительный путь до папки где будут храниться кастомные плагины и темы. По дефолту ~/.oh-my-zsh/custom, она также будет функционаривать, т.е. параметр не перезатерающийся.
# ZSH_CUSTOM=/path/to/new-custom-folder

# Path to your oh-my-zsh installation.
export ZSH="/home/dedandrey/.oh-my-zsh"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

MAGIC_ENTER_GIT_COMMAND='git status -u .'
MAGIC_ENTER_OTHER_COMMAND='ls -lh .'
plugins=(git git-prompt zsh-autosuggestions zsh-interactive-cd history history-substring-search fzf wd magic-enter globalias fancy-ctrl-z tmux tmuxinator sudo web-search catimg colorize colored-man-pages man command-not-found copybuffer extract universalarchive)
# Отключенные плуги
# vi-mode jump autojump scd per-directory-history zbell
ZSH_COLORIZE_TOOL=pygmentize
ZSH_COLORIZE_STYLE="colorful"
# VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
# VI_MODE_SET_CURSOR=true
# MODE_INDICATOR="%F{yellow}+%f"
ZSH_ALIAS_FINDER_AUTOMATIC=true

source $ZSH/oh-my-zsh.sh

# fzf & fd
[[ -e "/usr/share/fzf/fzf-extras.zsh" ]] && source /usr/share/fzf/fzf-extras.zsh
# export FZF_DEFAULT_COMMAND="fd --type file --color=always --follow --hidden --exclude .git"
export FZF_DEFAULT_COMMAND='ag --nocolor --follow --hidden -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--ansi --height 50% --layout=reverse --border --preview 'file {}' --preview-window down:1"
export FZF_COMPLETION_TRIGGER="~~"

# User configuration

# Path to Latex installation.
export PATH=/usr/local/texlive/2021/bin/x86_64-linux:$PATH
export MANPATH=/usr/local/texlive/2021/texmf-dist/doc/man:$MANPATH
export INFOPATH=/usr/local/texlive/2021/texmf-dist/doc/info:$INFOPATH

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

[[ -f ~/.alias_zsh ]] && . ~/.alias_zsh

### NNN ###

export NNN_FIFO=/tmp/nnn.fifo
export NNN_BMS='d:~/Документы;D:~/Загрузки/'
export NNN_PLUG='a:autojump;b:bookmarks;c:cdpath;g:getplugs;i:imgview;k:kdeconnect;m:mediainf;o:fzcd;p:pdfview;t:preview-tui-ext'
#imgthumb vidthumb
#--------------------

# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8,bg=bold,underline"

