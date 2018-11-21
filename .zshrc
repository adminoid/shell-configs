ATH=/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="spaceship"

plugins=(
  git zsh-syntax-highlighting zsh-autosuggestions history-substring-search iterm2 laravel5 nmap thefuck vi-mode z zsh-completions
)

source $ZSH/oh-my-zsh.sh
source ~/.bin/tmuxinator.zsh
#source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

export EDITOR='vim'

# https://dougblack.io/words/zsh-vi-mode.html
bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey "\e[3~" backward-delete-char
bindkey '^b' backward-kill-word
bindkey '^r' history-incremental-search-backward
bindkey "^k" history-beginning-search-backward
bindkey "^j" history-beginning-search-forward

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

#Customized git status, oh-my-zsh currently does not allow render dirty status before branch
git_custom_status() {
  local cb=$(git_current_branch)
  if [ -n "$cb" ]; then
    echo "$(parse_git_dirty)%{$fg_bold[yellow]%}$(work_in_progress)%{$reset_color%}$ZSH_THEME_GIT_PROMPT_PREFIX$(git_current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

function zle-line-init {
    VIM_PROMPT="%{$fg_bold[gray]%} [% NORMAL]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$(git_custom_status) $EPS1"
    # zle -K vicmd;
    zle reset-prompt
}

function zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[gray]%} [% NORMAL]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$(git_custom_status) $EPS1"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

#export DISPLAY_MAC=`ifconfig en5 | grep "inet " | cut -d " " -f2`:0
# function startx() {
# 	if [ -z "$(ps -ef|grep XQuartz|grep -v grep)" ] ; then
# 	    open -a XQuartz
#         socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\" &
# 	fi
# }

# alias vim='/usr/local/bin/mvim'

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

#autoload -U compinit && compinit
autoload bashcompinit && bashcompinit

# Remove forward-char widgets from ACCEPT
ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=("${(@)ZSH_AUTOSUGGEST_ACCEPT_WIDGETS:#forward-char}")

# Add forward-char widgets to PARTIAL_ACCEPT
ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS+=(forward-char)

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

fpath=( "$HOME/.zfunctions" $fpath )

export PATH="/usr/local/opt/php@7.1/bin:$PATH"
export PATH="/usr/local/opt/php@7.1/sbin:$PATH"
source /Users/petja/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
