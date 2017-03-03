# docker-ubuntu-mate-desktop-nomachine
Ubuntu XFCE4 with NoMachine remote access

# How to run
## Build

```
git clone https://github.com/adamburmister/docker-ubuntu-nomachine.git
cd docker-ubuntu-nomachine
docker build -t=docker-ubuntu-nomachine .
```
## Docker pull command
```
docker pull docker-ubuntu-nomachine
```

## Usage

```
docker run -d -p 4000:4000 --name desktop --cap-add=SYS_PTRACE docker-ubuntu-nomachine
```

## Connect to the container

Download the NoMachine client from: https://www.nomachine.com/download, install the client, create a new connection to your public ip, port 4000, NX protocol, use password for authentication (user: nomachine password: nomachine | change Dockerfile to use your own password)
