alias newalias='vim ~/.bash_aliases; source ~/.bashrc_aliases'
alias showalias="cat ~/.bash_aliases"

alias mcpServe="uv run mcp dev "

if [ -f ~/.shared_aliases ]; then
    . ~/.shared_aliases
fi

#alias sshServer='ssh forge@24.144.123.119'
alias sshServer='ssh root@64.227.31.34'
alias sshNew='ssh root@107.170.58.192'

# Codex
alias gemini='open-codex --provider gemini --model gemini-2.5-pro-exp-03-25 --approval-mode full-auto '
alias grok='open-codex --provider xai --model grok-3 --endpoint https://api.x.ai/v1 --approval-mode full-auto '
alias openAi='codex --approval-mode full-auto '


# Important Directories
alias development='cd ~/Development'
alias homestead='cd ~/Development/VirtualBoxes/Homestead'
alias dotfiles='cd ~/DotFiles'
alias sites='cd ~/Development/Sites'
alias akceli='cd ~/Development/Sites/akceli-new'
alias api.flippilot='cd ~/Development/Sites/flippilot'
alias akceli-demos='cd ~/Development/Sites/akceli-demos'
alias deploy='commit deploy"; push'
alias docup='sail up -d; sail shell'

alias docs='cd ~/Development/Sites/docs-ai'
alias properties='cd ~/Development/Sites/property-tracker; nvm use 20'

alias start='npm run start'

alias serveLocal='cd backend; npm run serve && cd ../frontend; npm run start'

# Vagrant Aliases
alias vreprovision='homestead; vagrant reload --provision'
alias vup='homestead; vagrant up; vagrant ssh'
alias vshh='homestead; vagrant ssh'
alias vhalt='homestead; vagrant halt'

#Ngrok Aliases
alias ngrok='~/Development/Tools/ngrok'
alias ngrokPort='ngrok http '
#alias ngrokAkcelm='ngrok http 192.168.10.10:80 -host-header=rapid-code-gen.local -subdomain=akceli'
alias ngrokAkceli='ngrok http 192.168.10.10:80 -host-header=akceli.local -subdomain=akceli'
alias ngrokNovelizeLocal='ngrok http 192.168.10.10:80 -host-header=novelize.local -subdomain=shawn-flippilot'
alias ngrokshawnFlippilotLocal='ngrok http 192.168.10.10:80 -host-header=api.flippilot.local -subdomain=shawn-flippilot'
#alias ngrokFlipPiolotLocal='ngrok http 192.168.10.10:80 -host-header=app.flippilot.local -subdomain=flippilot'
alias ngrokFlipPiolotLocal='ngrok http 127.0.0.1:80 -host-header=flippilot.local -subdomain=flippilot'
alias ngrokVaToolLocal='ngrok http 127.0.0.1:80 -host-header=app.forefront-va-tool.local -subdomain=flippilot'
alias ngrokProjectTracker='ngrok http 127.0.0.1:80 http://localhost:3000 -subdomain=flippilot'
