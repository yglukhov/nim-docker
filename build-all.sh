
set -ev

docker build -t yglukhov/debian-pre-nim debian-pre-nim
docker push yglukhov/debian-pre-nim

./build-nim.sh
