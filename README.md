# quickstart-ubuntu
Getting start in Arukas wih Ubuntu

```
$ docker build --no-cache .
$ docker run -d -e AUTHORIZED_KEYS="`cat ~/.ssh/id_rsa.pub`" -P a90b0e9160d0
$ ssh root@192.168.59.103 -p 32788
```
