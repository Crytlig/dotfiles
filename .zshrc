# zshrc
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""

plugins=(
	git
	docker
	kubectx
	kubectl
	gh
	fzf
	z
	zsh-syntax-highlighting
	zsh-autosuggestions
	zsh-interactive-cd
	zsh-fzf-history-search
)

source $ZSH/oh-my-zsh.sh
# source ~/.openai
source ~/.aliases.zsh

if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
compinit
unsetopt BEEP

export PAGER=cat

# End of lines added by compinstall
#
# For a full list of active aliases, run `alias`.
alias lg=lazygit
alias nv=nvim
alias k=kubectl
alias tf=terraform
alias conf="nvim ~/.zshrc"
alias kns='kubectl ns'
alias ktx='kubectl ctx'

# Make fzf default to ripgrep
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m'
fi


# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

#complete -F __start_terraform tf
#complete -F __start_kubectl k

# Change comment style from dark blue to green
#ZSH_HIGHLIGHT_STYLES[comment]=fg=green,bold
if [ $(uname) = "Darwin" ]; then
	ZSH_HIGHLIGHT_STYLES[comment]=fg=green,bold
	ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#a8a8a6'
else
	ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#555555'
fi

# Other exports
export EDITOR=nvim
export PATH=$PATH:/home/cliff/bin
export PATH=$PATH:/home/cliff/.tools
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/home/$USER/go/bin/
export PATH=$PATH:/home/$USER/.tools
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$HOME/.dotnet:$HOME/.dotnet/tools
## WSL
# export PATH=$PATH:"/mnt/c/Users/ClaesRytlig/AppData/Local/Programs/Microsoft VS Code/bin"
# export PATH=$PATH:"/mnt/c/Windows/System32"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

autoload -U +X bashcompinit && bashcompinit

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

complete -o nospace -C ~/tools/terragrunt terragrunt
eval "$(starship init zsh)"
