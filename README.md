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

<details>
  <summary>INFO output</summary>
  
```
 INFO: No docker daemon found
 INFO: Repository started (repository=maltemorgenstern/renovate-reproduction-18206)
       "renovateVersion": "32.229.0"
 INFO: Cannot ensure issue because issues are disabled in this repository (repository=maltemorgenstern/renovate-reproduction-18206)
 INFO: Dependency extraction complete (repository=maltemorgenstern/renovate-reproduction-18206, baseBranch=main)
       "stats": {
         "managers": {"dockerfile": {"fileCount": 1, "depCount": 1}},
         "total": {"fileCount": 1, "depCount": 1}
       }
 WARN: Host error (repository=maltemorgenstern/renovate-reproduction-18206)
       "hostType": undefined,
       "packageName": undefined,
       "err": {
         "name": "HTTPError",
         "code": "ERR_NON_2XX_3XX_RESPONSE",
         "timings": {
           "start": 1665396032926,
           "socket": 1665396032927,
           "lookup": 1665396032927,
           "connect": 1665396032928,
           "upload": 1665396032928,
           "response": 1665396033175,
           "end": 1665396033177,
           "abort": 1665396033179,
           "phases": {
             "wait": 1,
             "dns": 0,
             "tcp": 1,
             "request": 0,
             "firstByte": 247,
             "download": 2,
             "total": 253
           }
         },
         "message": "Response code 500 (Internal Server Error)",
         "stack": "HTTPError: Response code 500 (Internal Server Error)\n    at Request.<anonymous> (/usr/src/app/node_modules/got/dist/source/as-promise/index.js:118:42)\n    at processTicksAndRejections (node:internal/process/task_queues:96:5)",
         "options": {
           "headers": {
             "user-agent": "RenovateBot/32.229.0 (https://github.com/renovatebot/renovate)",
             "accept": "application/vnd.docker.distribution.manifest.list.v2+json, application/vnd.docker.distribution.manifest.v2+json, application/vnd.oci.image.manifest.v1+json, application/vnd.oci.image.index.v1+json",
             "accept-encoding": "gzip, deflate, br"
           },
           "url": "http://localhost:5000/v2/alpine/manifests/sha256:69463fdff1f025c908939e86d4714b4d5518776954ca627cbeff4c74bcea5b22",
           "hostType": "docker",
           "username": "",
           "password": "",
           "method": "HEAD",
           "http2": false
         },
         "response": {
           "statusCode": 500,
           "statusMessage": "Internal Server Error",
           "body": "",
           "headers": {
             "content-type": "application/json; charset=utf-8",
             "docker-distribution-api-version": "registry/2.0",
             "x-content-type-options": "nosniff",
             "date": "Mon, 10 Oct 2022 10:00:33 GMT",
             "content-length": "289",
             "connection": "close"
           },
           "httpVersion": "1.1"
         }
       }
 INFO: External host error causing abort - skipping (repository=maltemorgenstern/renovate-reproduction-18206)
 INFO: Repository finished (repository=maltemorgenstern/renovate-reproduction-18206)
       "durationMs": 15562
```
</details>

One can also enable debug output by adding `-e LOG_LEVEL=debug`:

```sh
# run renovate
docker run \
  --rm \
  -v $PWD/renovate.json:/usr/src/app/renovate.json \
  -e LOG_LEVEL=debug \
  -e RENOVATE_TOKEN=YOUR_TOKEN_HERE \
  -e RENOVATE_REPOSITORIES="maltemorgenstern/renovate-reproduction-18206" \
  --network host \
  -it \
  renovate/renovate:32.229.0-slim
```

<details>
  <summary>DEBUG output</summary>
  
