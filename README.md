# renovate-reproduction-18206

This is a reproduction for this GitHub issue: https://github.com/renovatebot/renovate/issues/18206

In oder to reproduce the error run the following two commands.

```sh
# start local docker registry
docker run \
  -d -p 5000:5000 \
  -e REGISTRY_PROXY_REMOTEURL="https://registry-1.docker.io" \
  registry:2.8.1
```

```sh
# run renovate
docker run \
  --rm \
  -v $PWD/renovate.json:/usr/src/app/renovate.json \
  -e RENOVATE_TOKEN=YOUR_TOKEN_HERE \
  -e RENOVATE_REPOSITORIES="maltemorgenstern/renovate-reproduction-18206" \
  --network host \
  -it \
  renovate/renovate:32.229.0-slim
```

output:
```sh

```
