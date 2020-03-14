## Setup
Clone the release into your sites directory, So it will be avaiable both in your local and vagrant box.

## Vagrant Box Setup
```
ln -s /var/www/DotFiles/.vagrant_aliases
sudo sh -c 'echo "
if [ -f ~/.vagrant_aliases ]; then
    . ~/.vagrant_aliases
fi

" >> ~/.bashrc'
source .bashrc

```


## Local Setup
```


```
