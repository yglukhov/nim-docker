
set -ev

buildAndPush() {
    docker build -t yglukhov/$1 $1
    docker push yglukhov/$1
}

if [ "$1" = "all" -o "$BUILD_ALL" = "true" ]
then
    buildAndPush debian-pre-nim
    buildAndPush debian-jessie-pre-nim
fi

buildAndPush nim-base
buildAndPush debian-jessie-nim-base

buildAndPush nim-ui-base
