
set -ev

if [ "$1" = "all" -o "BUILD_ALL" = "true" ]
then
    docker build -t yglukhov/debian-pre-nim debian-pre-nim
    docker push yglukhov/debian-pre-nim
fi

docker build -t yglukhov/nim-base nim-base
docker push yglukhov/nim-base

docker build -t yglukhov/nim-ui-base nim-ui-base
docker push yglukhov/nim-ui-base

docker build -t yglukhov/devel old-deprecated-devel
docker push yglukhov/devel
