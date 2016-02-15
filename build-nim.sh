
set -ev

docker build -t yglukhov/nim-base nim-base
docker push yglukhov/nim-base

docker build -t yglukhov/nim-ui-base nim-ui-base
docker push yglukhov/nim-ui-base

docker build -t yglukhov/devel old-deprecated-devel
docker push yglukhov/devel