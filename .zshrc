export ZSH="/home/max/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# ===== ALIASES =====
alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"

ex ()
{
  if [ -f $1  ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../..'
alias .5='cd ../../../..'
alias .6='cd ../../../../..'

# Verbosity and settings that you pretty much just always are going to want.
alias \
  cp="cp -iv" \
  mv="mv -iv" \
  rm="rm -vI" \
  mkd="mkdir -pv" \
  yt="youtube-dl --add-metadata -i" \
  yta="yt -x -f bestaudio/best" \
  ffmpeg="ffmpeg -hide_banner"

# Colorize commands when possible.
alias \
  ls="ls -hN --color=auto --group-directories-first" \
  grep="grep --color=auto" \
  diff="diff --color=auto" \
  ccat="highlight --out-format=ansi"

# These common commands are just too long! Abbreviate them.
alias \
  ka="killall" \
  g="git" \
  trem="transmission-remote" \
  YT="youtube-viewer" \
  sdn="sudo shutdown -h now" \
  f="ranger" \
  e="nvim" \
  v="nvim" \
  p="sudo pacman" \
  xi="sudo xbps-install" \
  xr="sudo xbps-remove -R" \
  xq="xbps-query" \
  z="zathura"

alias \
  magit="nvim -c MagitOnly" \
  ref="shortcuts >/dev/null; source ${XDG_CONFIG_HOME:-$HOME/.config}/shortcutrc ; source ${XDG_CONFIG_HOME:-$HOME/.config}/zshnameddirrc" \
  weath="less -S ${XDG_DATA_HOME:-$HOME/.local/share}/weatherreport" \
  tmux="tmux -f ${XDG_CONFIG_HOME:-$HOME/.config}/tmux/tmux.conf" \

# youtube-dl
alias yta-aac="youtube-dl --extract-audio --audio-format aac "
alias yta-best="youtube-dl --extract-audio --audio-format best "
alias yta-flac="youtube-dl --extract-audio --audio-format flac "
alias yta-m4a="youtube-dl --extract-audio --audio-format m4a "
alias yta-mp3="youtube-dl --extract-audio --audio-format mp3 "
alias yta-opus="youtube-dl --extract-audio --audio-format opus "
alias yta-vorbis="youtube-dl --extract-audio --audio-format vorbis "
alias yta-wav="youtube-dl --extract-audio --audio-format wav "
alias ytv-best="youtube-dl -f bestvideo+bestaudio "

# My aliases
alias \
  ytm="youtube-dl --add-metadata --extract-audio --audio-format mp3" \
  ytv="youtube-dl -f bestvideo+bestaudio" \
  t="tmux -f ${XDG_CONFIG_HOME:-$HOME/.config}/tmux/tmux.conf" \
  cfv="nvim ~/.config/nvim/init.vim" \
  cfa="nvim ~/.zshrc" \
  cfz="nvim ~/.zshrc" \
  gp="cd /mnt/d/02_Projects" \
  gd="cd /mnt/d/Windows/Documents" \
  gD="cd /mnt/d/Windows/Desktop" \
  gf="cd /mnt/d/04_Files" \
  gc="cd /mnt/d/03_Courses"

# For development
alias \
  py="python" \
  mongop="mongod --port 27017 --dbpath /home/max/database" \
  drun="dotnet run" \
  dbuild="dotnet build" \
  dres="dotnet restore" \
  dnuget="dotnet add package" \
  ngs="ng serve" \
  ngt="ng test" \
#  config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
