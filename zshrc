cat ~/logo

##vi mode
#bindkey -v
#bindkey -M vicmd '^[' undefined-key
## You may already have those in your .zshrc somewhere
#autoload -U promptinit && promptinit
#autoload -U colors     && colors
#
#setopt prompt_subst
#
## Set the colors to your liking
#local vi_normal_marker="[%{$fg[green]%}%BN%b%{$reset_color%}]"
#local vi_insert_marker="[%{$fg[cyan]%}%BI%b%{$reset_color%}]"
#local vi_unknown_marker="[%{$fg[red]%}%BU%b%{$reset_color%}]"
#local vi_mode="$vi_insert_marker"
#vi_mode_indicator () {
#  case ${KEYMAP} in
#    (vicmd)      echo $vi_normal_marker ;;
#    (main|viins) echo $vi_insert_marker ;;
#    (*)          echo $vi_unknown_marker ;;
#  esac
#}
#
## Reset mode-marker and prompt whenever the keymap changes
#function zle-line-init zle-keymap-select {
#  vi_mode="$(vi_mode_indicator)"
#  zle reset-prompt
#}
#zle -N zle-line-init
#zle -N zle-keymap-select
#
## Multiline-prompts don't quite work with reset-prompt; we work around this by
## printing the first line(s) via a precmd which is executed before the prompt
## is printed.  The following can be integrated into PROMPT for single-line
## prompts.
##
## Colorize freely
#local user_host='%B%n%b@%m'
#local current_dir='%~'
#precmd () print -rP "${user_host} ${current_dir}"
#
#export KEYTIMEOUT=1
#
#local return_code="%(?..%{$fg[red]%}%? %{$reset_color%})"
#RPROMPT='${return_code}${vi_mode} %# '

#Plugins
#autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#a3be8c,bg=rgba(0, 0, 0, 0.0)"
bindkey '^ ' autosuggest-accept


#syntax highlighting
source /home/bnn/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
source /home/bnn/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/bnn/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


#Aliases
alias ls="ls -a"
alias la="ls -A"

#Prompt
PS1="%F{#b48ead}%t%f | %F{#b48ead}%B%n@%m%b %1~ :%f" 


source /home/bnn/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/bnn/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/bnn/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/bnn/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/bnn/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
