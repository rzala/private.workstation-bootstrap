# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git kubectl zsh-autosuggestions zsh-syntax-highlighting fzf podman)
source $ZSH/oh-my-zsh.sh

export PATH="$HOME/.local/bin:$PATH"

# Kubectl aliases and completions
alias k="kubectl"
alias kctx="kubectx"
alias kns="kubens"
alias k9="k9s"
alias kgp="kubectl get pods"
alias kgs="kubectl get svc"
alias kgd="kubectl get deployment"
alias kaf="kubectl apply -f"
alias kdel="kubectl delete"
alias klog="kubectl logs"
alias kexec="kubectl exec -it"

# Podman aliases
alias docker="podman"
alias pd="podman"
alias pdi="podman images"
alias pds="podman ps"
alias pdsa="podman ps -a"
alias pdb="podman build"
alias pdr="podman run"
alias pde="podman exec"

# Git aliases
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git pull"
alias gco="git checkout"
alias gb="git branch"
alias gd="git diff"
alias glog="git log --oneline --graph"

# FZF configuration
if command -v fzf >/dev/null 2>&1; then
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fi

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='find . -type d'

# Powerline configuration
if command -v powerline-daemon >/dev/null 2>&1; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
fi

export EDITOR=vim

# Enable kubectl completion
if command -v kubectl >/dev/null 2>&1; then
  source <(kubectl completion zsh)
fi

# Enable podman completion
if command -v podman >/dev/null 2>&1; then
  source <(podman completion zsh)
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Add Krew (kubectl plugin manager) to PATH
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

pyenv activate pymadix 2>/dev/null || true

