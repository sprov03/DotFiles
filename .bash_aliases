alias newalias='vim ~/.bash_aliases; source ~/.bash_profile; savedotfiles>/dev/null; source ~/.bash_aliases'
alias showalias="cat ~/.bash_aliases"
alias supervisorEdit='vim ~/supervisord.ini'
alias ami-monitor='supervisord -c ~/supervisord.ini -n -k --childlogdir=/Users/shawnpivonka/supervisor-logs --program=ami-monitor > /dev/null 2>&1 & tail -f /Users/shawnpivonka/supervisor-logs/ami-monitor.log /Users/shawnpivonka/supervisor-logs/ami-monitor.err'

alias php81='/usr/local/Cellar/php@8.1/8.1.32_1/bin/php'
alias php82='/usr/local/Cellar/php@8.2/8.2.29/bin/php'
alias php83='/usr/local/Cellar/php@8.3/8.3.24/bin/php'
alias php84='/Users/shawnpivonka/Library/Application Support/Herd/bin//php'


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

# Repos
alias panaceaResyncRepos='panacea; repo sync -j8'
alias reposPanacea='panacea; repos core'
alias repossoldiers='panacea; repos soldiers'
alias soldiers='panacea; repos soldiers'
alias dronestrike='panacea; repos dronestrike'

# git aliases
alias gs='git status -sb'
alias pull='git pull'
alias push='git push'
alias commit='git add -a; git commit -am "'
alias log="git log --graph --pretty=format:'%cred%h%creset -%c(yellow)%d%creset %s %cgreen(%cr) %c(bold blue)<%an>%creset' --abbrev-commit"
alias gitclear='git add -a; git stash'
alias cleanorigin="git remote update origin --prune"
alias cleanlocal='git branch | grep -v "master" | xargs git branch -d'
alias cleangit='cleanorigin; cleanlocal'

alias fetch='git fetch'
alias master='git checkout master; fetch; pull; migrate'


# scaffold generation commands
alias genidehelpers='php82 artisan ide-helper:models --env=testing'
alias genpanacea=' php82 ~/development/sites/panacea/akceli-panacea-code-stanards/artisan akceli:generate --env=testing'
alias gen='php82 artisan akceli:generate'
alias sync='gen schema-sync --env=testing'
alias model='gen schema-model --env=testing'

# akceli commands
alias updateakceli='composer clearcache; composer update; composer require akceli/laravel-code-generator dev-master; php artisan akceli:publish'
alias publishakceli='php artisan akceli:publish'
alias reinstallalkceli='gittrash; updateakceli; publishakceli;'
alias updateakceli='composer remove akceli/laravel-code-generator; composer require akceli/laravel-code-generator dev-master'

# laravel aliases
#alias dumptesting='composer clearcache; composer dump-autoload; php artisan cache:clear; php artisan view:clear'
alias dumptesting='composer clearcache; composer dump-autoload; php artisan cache:clear --env=testing; php artisan view:clear'
alias dump='dumptesting'
#alias migratetesting='php /users/shawnpivonka/development/sites/panacea/pweb/artisan migrate --env=testing'
alias migratetesting='php artisan migrate --env=testing'
alias migrate='migratetesting'
#alias seedtesting='php /users/shawnpivonka/development/sites/panacea/pweb/artisan db:seed --env=testing'
alias seedtesting='php artisan db:seed --env=testing'
alias seed='seedtesting'
#alias rollbacktesting='php /users/shawnpivonka/development/sites/panacea/pweb/artisan migrate:rollback --env=testing'
alias rollbacktesting='php artisan migrate:rollback --env=testing'
alias rollback='rollbacktesting'
alias cycletesting='migratetesting; rollbacktesting; migratetesting'
alias cycle='cycletesting'
alias queue='php artisan queue:listen --timeout=120'

alias horizon='php artisan horizon'
alias jobs='horizon'

#alias refreshTesting='php /Users/shawnpivonka/Development/Sites/panacea/pweb/artisan migrate:fresh --env=testing; dumpTesting'
alias refreshTesting='php81 artisan migrate:fresh --env=testing --step; dumpTesting'
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

repos() {
    CWD=$(pwd)
    local group="$1"
    shift
    local cmd="$@"

    # If no group given, default to all
    [ -z "$group" ] && group="all"

    echo "Running in group: $group"
    echo "Command: $cmd"
    echo

    repo list --groups="$group" -p | awk '{print $1}' | while read dir; do
        echo -e "\n\033[1;35m▶▶▶  $dir  ◀◀◀\033[0m"
        (cd "$dir" && source ~/.bashrc && eval "$cmd")
    done
    cd $CWD
}
