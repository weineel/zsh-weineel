setopt auto_cd # 开启目录名直接 cd
setopt auto_pushd
setopt share_history # share history between sessions

# alias
alias ...='../..'
alias ....='../../..'
alias .....='../../../..'
alias ......='../../../../..'

alias gcza='git add . && git cz'

# Copies the pathname of the current directory to the system or X Windows clipboard
function copydir {
  emulate -L zsh
  # 依赖 https://github.com/ohmyzsh/ohmyzsh/blob/277f38212a/lib/clipboard.zsh
  print -n $PWD | clipcopy
}

# Copies the contents of a given file to the system or X Windows clipboard
#
# copyfile <file>
function copyfile {
  emulate -L zsh
  # 依赖 https://github.com/ohmyzsh/ohmyzsh/blob/277f38212a/lib/clipboard.zsh
  clipcopy $1
}
