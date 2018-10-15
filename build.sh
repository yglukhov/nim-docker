
OWNER_ACC=yglukhov
MAINTAINER="Yuriy Glukhov <yuriy.glukhov@gmail.com>"

set -e

buildAndPush() {
  id=$1
  parentLayer=$(echo $id | sed 's/\.[^.]*$//')
  thisLayer=$(echo $id | sed 's/^.*\.\([^.]*\)$/\1/')

  buildDir=$(mktemp -dt docker-build-XXXXXX)
  thisDir=$(dirname $0)
  dockerfile="$buildDir/Dockerfile"
  installfile="$buildDir/install.sh"

  if echo $parentLayer | grep '\.' > /dev/null
  then
    echo FROM $OWNER_ACC/$parentLayer > "$dockerfile"
  else
    cp "$thisDir/layers/$parentLayer.sh" "$dockerfile"
  fi

  echo MAINTAINER $MAINTAINER >> "$dockerfile"
  cat "$thisDir/layers/$thisLayer.sh" | sed -e '/# SCRIPT/,$d' >> "$dockerfile"
  echo '. /common_utils.sh' > "$installfile"
  echo 'set -ex' >> "$installfile"
  cat "$thisDir/layers/$thisLayer.sh" | sed -e '1,/# SCRIPT/d' >> "$installfile"
  cp "$thisDir/preinstall.sh" "$thisDir/postinstall.sh" "$thisDir/common_utils.sh" "$buildDir"

  chmod +x "$buildDir"/*.sh
  echo 'ADD *install.sh common_utils.sh /' >> "$dockerfile"
  echo 'RUN /preinstall.sh && /install.sh && /postinstall.sh' >> "$dockerfile"

  docker build -t $OWNER_ACC/$id "$buildDir"
  docker push $OWNER_ACC/$id
}

if [ $# = 0 ]
then
  echo "Usage: $(basename $0) dir1 ..."
  exit 1
fi

for a in $*
do
  if echo $a | grep '\?' > /dev/null
  then
    if [ "$BUILD_ALL" = "true" ]
    then
      buildAndPush $(echo $a | sed 's/\?//')
    fi
  else
    buildAndPush $a
  fi
done

