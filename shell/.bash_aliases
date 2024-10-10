gcc_test () {
    mkdir -p ./build
    # g flag for debugging
    g++ "$1" -g -o "./build/$1.o" && "./build/$1.o"
}

java_run () {
    mkdir -p ./build
    base=$(echo "$1" | cut -d . -f 1)
    javac "$1" -d "./build" &&
    java -classpath ./build "$base"
}

alias goldwarden="flatpak run --command=goldwarden com.quexten.Goldwarden"

alias ls='ls --color=auto -a'
alias ll='ls -lav --ignore=..'   # show long listing of all except ".."
alias l='ls -lav --ignore=.?*'   # show long listing but no hidden dotfiles except "."
alias nnvim='~/nvim/usr/bin/nvim'
