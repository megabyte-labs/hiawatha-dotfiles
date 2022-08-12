# Add items to PATH
export PATH="$PATH:$HOME/.local/bin"

# Running this will update GPG to point to the current YubiKey
alias yubikey-gpg-stub='gpg-connect-agent "scd serialno" "learn --force" /bye'

export VAGRANT_HOME="$HOME/.local/vagrant.d"

# Docker
alias dk='docker'
alias dklc='docker ps -l'                                                            # List last Docker container
alias dklcid='docker ps -l -q'                                                       # List last Docker container ID
alias dklcip='docker inspect -f "{{.NetworkSettings.IPAddress}}" $(docker ps -l -q)' # Get IP of last Docker container
alias dkps='docker ps'                                                               # List running Docker containers
alias dkpsa='docker ps -a'                                                           # List all Docker containers
alias dki='docker images'                                                            # List Docker images
alias dkrmac='docker rm $(docker ps -a -q)'                                          # Delete all Docker containers
alias dkelc='docker exec -it $(dklcid) bash --login' # Enter last container
alias dkrmflast='docker rm -f $(dklcid)'
alias dkbash='dkelc'
alias dkex='docker exec -it '
alias dkri='docker run --rm -i '
alias dkric='docker run --rm -i -v $PWD:/cwd -w /cwd '
alias dkrit='docker run --rm -it '
alias dkritc='docker run --rm -it -v $PWD:/cwd -w /cwd '
alias dkirm='docker rmi '
alias dkip='docker image prune -a -f'
alias dkvp='docker volume prune -f'
alias dksp='docker system prune -a -f'
