setopt auto_cd # 开启目录名直接 cd
setopt auto_pushd
setopt share_history # share history between sessions

# alias
alias ...='../..'
alias ....='../../..'
alias .....='../../../..'
alias ......='../../../../..'

alias gcza='git add . && git cz'
alias lg='inno-lane git'
alias lgcmr='inno-lane git create-mr'
alias lgs='inno-lane git sync'
alias lgsc='inno-lane git sync -c'

alias lgen='inno-lane gen'

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
