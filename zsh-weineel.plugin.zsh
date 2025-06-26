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
  export all_proxy=socks5://127.0.0.1:7890
	export no_proxy=127.0.0.1,localhost
  export HTTP_PROXY=$http_proxy
  export HTTPS_PROXY=$http_proxy
  export ALL_PROXY=$all_proxy
 	export NO_PROXY=$no_proxy
  echo -e "\033[32m[√] 终端代理已开启: $http_proxy"
}

function proxy_off() {
  unset http_proxy https_proxy all_proxy no_proxy HTTP_PROXY HTTPS_PROXY ALL_PROXY NO_PROXY
  echo -e "\033[31m[×] 终端代理已关闭"
}

function proxy_show() {
  env | grep -E 'http_proxy|https_proxy|all_proxy|no_proxy|HTTP_PROXY|HTTPS_PROXY|ALL_PROXY|NO_PROXY'
}

# 切换到 git 根目录, 如果当前目录不在 git 仓库中, 则切换到 $HOME
function groot() {
  local git_root
  git_root=$(git rev-parse --show-toplevel 2>/dev/null)
  
  if [ $? -eq 0 ]; then
    cd "$git_root" || return
    echo "已切换到 Git 根目录: $(pwd)"
  else
    cd "$HOME" || return
    echo "已切换到 $HOME"
  fi
}
