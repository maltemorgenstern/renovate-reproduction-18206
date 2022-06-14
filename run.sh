#!/bin/bash

if [ -z $RENOVATE_TOKEN ]; then
  echo "set RENOVATE_TOKEN"
  exit 1;
fi

if [ -z $RENOVATE_REPOSITORIES ]; then
  echo "set RENOVATE_REPOSITORIES"
  exit 1;
fi

docker run -d -p 5000:5000 -e REGISTRY_PROXY_REMOTEURL="https://registry-1.docker.io" registry:latest

docker run --rm -v $PWD/renovate.json:/usr/src/app/renovate.json -e RENOVATE_TOKEN="$RENOVATE_TOKEN" -e RENOVATE_REPOSITORIES="$RENOVATE_REPOSITORIES" -it renovate/renovate:32.84.3

