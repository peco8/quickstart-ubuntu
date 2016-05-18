# quickstart-ubuntu
Getting start in Arukas wih Ubuntu

### LOCAL

Public key authentication
```
$ docker build --no-cache .
$ docker run -d -e AUTHORIZED_KEY="`cat ~/.ssh/id_rsa.pub`" -P a90b0e9160d0
$ ssh root@192.168.59.103 -p $(docker port `docker ps -q` | cut -d':' -f2)
```

username/password
```
$ docker build --no-cache .
$ docker run -d -P a90b0e9160d0
$ ssh root@192.168.59.103 -p $(docker port `docker ps -q` | cut -d':' -f2)
```

## Deploying to Arukas

[Install the Arukas CLI.](https://github.com/arukasio/cli)

or If you have docker installed already,

Public key authentication
```
docker run --rm -e ARUKAS_JSON_API_TOKEN=<API_TOKEN> -e ARUKAS_JSON_API_SECRET=<SECRET_KEY> -e AUTHORIZED_KEY="`cat ~/.ssh/id_rsa.pub`" arukasio/arukas run --instances=3 --mem=512 --ports=22:tcp peco8/quickstart-ubuntu
```
username/password
```
docker run --rm -e ARUKAS_JSON_API_TOKEN=<API_TOKEN> -e ARUKAS_JSON_API_SECRET=<SECRET_KEY> arukasio/arukas run --instances=3 --mem=512 --ports=22:tcp peco8/quickstart-ubuntu
```

## Author

* Toshiki Inami (<t-inami@arukas.io>)

## License

This project is licensed under the terms of the MIT license.

**Continue with this tutorial [here](/).**
