# quickstart-ubuntu
Getting start in Arukas wih Ubuntu

### LOCAL

Public key authentication
```
$ docker build --no-cache .
$ docker run -d -e AUTHORIZED_KEY="`cat ~/.ssh/id_rsa.pub`" -p 49513:22 a90b0e9160d0
$ ssh root@192.168.59.103 -p 49613
```

username/password
```
$ docker build --no-cache .
$ docker run -d -p 49513:22 a90b0e9160d0
$ ssh root@192.168.59.103 -p 49513
```

## Deploying to Arukas

[Install the Arukas CLI.](https://github.com/arukasio/cli)

or If you have docker installed already,
```
docker run --rm -e ARUKAS_JSON_API_TOKEN=<APIT_OKEN> -e ARUKAS_JSON_API_SECRET=<SECRET_KEY> arukasio/arukas run --instances=3 --mem=512 -ports=80:tcp peco8/quickstart-php
```
## Author

* Toshiki Inami (<t-inami@arukas.io>)

## License

This project is licensed under the terms of the MIT license.

**Continue with this tutorial [here](/).**
