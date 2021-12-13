# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

export NVM_DIR="$HOME/.nvm"
    [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
    [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

#alias aws="docker run --rm -it -v ~/.aws:/root/.aws amazon/aws-cli"
alias powershell="docker run --rm -it -v $PWD:/usr/src mcr.microsoft.com/powershell"

# EatNGo
alias eatngo-sql="docker run -d -p 5432:5432 -e POSTGRES_HOST_AUTH_METHOD=trust -v eatngo-postgres:/var/lib/postgresql/data --name eatngo_postgres postgres"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/alvaromolina/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/alvaromolina/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/alvaromolina/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/alvaromolina/Downloads/google-cloud-sdk/completion.bash.inc'; fi
