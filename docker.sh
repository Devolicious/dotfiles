
#eval "$(docker-machine env dev)"

alias dc='docker-compose'
alias drmdangling='docker rmi -f $(docker images -q -a -f dangling=true)'
alias drmvolumes='docker volume rm $(docker volume ls -qf dangling=true)'
alias drmexited='docker rm $(docker ps -a -f status=exited -q)'

function dcb() {
  docker exec -it $(docker-compose ps -q $1) bash
}

function dcphp() {
  docker exec -it $(docker-compose ps -q php) $1
}

function dcgulp() {
  docker exec -it $(docker-compose ps -q php) gulp $1
}