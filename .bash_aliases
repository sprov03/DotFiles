alias newalias='vim ~/.bash_aliases; source ~/.bash_profile; savedotfiles>/dev/null; source ~/.bash_aliases'
alias showalias="cat ~/.bash_aliases"
alias supervisorEdit='vim ~/supervisord.ini'
alias supervisorStart='supervisord -c ~/supervisord.ini'
alias supervisorRestart='supervisord restart'

alias mcpServe="uv run mcp dev "

function catall() {
    local dir="${1:-.}"
    dir="${dir%/}"
    find "$dir" -type f \
        -not \( -name ".env*" -not -name ".env.example" \) \
        -not -name "*.log" \
        -not -name ".git*" \
        -exec sh -c "echo \"=== \$1 ===\"; cat \"\$1\"; echo" _ {} \; 
}

# Just the tree structure (no contents)
alias tree='find . -not -path "*/node_modules/*" -not -path "*/.git/*" -not -path "*/vendor/*" | sed "s|[^/]*/| |g"'

# Codex
# alias gemini='open-codex --provider gemini --model gemini-2.5-pro-exp-03-25 --approval-mode full-auto '
alias grok='open-codex --provider xai --model grok-3 --endpoint https://api.x.ai/v1 --approval-mode full-auto '
alias openAi='codex --approval-mode full-auto '

alias addlocalhost='function _addhost() { echo "127.0.0.1 $1" | sudo tee -a /etc/hosts; }; _addhost'

# Important Directories
alias development='cd ~/Development'
alias sites='cd ~/Development/Sites'
alias panacea='cd ~/Development/Sites/panacea'
alias dotfiles='cd ~/DotFiles'

#Ngrok Aliases
#alias ngrok='~/Development/Tools/ngrok'
alias ngrokPort='ngrok http '
alias ngrokDroneStrike='ngrok http 127.0.0.1:80 --host-header=api.dronestrike.test'
alias ngrokDroneStrike='ngrok http --url=pervasive-nakita-subrotund.ngrok-free.dev 80 --host-header=api.dronestrike.test'


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
#alias migrateTesting='php /Users/shawnpivonka/Development/Sites/panacea/pweb/artisan migrate --env=testing'
alias migrateTesting='php artisan migrate --env=testing'
alias migrate='migrateTesting'
#alias seedTesting='php /Users/shawnpivonka/Development/Sites/panacea/pweb/artisan db:seed --env=testing'
alias seedTesting='php artisan db:seed --env=testing'
alias seed='seedTesting'
#alias rollbackTesting='php /Users/shawnpivonka/Development/Sites/panacea/pweb/artisan migrate:rollback --env=testing'
alias rollbackTesting='php artisan migrate:rollback --env=testing'
alias rollback='rollbackTesting'
alias cycleTesting='migrateTesting; rollbackTesting; migrateTesting'
alias cycle='cycleTesting'
alias queue='php artisan queue:listen --timeout=120'

alias horizon='php artisan horizon'
alias jobs='horizon'

#alias refreshTesting='php /Users/shawnpivonka/Development/Sites/panacea/pweb/artisan migrate:fresh --env=testing; dumpTesting'
alias refreshTesting='php artisan migrate:fresh --env=testing --step; dumpTesting'
alias refresh='refreshTesting'

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
