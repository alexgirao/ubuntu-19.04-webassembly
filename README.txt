
**************** references

- https://webassembly.org/getting-started/developers-guide/

**************** build docker image

head Dockerfile

**************** explore image

./docker-cwd.sh --init -t ubuntu-19.04-webassembly /bin/bash -l

**************** minimal test

./docker-cwd.sh --init -t ubuntu-19.04-webassembly /bin/bash -eux -c '
    cd /emsdk
    . ./emsdk_env.sh --build=Release
    which emcc
'

**************** generate hello.wasm and hello.html from hello.c

mkdir -p "${HOME}/Ephemeral/var/dot.emscripten_cache"

./docker-cwd.sh --init -t -v "${HOME}/Ephemeral/var/dot.emscripten_cache:/emsdk/.emscripten_cache" \
    ubuntu-19.04-webassembly /bin/bash -eu -c '
        . /emsdk/emsdk_env.sh --build=Release
        exec emcc hello.c -s WASM=1 -o hello.html
'

****************
