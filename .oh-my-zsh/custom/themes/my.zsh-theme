PROMPT='%* %{$fg_bold[magenta]%}$(_git_time_since_commit)%{$fg_bold[green]%}%c %{$fg_bold[cyan]%}$(git_prompt_info)%{$fg_bold[blue]%}% $(vi_mode_prompt_info)%{$reset_color%}'

# Determine the time since last commit. If branch is clean,
# use a neutral color, otherwise colors will vary according to time.
function _git_time_since_commit() {
  local last_commit now seconds_since_last_commit
  local minutes hours days years commit_age
  # Only proceed if there is actually a commit.
  if last_commit=$(git log --pretty=format:'%at' -1 2> /dev/null); then
    now=$(date +%s)
    seconds_since_last_commit=$((now-last_commit))

    # Totals
    minutes=$((seconds_since_last_commit / 60))
    hours=$((minutes / 60))
    days=$((hours / 24))
    years=$((days / 365))

    if [[ $years -gt 0 ]]; then
      commit_age="${years}г $((days % 365 ))д "
    elif [[ $days -gt 0 ]]; then
      commit_age="${days}д $((hours % 24))ч "
    elif [[ $hours -gt 0 ]]; then
      commit_age+="${hours}ч $(( minutes % 60 ))м "
    else
      commit_age="${minutes}м "
    fi

    echo "${ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL}${commit_age}%{$reset_color%}"
  fi
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%} %{$fg[yellow]%}⚡%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}"

MODE_INDICATOR="%F{yellow}+ %f"
