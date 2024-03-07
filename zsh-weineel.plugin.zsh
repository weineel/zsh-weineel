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

# 需要结合 clash 一起使用, 或则结合第三方的代理地址
function proxy_on() {
  # 第一个参数是代理地址，默认是 http://127.0.0.1:7890
  export http_proxy=${1:-http://127.0.0.1:7890}
  export https_proxy=$http_proxy
  echo -e "终端代理已开启。"
}

function proxy_off() {
  unset http_proxy https_proxy
  echo -e "终端代理已关闭。"
}
