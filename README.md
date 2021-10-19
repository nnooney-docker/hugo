# hugo

A Docker environment for developing Hugo websites

## Images

This image gets published at a regular frequency to the
[GitHub Container Registry](https://github.com/nnooney-docker/hugo/pkgs/container/hugo)
via a [GitHub action](.github/workflows/main.yml).

## Usage

Use this with VS Code's remote container development support. You need to add
the following files to your git repo to use this image for development:

```Dockerfile
# .devcontainer/Dockerfile
FROM ghcr.io/nnooney-docker/hugo:main
```

```json
// .devcontainer/devcontainer.json
{
  "name": "My Container",
  "build": {
    "dockerfile": "Dockerfile"
  },
  "settings": {},
  "extensions": [],
  "remoteUser": "developer"
}
```

Then you can use the command "Clone Repository in Container Volume" and voilà!
You clone the repository into a fresh instance of this container.

## Maintenance

### Versions

Most of the software uses the latest package available from Debian, with some
exceptions described below.

This Dockerfile includes [nvm](https://github.com/nvm-sh/nvm) and
[node](https://nodejs.org/) at specific versions, specified in the
`Dockerfile`.

```Dockerfile
ENV NVM_VERSION v0.39.0
ENV NODE_VERSION 16.11.1
```

They must be manually updated to pull the latest versions.
