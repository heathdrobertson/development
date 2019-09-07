# Development Environment Container
**An Docker image to build a development environment.**

- NeoVim
- Powerline


A Bash prompt within a container:
![Screenshot 1](https://heathdrobertson.github.io/images/dev-screeny-1.png)


NeoVim running in the container with Docker volume access to a host directory and access to 2 additional container volumes, Python and Haskell:
![Screenshot 2](https://heathdrobertson.github.io/images/dev-screeny-2.png)

**This is a work in progress, setup instructions and cheat sheet coming soon.**
My contact info is below if you have questions or suggestions.

- Python3.7
- Haskell Stack Tool
- Webassembly & Rust
- Assorted Machine Learning Tools

## Getting Started

1. $ `cd` into your favorite Docker images build directory.
1. $ `git clone git@github.com:heathdrobertson/development.git`
1. $ `cd development`
    1. You can remove my info from the *Dockerfile* and change my name in the next command if you would like.
1. $ `docker build --rm --build-arg USER=$(id -un) --build-arg USER_ID=$(ID -u) --build-arg USER_GID=$(id -g) -t heathdrobertson/development:latest .`
1. If you don't yet or would like to gain a further understanding of the Dockerfile and command above, please checkout my video series on [Youtube](https://www.youtube.com/channel/UCG4Av0xeLAD-hJCQHMrYqtA).
___

![ToiletHill Logo](https://heathdrobertson.github.io/images/logo/ToiletHill.png)
### Heath Robertson
- Email: CodeHappens@ToiletHill.io
- Github: [HeathDRobertson](https://github.com/heathdrobertson)
- Dockerhub: [HeathDRobertson](https://hub.docker.com/u/heathdrobertson)
- Twitter: [@HeathDRobertson](https://twitter.com/HeathDRobertson)
- Telegram: [@HeathDRobertson](https://t.me/heathdrobertson)
