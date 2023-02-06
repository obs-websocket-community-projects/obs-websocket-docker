#!/bin/sh
set -e

UNSECURE_BUILD=0
TAG_SUFFIX=""

while [ "$1" != "" ]; do
  case "$1" in
    "--unsecured")
      UNSECURE_BUILD=1
      TAG_SUFFIX="-unsecured"
      echo "Unsecure image enabled"
      shift
      ;;
    * )
      # unknown param causes args to be passed through to $@
      break
      ;;
  esac
done

_obs_version=${1:-29.*}
_docker_repo=${2:-obswebsocket-local}
_tag=${3:-latest}

echo "Building ${_docker_repo}:${_tag}${TAG_SUFFIX}"

docker_build() {

  if [ $UNSECURE_BUILD = "0" ]; then
    dockerfile="Dockerfile.secured"
  else
    dockerfile="Dockerfile.unsecured"
  fi

  tag="${_docker_repo}:${_tag}${TAG_SUFFIX}"

  docker build \
    --build-arg OBS_STUDIO_VERSION=${_obs_version} \
    --tag ${tag} \
    -f "${dockerfile}" \
    .
}

docker_build