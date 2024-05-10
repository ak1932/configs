gcc_test () {
    mkdir -p ./build
    gcc "$1" -o "./build/$1.o" -lstdc++ -lm && "./build/$1.o"
}

alias goldwarden="flatpak run --command=goldwarden com.quexten.Goldwarden"

alias ls='ls --color=auto -a'
alias ll='ls -lav --ignore=..'   # show long listing of all except ".."
alias l='ls -lav --ignore=.?*'   # show long listing but no hidden dotfiles except "."
