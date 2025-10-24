alias newalias='vim ~/.bash_aliases; source ~/.bash_profile; savedotfiles>/dev/null'
alias showalias="cat ~/.bash_aliases"

alias mcpServe="uv run mcp dev "

# Codex
# alias gemini='open-codex --provider gemini --model gemini-2.5-pro-exp-03-25 --approval-mode full-auto '
alias grok='open-codex --provider xai --model grok-3 --endpoint https://api.x.ai/v1 --approval-mode full-auto '
alias openAi='codex --approval-mode full-auto '

alias addlocalhost='function _addhost() { echo "127.0.0.1 $1" | sudo tee -a /etc/hosts; }; _addhost'

# Important Directories
alias development='cd ~/Development'
alias sites='cd ~/Development/Sites'
alias dotfiles='cd ~/DotFiles'

#Ngrok Aliases
#alias ngrok='~/Development/Tools/ngrok'
alias ngrokPort='ngrok http '
alias ngrokDroneStrike='ngrok http 127.0.0.1:80 -host-header=api.dronestrike.testing '
#alias ngrokAkcelm='ngrok http 192.168.10.10:80 -host-header=rapid-code-gen.local -subdomain=akceli'
alias ngrokAkceli='ngrok http 192.168.10.10:80 -host-header=akceli.local -subdomain=akceli'
alias ngrokNovelizeLocal='ngrok http 192.168.10.10:80 -host-header=novelize.local -subdomain=shawn-flippilot'
alias ngrokshawnFlippilotLocal='ngrok http 192.168.10.10:80 -host-header=api.flippilot.local -subdomain=shawn-flippilot'
#alias ngrokFlipPiolotLocal='ngrok http 192.168.10.10:80 -host-header=app.flippilot.local -subdomain=flippilot'
alias ngrokMindForge='ngrok http 127.0.0.1:80 -host-header=mind-forge.local -subdomain=flippilot'
alias ngrokFlipPiolotLocal='ngrok http 127.0.0.1:80 -host-header=flippilot.local -subdomain=flippilot'
alias ngrokVaToolLocal='ngrok http 127.0.0.1:80 -host-header=app.forefront-va-tool.local -subdomain=flippilot'
alias ngrokProjectTracker='ngrok http 127.0.0.1:80 http://localhost:3000 -subdomain=flippilot'


# Server Mainainece
# Ducks  get file sizes
alias ducks='du -cks * | sort -rn | head'

# Git Aliases
alias gs='git status -sb'
alias pull='git pull'
alias push='git push'
alias commit='git add -A; git commit -am "'
alias log="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gitclear='git add -A; git stash'
alias cleanorigin="git remote update origin --prune"
alias cleanlocal='git branch | grep -v "master" | xargs git branch -D'
alias cleangit='cleanorigin; cleanlocal'

alias fetch='git fetch'
alias master='git checkout master; fetch; pull; migrate'


# Scaffold Generation Commands
alias genidehelpers='php artisan ide-helper:models --env=testing'
alias gen='php artisan akceli:generate --env=testing'
alias sync='gen schema-sync --env=testing'
alias model='gen schema-model --env=testing'

# Akceli Commands
alias updateakceli='composer clearcache; composer update; composer require akceli/laravel-code-generator dev-master; php artisan akceli:publish'
alias publishakceli='php artisan akceli:publish'
alias reinstallalkceli='gittrash; updateakceli; publishakceli;'
alias updateakceli='composer remove akceli/laravel-code-generator; composer require akceli/laravel-code-generator dev-master'

# Laravel Aliases
#alias dumpTesting='composer clearcache; composer dump-autoload; php artisan cache:clear; php artisan view:clear'
alias dumpTesting='composer clearcache; composer dump-autoload; php artisan cache:clear --env=testing; php artisan view:clear'
alias dump='dumpTesting'
alias migrateTesting='php /Users/shawnpivonka/Development/Sites/pweb/artisan migrate --env=testing'
alias migrate='migrateTesting'
alias seedTesting='php /Users/shawnpivonka/Development/Sites/pweb/artisan db:seed --env=testing'
alias seed='seedTesting'
alias rollbackTesting='php /Users/shawnpivonka/Development/Sites/pweb/artisan migrate:rollback --env=testing'
alias rollback='rollbackTesting'
alias cycleTesting='migrateTesting; rollbackTesting; migrateTesting'
alias cycle='cycleTesting'
alias queue='php artisan queue:listen --timeout=120'

alias horizon='php artisan horizon'
alias jobs='horizon'

alias freshTesting='php /Users/shawnpivonka/Development/Sites/pweb/artisan migrate:fresh --env=testing; dumpTesting'
alias fresh='freshTesting'

alias routes='php artisan route:list'
function route() {
        php artisan route:list | grep $1
}


function gittrash() {
	branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
	git checkout -b trash-branch
	commit trash"
	git checkout $branch
	git branch -D trash-branch
}
function pushup() {
	branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
	git push --set-upstream origin $branch
}
function mergeMaster() {
	branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
	echo $branch
	master
	git checkout $branch
	git merge master
	migrate
}
function merge() {
	branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
	git checkout $1
	git fetch
	git pull
	git checkout $branch
	git merge $1
}

function pulldown() {
	master
	git checkout $1
	branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
	git checkout -b ${branch}-shawn
	mergeMaster
	gs
}

function pulldotfiles() {
	CWD=$(pwd)
	dotfiles
	pull
	cd $CWD
}

function savedotfiles() {
	CWD=$(pwd)
	dotfiles
	commit saving changes to dot-files"
	push
	cd $CWD
}
