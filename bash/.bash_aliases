gcc_test () {
    mkdir -p ./build
    gcc "$1" -o "./build/$1.o" -lstdc++ -lm && "./build/$1.o"
}
alias goldwarden="flatpak run --command=goldwarden com.quexten.Goldwarden"
