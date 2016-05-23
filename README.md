# quickstart-ubuntu
Getting start in Arukas wih Ubuntu

## Running locally

##### Public key authentication
```
$ git clone git@github.com:peco8/quickstart-ubuntu.git
$ cd quickstart-ubuntu
$ docker build --no-cache --tag quickstart-ubuntu . 
$ docker run -d -e AUTHORIZED_KEY="`cat ~/.ssh/id_rsa.pub`" -P quickstart-ubuntu
$ ssh root@192.168.59.103 -p $(docker port `docker ps -q -n=1` | cut -d':' -f2)
```

##### username/password
If you want to use your original password instead of the default one: "root", you can
set the environment variable ROOT_PWD to your specific password when running the container:
```
$ git clone git@github.com:peco8/quickstart-ubuntu.git
$ cd quickstart-ubuntu
$ docker build --no-cache --tag quickstart-ubuntu .
$ docker run -d -e ROOT_PWD="ubuntu" -P quickstart-ubuntu
$ ssh root@192.168.59.103 -p $(docker port `docker ps -q -n=1` | cut -d':' -f2)
```


## Deploying to Arukas

[Install the Arukas CLI](https://github.com/arukasio/cli),

or If you have docker installed already,

##### Public key authentication
```
$ docker run --rm -e ARUKAS_JSON_API_TOKEN=<API_TOKEN> -e ARUKAS_JSON_API_SECRET=<SECRET_KEY> --envs AUTHORIZED_KEY="`cat ~/.ssh/id_rsa.pub`" arukasio/arukas run --instances=1 --mem=512 --ports=22:tcp peco8/quickstart-ubuntu
```
##### username/password
```
$ docker run --rm -e ARUKAS_JSON_API_TOKEN=<API_TOKEN> -e ARUKAS_JSON_API_SECRET=<SECRET_KEY> arukasio/arukas run --instances=1 --mem=512 --ports=22:tcp peco8/quickstart-ubuntu
```

## Author

* Toshiki Inami (<t-inami@arukas.io>)

## License

This project is licensed under the terms of the MIT license.

**Continue with this tutorial [here](/).**