```
DEBUG: Using RE2 as regex engine
DEBUG: Parsing configs
DEBUG: Checking for config file in /usr/src/app/config.js
DEBUG: No config file found on disk - skipping
DEBUG: File config
       "config": {}
DEBUG: CLI config
       "config": {}
DEBUG: Env config
       "config": {
         "hostRules": [],
         "binarySource": "docker",
         "token": "***********",
         "repositories": ["maltemorgenstern/renovate-reproduction-18206"]
       }
DEBUG: Combined config
       "config": {
         "hostRules": [],
         "binarySource": "docker",
         "token": "***********",
         "repositories": ["maltemorgenstern/renovate-reproduction-18206"]
       }
DEBUG: Found valid git version: 2.38.0
DEBUG: Using default github endpoint: https://api.github.com/
DEBUG: No concurrency limits
       "host": "api.github.com"
DEBUG: GitHub 404
       "url": "https://api.github.com/user/emails"
DEBUG: Cannot read user/emails endpoint on GitHub to retrieve gitAuthor
DEBUG: Platform config
       "platformConfig": {
         "hostType": "github",
         "endpoint": "https://api.github.com/",
         "isGHApp": false,
         "isGhe": false,
         "userDetails": {"username": "maltemorgenstern", "name": "Malte Morgenstern"},
         "userEmail": null
       },
       "renovateUsername": "maltemorgenstern"
DEBUG: Adding token authentication for api.github.com to hostRules
DEBUG: Using baseDir: /tmp/renovate
DEBUG: Using cacheDir: /tmp/renovate/cache
DEBUG: Using containerbaseDir: /tmp/renovate/cache/containerbase
DEBUG: Initializing Renovate internal cache into /tmp/renovate/cache/renovate/renovate-cache-v1
DEBUG: Commits limit = null
DEBUG: Setting global hostRules
DEBUG: Adding token authentication for api.github.com to hostRules
DEBUG: validatePresets()
DEBUG: Reinitializing hostRules for repo
DEBUG: Clearing hostRules
DEBUG: Adding token authentication for api.github.com to hostRules
 INFO: No docker daemon found
 INFO: Repository started (repository=maltemorgenstern/renovate-reproduction-18206)
       "renovateVersion": "32.229.0"
DEBUG: Using localDir: /tmp/renovate/repos/github/maltemorgenstern/renovate-reproduction-18206 (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: PackageFiles.clear() - Package files deleted (repository=maltemorgenstern/renovate-reproduction-18206)
       "baseBranches": []
DEBUG: initRepo("maltemorgenstern/renovate-reproduction-18206") (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: No concurrency limits (repository=maltemorgenstern/renovate-reproduction-18206)
       "host": "api.github.com"
DEBUG: maltemorgenstern/renovate-reproduction-18206 default branch = main (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using personal access token for git init (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Resetting npmrc (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: detectSemanticCommits() (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Initializing git repository into /tmp/renovate/repos/github/maltemorgenstern/renovate-reproduction-18206 (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Performing blobless clone (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: git clone completed (repository=maltemorgenstern/renovate-reproduction-18206)
       "durationMs": 1074
DEBUG: latest repository commit (repository=maltemorgenstern/renovate-reproduction-18206)
       "latestCommit": {
         "hash": "f6208ba0ae8af6bdbb8c9c64a5f951d7168cfb5c",
         "date": "2022-10-10T12:00:00+02:00",
         "message": "enable renovate for forks",
         "refs": "HEAD -> main, origin/main, origin/HEAD",
         "body": "",
         "author_name": "maltemorgenstern",
         "author_email": "65773564+maltemorgenstern@users.noreply.github.com"
       }
DEBUG: getCommitMessages (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Semantic commits detection: unknown (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: No semantic commits detected (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: checkOnboarding() (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: isOnboarded() (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: findFile(renovate.json) (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Config file exists (repository=maltemorgenstern/renovate-reproduction-18206)
       "fileName": "renovate.json"
 INFO: Cannot ensure issue because issues are disabled in this repository (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Repo is onboarded (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Found renovate.json config file (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Repository config (repository=maltemorgenstern/renovate-reproduction-18206)
       "fileName": "renovate.json",
       "config": {
         "$schema": "https://docs.renovatebot.com/renovate-schema.json",
         "extends": ["config:base", "docker:pinDigests"],
         "includeForks": true,
         "packageRules": [
           {"matchDatasources": ["docker"], "registryUrls": ["http://localhost:5000"]}
         ]
       }
DEBUG: migrateAndValidate() (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: No config migration necessary (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: massaged config (repository=maltemorgenstern/renovate-reproduction-18206)
       "config": {
         "$schema": "https://docs.renovatebot.com/renovate-schema.json",
         "extends": ["config:base", "docker:pinDigests"],
         "includeForks": true,
         "packageRules": [
           {"matchDatasources": ["docker"], "registryUrls": ["http://localhost:5000"]}
         ]
       }
DEBUG: migrated config (repository=maltemorgenstern/renovate-reproduction-18206)
       "config": {
         "$schema": "https://docs.renovatebot.com/renovate-schema.json",
         "extends": ["config:base", "docker:pinDigests"],
         "includeForks": true,
         "packageRules": [
           {"matchDatasources": ["docker"], "registryUrls": ["http://localhost:5000"]}
         ]
       }
DEBUG: Setting hostRules from config (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Found repo ignorePaths (repository=maltemorgenstern/renovate-reproduction-18206)
       "ignorePaths": [
         "**/node_modules/**",
         "**/bower_components/**",
         "**/vendor/**",
         "**/examples/**",
         "**/__tests__/**",
         "**/test/**",
         "**/tests/**",
         "**/__fixtures__/**"
       ]
DEBUG: No concurrency limits (repository=maltemorgenstern/renovate-reproduction-18206)
       "host": "api.github.com"
DEBUG: No vulnerability alerts found (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: No vulnerability alerts found (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: findIssue(Dependency Dashboard) (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: No baseBranches (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: extract() (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Setting current branch to main (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: latest commit (repository=maltemorgenstern/renovate-reproduction-18206)
       "branchName": "main",
       "latestCommitDate": "2022-10-10T12:00:00+02:00"
DEBUG: Using file match: (^|/)tasks/[^/]+\.ya?ml$ for manager ansible (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)requirements\.ya?ml$ for manager ansible-galaxy (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)galaxy\.ya?ml$ for manager ansible-galaxy (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)\.tool-versions$ for manager asdf (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: azure.*pipelines?.*\.ya?ml$ for manager azure-pipelines (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)batect(-bundle)?\.yml$ for manager batect (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)batect$ for manager batect-wrapper (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)WORKSPACE(|\.bazel)$ for manager bazel (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: \.bzl$ for manager bazel (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|\/)\.bazelversion$ for manager bazelisk (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)\.?bitbucket-pipelines\.ya?ml$ for manager bitbucket-pipelines (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: buildkite\.ya?ml for manager buildkite (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: \.buildkite/.+\.ya?ml$ for manager buildkite (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)Gemfile$ for manager bundler (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: \.cake$ for manager cake (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)Cargo\.toml$ for manager cargo (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)\.circleci/config\.yml$ for manager circleci (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)cloudbuild\.ya?ml for manager cloudbuild (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)Podfile$ for manager cocoapods (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)([\w-]*)composer\.json$ for manager composer (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)conanfile\.(txt|py)$ for manager conan (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)(?:deps|bb)\.edn$ for manager deps-edn (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)(?:docker-)?compose[^/]*\.ya?ml$ for manager docker-compose (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/|\.)Dockerfile$ for manager dockerfile (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)Dockerfile[^/]*$ for manager dockerfile (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)\.drone\.yml$ for manager droneci (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)fleet\.ya?ml for manager fleet (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)flux-system/gotk-components\.yaml$ for manager flux (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|\/)\.fvm\/fvm_config\.json$ for manager fvm (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)\.gitmodules$ for manager git-submodules (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: ^(workflow-templates|\.github\/workflows)\/[^/]+\.ya?ml$ for manager github-actions (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|\/)action\.ya?ml$ for manager github-actions (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: \.gitlab-ci\.yml$ for manager gitlabci (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: \.gitlab-ci\.yml$ for manager gitlabci-include (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)go\.mod$ for manager gomod (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: \.gradle(\.kts)?$ for manager gradle (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|\/)gradle\.properties$ for manager gradle (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|\/)gradle\/.+\.toml$ for manager gradle (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: \.versions\.toml$ for manager gradle (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)gradle/wrapper/gradle-wrapper\.properties$ for manager gradle-wrapper (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)requirements\.yaml$ for manager helm-requirements (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)values\.yaml$ for manager helm-values (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)helmfile\.yaml$ for manager helmfile (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)Chart\.yaml$ for manager helmv3 (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)bin/hermit$ for manager hermit (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: ^Formula/[^/]+[.]rb$ for manager homebrew (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: \.html?$ for manager html (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)plugins\.(txt|ya?ml)$ for manager jenkins (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)jsonnetfile\.json$ for manager jsonnet-bundler (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: ^.+\.main\.kts$ for manager kotlin-script (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)kustomization\.ya?ml$ for manager kustomize (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)project\.clj$ for manager leiningen (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/|\.)pom\.xml$ for manager maven (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: ^(((\.mvn)|(\.m2))/)?settings\.xml$ for manager maven (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)package\.js$ for manager meteor (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|\/)Mintfile$ for manager mint (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)mix\.exs$ for manager mix (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)\.node-version$ for manager nodenv (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)package\.json$ for manager npm (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: \.(?:cs|fs|vb)proj$ for manager nuget (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: \.(?:props|targets)$ for manager nuget (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|\/)dotnet-tools\.json$ for manager nuget (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|\/)global\.json$ for manager nuget (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)\.nvmrc$ for manager nvm (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)([\w-]*)requirements\.(txt|pip)$ for manager pip_requirements (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)setup\.py$ for manager pip_setup (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)Pipfile$ for manager pipenv (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)pyproject\.toml$ for manager poetry (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)\.pre-commit-config\.yaml$ for manager pre-commit (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)pubspec\.ya?ml$ for manager pub (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|\/)Puppetfile$ for manager puppet (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)\.python-version$ for manager pyenv (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)\.ruby-version$ for manager ruby-version (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: \.sbt$ for manager sbt (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: project/[^/]*.scala$ for manager sbt (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)setup\.cfg$ for manager setup-cfg (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)Package\.swift for manager swift (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: \.tf$ for manager terraform (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)\.terraform-version$ for manager terraform-version (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)terragrunt\.hcl$ for manager terragrunt (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)\.terragrunt-version$ for manager terragrunt-version (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: \.tflint\.hcl$ for manager tflint-plugin (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: ^\.travis\.yml$ for manager travis (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|/)\.vela\.ya?ml$ for manager velaci (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Using file match: (^|\/)\.woodpecker[^/]*\.ya?ml$ for manager woodpecker (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Matched 1 file(s) for manager dockerfile: container/Dockerfile (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Found dockerfile package files (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Found 1 package file(s) (repository=maltemorgenstern/renovate-reproduction-18206)
 INFO: Dependency extraction complete (repository=maltemorgenstern/renovate-reproduction-18206, baseBranch=main)
       "stats": {
         "managers": {"dockerfile": {"fileCount": 1, "depCount": 1}},
         "total": {"fileCount": 1, "depCount": 1}
       }
DEBUG: No concurrency limits (repository=maltemorgenstern/renovate-reproduction-18206)
       "host": "localhost:5000"
DEBUG: Page Not Found (repository=maltemorgenstern/renovate-reproduction-18206)
       "apiCheckUrl": "http://localhost:5000/v2/alpine/tags/list?n=10000"
DEBUG: Retrying Tags for http://localhost:5000/alpine using library/ prefix (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: No registry auth required (repository=maltemorgenstern/renovate-reproduction-18206)
       "apiCheckUrl": "http://localhost:5000/v2/library/alpine/tags/list?n=10000"
DEBUG: getLabels(http://localhost:5000, alpine, latest) (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: getManifestResponse(http://localhost:5000, alpine, latest) (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: No registry auth required (repository=maltemorgenstern/renovate-reproduction-18206)
       "apiCheckUrl": "http://localhost:5000/v2/"
DEBUG: Docker Manifest is unknown (repository=maltemorgenstern/renovate-reproduction-18206)
       "err": {
         "name": "HTTPError",
         "code": "ERR_NON_2XX_3XX_RESPONSE",
         "timings": {
           "start": 1665396401600,
           "socket": 1665396401601,
           "lookup": 1665396401602,
           "connect": 1665396401603,
           "upload": 1665396401603,
           "response": 1665396401961,
           "end": 1665396401961,
           "phases": {
             "wait": 1,
             "dns": 1,
             "tcp": 1,
             "request": 0,
             "firstByte": 358,
             "download": 0,
             "total": 361
           }
         },
         "message": "Response code 404 (Not Found)",
         "stack": "HTTPError: Response code 404 (Not Found)\n    at Request.<anonymous> (/usr/src/app/node_modules/got/dist/source/as-promise/index.js:118:42)\n    at processTicksAndRejections (node:internal/process/task_queues:96:5)",
         "options": {
           "headers": {
             "user-agent": "RenovateBot/32.229.0 (https://github.com/renovatebot/renovate)",
             "accept": "application/vnd.docker.distribution.manifest.list.v2+json, application/vnd.docker.distribution.manifest.v2+json, application/vnd.oci.image.manifest.v1+json, application/vnd.oci.image.index.v1+json",
             "accept-encoding": "gzip, deflate, br"
           },
           "url": "http://localhost:5000/v2/alpine/manifests/latest",
           "hostType": "docker",
           "username": "",
           "password": "",
           "method": "GET",
           "http2": false
         },
         "response": {
           "statusCode": 404,
           "statusMessage": "Not Found",
           "body": "{\"errors\":[{\"code\":\"MANIFEST_UNKNOWN\",\"message\":\"manifest unknown\",\"detail\":{\"Tag\":\"latest\"}}]}\n",
           "headers": {
             "content-type": "application/json; charset=utf-8",
             "docker-distribution-api-version": "registry/2.0",
             "x-content-type-options": "nosniff",
             "date": "Mon, 10 Oct 2022 10:06:41 GMT",
             "content-length": "96",
             "connection": "close"
           },
           "httpVersion": "1.1"
         }
       },
       "registryHost": "http://localhost:5000",
       "dockerRepository": "alpine",
       "tag": "latest"
DEBUG: getDigest(http://localhost:5000, alpine, 3.16) (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: getManifestResponse(http://localhost:5000, alpine, sha256:69463fdff1f025c908939e86d4714b4d5518776954ca627cbeff4c74bcea5b22) (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: No registry auth required (repository=maltemorgenstern/renovate-reproduction-18206)
       "apiCheckUrl": "http://localhost:5000/v2/"
DEBUG: Aggregate error is thrown (repository=maltemorgenstern/renovate-reproduction-18206)
       "err": {
         "name": "AggregateError",
         "message": "\n    Error: external-host-error\n        at DockerDatasource.getManifestResponse (/usr/src/app/node_modules/renovate/lib/modules/datasource/docker/index.ts:449:15)\n        at processTicksAndRejections (node:internal/process/task_queues:96:5)\n        at DockerDatasource.getImageArchitecture (/usr/src/app/node_modules/renovate/lib/modules/datasource/docker/index.ts:622:32)\n        at /usr/src/app/node_modules/renovate/lib/util/cache/package/decorator.ts:78:20\n        at DockerDatasource.getDigest (/usr/src/app/node_modules/renovate/lib/modules/datasource/docker/index.ts:994:24)\n        at /usr/src/app/node_modules/renovate/lib/util/cache/package/decorator.ts:78:20\n        at lookupUpdates (/usr/src/app/node_modules/renovate/lib/workers/repository/process/lookup/index.ts:376:34)\n        at fetchDepUpdates (/usr/src/app/node_modules/renovate/lib/workers/repository/process/fetch.ts:58:15)\n        at /usr/src/app/node_modules/p-map/index.js:57:22",
         "stack": "AggregateError: \n    Error: external-host-error\n        at DockerDatasource.getManifestResponse (/usr/src/app/node_modules/renovate/lib/modules/datasource/docker/index.ts:449:15)\n        at processTicksAndRejections (node:internal/process/task_queues:96:5)\n        at DockerDatasource.getImageArchitecture (/usr/src/app/node_modules/renovate/lib/modules/datasource/docker/index.ts:622:32)\n        at /usr/src/app/node_modules/renovate/lib/util/cache/package/decorator.ts:78:20\n        at DockerDatasource.getDigest (/usr/src/app/node_modules/renovate/lib/modules/datasource/docker/index.ts:994:24)\n        at /usr/src/app/node_modules/renovate/lib/util/cache/package/decorator.ts:78:20\n        at lookupUpdates (/usr/src/app/node_modules/renovate/lib/workers/repository/process/lookup/index.ts:376:34)\n        at fetchDepUpdates (/usr/src/app/node_modules/renovate/lib/workers/repository/process/fetch.ts:58:15)\n        at /usr/src/app/node_modules/p-map/index.js:57:22\n    at next (/usr/src/app/node_modules/p-map/index.js:43:14)\n    at /usr/src/app/node_modules/p-map/index.js:67:7\n    at processTicksAndRejections (node:internal/process/task_queues:96:5)"
       }
DEBUG: Aggregate error is thrown (repository=maltemorgenstern/renovate-reproduction-18206)
       "err": {
         "name": "AggregateError",
         "message": "\n    Error: external-host-error\n        at DockerDatasource.getManifestResponse (/usr/src/app/node_modules/renovate/lib/modules/datasource/docker/index.ts:449:15)\n        at processTicksAndRejections (node:internal/process/task_queues:96:5)\n        at DockerDatasource.getImageArchitecture (/usr/src/app/node_modules/renovate/lib/modules/datasource/docker/index.ts:622:32)\n        at /usr/src/app/node_modules/renovate/lib/util/cache/package/decorator.ts:78:20\n        at DockerDatasource.getDigest (/usr/src/app/node_modules/renovate/lib/modules/datasource/docker/index.ts:994:24)\n        at /usr/src/app/node_modules/renovate/lib/util/cache/package/decorator.ts:78:20\n        at lookupUpdates (/usr/src/app/node_modules/renovate/lib/workers/repository/process/lookup/index.ts:376:34)\n        at fetchDepUpdates (/usr/src/app/node_modules/renovate/lib/workers/repository/process/fetch.ts:58:15)\n        at /usr/src/app/node_modules/p-map/index.js:57:22",
         "stack": "AggregateError: \n    Error: external-host-error\n        at DockerDatasource.getManifestResponse (/usr/src/app/node_modules/renovate/lib/modules/datasource/docker/index.ts:449:15)\n        at processTicksAndRejections (node:internal/process/task_queues:96:5)\n        at DockerDatasource.getImageArchitecture (/usr/src/app/node_modules/renovate/lib/modules/datasource/docker/index.ts:622:32)\n        at /usr/src/app/node_modules/renovate/lib/util/cache/package/decorator.ts:78:20\n        at DockerDatasource.getDigest (/usr/src/app/node_modules/renovate/lib/modules/datasource/docker/index.ts:994:24)\n        at /usr/src/app/node_modules/renovate/lib/util/cache/package/decorator.ts:78:20\n        at lookupUpdates (/usr/src/app/node_modules/renovate/lib/workers/repository/process/lookup/index.ts:376:34)\n        at fetchDepUpdates (/usr/src/app/node_modules/renovate/lib/workers/repository/process/fetch.ts:58:15)\n        at /usr/src/app/node_modules/p-map/index.js:57:22\n    at next (/usr/src/app/node_modules/p-map/index.js:43:14)\n    at /usr/src/app/node_modules/p-map/index.js:67:7\n    at processTicksAndRejections (node:internal/process/task_queues:96:5)"
       }
 WARN: Host error (repository=maltemorgenstern/renovate-reproduction-18206)
       "hostType": undefined,
       "packageName": undefined,
       "err": {
         "name": "HTTPError",
         "code": "ERR_NON_2XX_3XX_RESPONSE",
         "timings": {
           "start": 1665396405551,
           "socket": 1665396405552,
           "lookup": 1665396405552,
           "connect": 1665396405552,
           "upload": 1665396405552,
           "response": 1665396405791,
           "end": 1665396405792,
           "abort": 1665396405793,
           "phases": {
             "wait": 1,
             "dns": 0,
             "tcp": 0,
             "request": 0,
             "firstByte": 239,
             "download": 1,
             "total": 242
           }
         },
         "message": "Response code 500 (Internal Server Error)",
         "stack": "HTTPError: Response code 500 (Internal Server Error)\n    at Request.<anonymous> (/usr/src/app/node_modules/got/dist/source/as-promise/index.js:118:42)\n    at processTicksAndRejections (node:internal/process/task_queues:96:5)",
         "options": {
           "headers": {
             "user-agent": "RenovateBot/32.229.0 (https://github.com/renovatebot/renovate)",
             "accept": "application/vnd.docker.distribution.manifest.list.v2+json, application/vnd.docker.distribution.manifest.v2+json, application/vnd.oci.image.manifest.v1+json, application/vnd.oci.image.index.v1+json",
             "accept-encoding": "gzip, deflate, br"
           },
           "url": "http://localhost:5000/v2/alpine/manifests/sha256:69463fdff1f025c908939e86d4714b4d5518776954ca627cbeff4c74bcea5b22",
           "hostType": "docker",
           "username": "",
           "password": "",
           "method": "HEAD",
           "http2": false
         },
         "response": {
           "statusCode": 500,
           "statusMessage": "Internal Server Error",
           "body": "",
           "headers": {
             "content-type": "application/json; charset=utf-8",
             "docker-distribution-api-version": "registry/2.0",
             "x-content-type-options": "nosniff",
             "date": "Mon, 10 Oct 2022 10:06:45 GMT",
             "content-length": "289",
             "connection": "close"
           },
           "httpVersion": "1.1"
         }
       }
 INFO: External host error causing abort - skipping (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Repository result: external-host-error, status: onboarded, enabled: true, onboarded: true (repository=maltemorgenstern/renovate-reproduction-18206)
DEBUG: Repository timing splits (milliseconds) (repository=maltemorgenstern/renovate-reproduction-18206)
       "splits": {"init": 3114, "extract": 495},
       "total": 10410
DEBUG: Package cache statistics (repository=maltemorgenstern/renovate-reproduction-18206)
       "get": {"count": 5, "avgMs": 1, "medianMs": 1, "maxMs": 1},
       "set": {"count": 3, "avgMs": 23, "medianMs": 15, "maxMs": 47}
DEBUG: http statistics (repository=maltemorgenstern/renovate-reproduction-18206)
       "urls": {
         "http://localhost:5000/v2/ (GET,200)": 1,
         "http://localhost:5000/v2/alpine/manifests/latest (GET,404)": 1,
         "http://localhost:5000/v2/alpine/manifests/sha256:69463fdff1f025c908939e86d4714b4d5518776954ca627cbeff4c74bcea5b22 (HEAD,500)": 1,
         "http://localhost:5000/v2/alpine/tags/list (GET,404)": 1,
         "http://localhost:5000/v2/library/alpine/tags/list (GET,200)": 1,
         "https://api.github.com/graphql (POST,200)": 1
       },
       "hostStats": {
         "localhost": {"requestCount": 5, "requestAvgMs": 601, "queueAvgMs": 0},
         "api.github.com": {"requestCount": 1, "requestAvgMs": 269, "queueAvgMs": 1}
       },
       "totalRequests": 6
DEBUG: dns cache (repository=maltemorgenstern/renovate-reproduction-18206)
       "hosts": []
 INFO: Repository finished (repository=maltemorgenstern/renovate-reproduction-18206)
       "durationMs": 10410
DEBUG: Renovate exiting
```
</details>