export ZGEN_RESET_ON_CHANGE=($HOME/.zsh/zgen-setup.zsh)

# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init script doesn't exist
if ! zgen saved; then
    echo "Creating a zgen save 👷🏻‍♂️"
    # specify plugins here
    zgen oh-my-zsh
    zgen load romkatv/powerlevel10k powerlevel10k
    zgen oh-my-zsh plugins/osx
    zgen oh-my-zsh plugins/globalias
    zgen oh-my-zsh plugins/xcode
    zgen oh-my-zsh plugins/sublime

    # generate the init script from plugins above
    zgen save
    echo "Created zgen ✅"
fi