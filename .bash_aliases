alias newalias='vim ~/.bash_aliases; source ~/.bashrc; savedotfiles'
alias newsharedalias='vim ~/.shared_aliases; source ~/.bashrc; savedotfiles'
alias showalias="cat ~/.bash_aliases"

if [ -f ~/.shared_aliases ]; then
    . ~/.shared_aliases
fi

# Important Directories
alias development='cd ~/Development'
alias homestead='cd ~/Development/VirtualBoxes/Homestead'
alias dotfiles='cd ~/dot-files'
alias sites='cd ~/Development/Sites'
alias akceli='cd ~/Development/Sites/akceli'
alias api.flippilot='cd ~/Development/Sites/api.flippilot'
alias app.flippilot='cd ~/Development/Sites/app.flippilot'

# Vagrant Aliases
alias vreprovision='homestead; vagrant reload --provision'
alias vup='homestead; vagrant up; vagrant ssh'
alias vshh='homestead; vagrant ssh'
alias vhalt='homestead; vagrant halt'

#Ngrok Aliases
alias ngrok='/home/shawn/Development/Tools/ngrok'
alias ngrokAkceli='ngrok http 192.168.10.10:80 -host-header=rapid-code-gen.local -subdomain=akceli'
alias ngrokAkceli='ngrok http 192.168.10.10:80 -host-header=akceli.local -subdomain=akceli'
alias ngrokFlipPiolotLocal='ngrok http 192.168.10.10:80 -host-header=api.flippilot.local -subdomain=flippilot'
