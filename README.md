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

Public key authentication
```
docker run --rm -e ARUKAS_JSON_API_TOKEN="69a89479-71d8-47b6-be6d-55be25341c3a" -e ARUKAS_JSON_API_SECRET=<API_TOKEN> -e AUTHORIZED_KEY=<SECRET_KEY> arukasio/arukas run --instances=3 --mem=512 --ports=22:tcp peco8/quickstart-ubuntu
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
