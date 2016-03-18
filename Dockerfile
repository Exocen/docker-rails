FROM ubuntu:latest
MAINTAINER Exo

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get -y install curl libpq-dev git gnupg gawk g++ gcc make   \
      libreadline6-dev libyaml-dev libsqlite3-dev sqlite3 autoconf  \
            libgdbm-dev libncurses5-dev automake libtool bison pkg-config \
	          libffi-dev lsb-release nodejs ImageMagick libgmp-dev

RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
RUN \curl -sSL https://get.rvm.io | bash -s stable --ruby
RUN echo "gem: --no-rdoc --no-ri" > ~/.gemrc

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD start_app /opt/start_app

EXPOSE 80

CMD ["/opt/start_app"]
