# quickstart-ubuntu
Getting start in Arukas wih Ubuntu

### LOCAL

Public key authentication
```
$ docker build --no-cache .
$ docker run -d -e AUTHORIZED_KEY="`cat ~/.ssh/id_rsa.pub`" -P a90b0e9160d0
$ ssh root@192.168.59.103 -p 32788
```

username/password
```
$ docker build --no-cache .
$ docker run -d -P a90b0e9160d0
$ ssh root@192.168.59.103 -p 32788
```

### TODO
- [ ] Arukas CLI
- [ ] Multiple Public keys handling
