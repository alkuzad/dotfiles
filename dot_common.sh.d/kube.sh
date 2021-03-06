alias ku='kubectl'
alias kug='kubectl get'
alias kud='kubectl describe'

# aliases for kubectx (brew install kubectx)
alias kctx='kubectx'
alias kns='kube-ns'

if command -v kubectl >/dev/null; then
  # load shell completions
  if [[ -n "$ZSH_VERSION" ]]; then
    source <(kubectl completion zsh)
    # a helper alias because this seems to constantly be breaking when loaded from .zshrc
    alias kube-completions='source <(kubectl completion zsh)'
  fi

  if [[ -n "$BASH_VERSION" ]]; then
    source <(kubectl completion bash)
  fi
fi

if [[ -d "$HOME/.krew/bin" ]]; then
  export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
fi
