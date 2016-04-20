# Rails(+ Nginx, Unicorn) Dockerfile

## Usage

* Create `Dockerfile` to your project and paste below code.

```
# Dockerfile
FROM exocen/docker-rails
MAINTAINER Exocen

# Add here your preinstall lib(e.g. imagemagick, mysql lib, pg lib, ssh config)

EXPOSE 80
```

* Add `unicorn` gem(maybe uncomment `gem 'unicorn'` in `Gemfile`)

## Build and run docker

```

# build your dockerfile
$ docker build -t your/project .

# run container
$ docker run -d -p 80:80 -e SECRET_KEY_BASE=secretkey your/project


```


# Custom pre-install lib

if your rails app required lib like imagemagick(or mysql) you must install that before `Install Rails App` section

## Install imagemagick

```
RUN apt-get -qq -y install libmagickwand-dev imagemagick
```

## Install MySQL(for mysql, mysql2 gem)

```
RUN apt-get install -qq -y mysql-server mysql-client libmysqlclient-dev
```

## Install PostgreSQL lib(for pg gem)

```
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" > /etc/apt/sources.list.d/pgdg.list && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --force-yes libpq-dev
```

## Access bitbucket private repository

```
RUN mkdir /root/.ssh/
ADD id_rsa /root/.ssh/id_rsa
RUN touch /root/.ssh/known_hosts
RUN ssh-keyscan -t rsa bitbucket.org >> /root/.ssh/known_hosts
```

Copy your `~/.ssh/id_rsa` to `id_rsa` for bitbucket connection. if you don't need to bitbucket connection, create blank `id_rsa`. don't forget add `id_rsa` to `.gitignore`


# Customize Nginx, Unicorn, foreman config

## Nginx

```
# your Dockerfile
...
ADD config/your-custom-nginx.conf /etc/nginx/sites-enabled/default
...
```

## Unicorn

place your unicorn config to `config/unicorn.rb`


## foreman

place your Procfile to app root
