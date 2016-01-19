## Devbox for golang projects using docker

### What you will get at the end

   * a docker container in which you can SSH in
   * go 1.5.2 installed, GOPATH configured etc., with the most popular tools (godep/ goimports / oracle / etc.) installed
   * (optional) Vim: with [vim-go](https://github.com/fatih/vim-go) / tagbar / YouCompleMe etc. and my vimrc (that you can easily replace by yours)
   * (optional) Zsh: with my zshrc (that you can replace by yours
   * (optional, not activated by default): Postgresql with a database and user precreated

### Screenshots

Shamelessy taken from vim-go:

![vim-go](https://dl.dropboxusercontent.com/u/174404/vim-go-2.png)


### Requirements

   * docker

### Creation

```bash
./create_docker.sh
```

### Usage

```bash
docker run -d -e HOST_USER_UID=$(id -u)  --name YOUR_PROJECT -p YOUR_LOCAL_PORT:22 go_vim_docker
```

so then you can `ssh` in your machine with port `YOUR_LOCAL_PORT`

### Extensive list of stuff installed:

TODO
