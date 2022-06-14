# renovate-docker-404

In oder to reproduce the error run the following two commands.

```sh
# start local docker registry
docker run \
  -d -p 5000:5000 \
  -e REGISTRY_PROXY_REMOTEURL="https://registry-1.docker.io" \
  registry:latest
```

```sh
# run renovate
docker run \
  --rm \
  -v $PWD/renovate.json:/usr/src/app/renovate.json \
  -e RENOVATE_TOKEN=YOUR_TOKEN_HERE \
  -e RENOVATE_REPOSITORIES="jmueller42/renovate-docker-404" \
  --network host \
  -it \
  renovate/renovate
```

output:
```sh
 INFO: Repository started (repository=jmueller42/renovate-docker-404)
       "renovateVersion": "32.85.0"
 INFO: Dependency extraction complete (repository=jmueller42/renovate-docker-404)
       "baseBranch": "main",
       "stats": {
         "managers": {"dockerfile": {"fileCount": 1, "depCount": 1}},
         "total": {"fileCount": 1, "depCount": 1}
       }
 WARN: Invalid registry response (repository=jmueller42/renovate-docker-404)
       "apiCheckUrl": "http://localhost:5000/v2/alpine/tags/list?n=10000",
       "res": {
         "statusCode": 404,
         "body": {
           "errors": [
             {
               "code": "NAME_UNKNOWN",
               "message": "repository name not known to registry",
               "detail": {"name": "alpine"}
             }
           ]
         },
         "headers": {
           "content-type": "application/json; charset=utf-8",
           "docker-distribution-api-version": "registry/2.0",
           "x-content-type-options": "nosniff",
           "date": "Tue, 14 Jun 2022 06:47:22 GMT",
           "content-length": "114",
           "connection": "close"
         },
         "authorization": false
       }
 INFO: Repository finished (repository=jmueller42/renovate-docker-404)
       "durationMs": 4088
```
