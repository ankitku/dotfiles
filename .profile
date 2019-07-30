export PS1="\u@\h \w $ "
export CLICOLOR=1
export DARCS_DO_COLOR_LINES=1
export LSCOLORS=ExFxCxDxBxegedabagacad

export ANDROID_HOME=~/Library/Android/sdk/
export PATH=~/Library/Android/sdk/platform-tools/:~/Library/Android/sdk/tools/:$PATH
export PATH=~/.cabal/bin/:$PATH
export PATH=/usr/local/opt/llvm/bin:$PATH
export PATH=~/.emacs:$PATH
export PATH=/Library/TeX/texbin:$PATH

# Add GHC 7.10 to the PATH, via https://ghcformacosx.github.io/
export GHC_DOT_APP="/Users/ankitku/Applications/ghc-7.10.1.app"
if [ -d "$GHC_DOT_APP" ]; then
  export PATH="${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi

alias weather='curl -4 wttr.in/Kanpur'
exec /bin/zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
