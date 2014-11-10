FROM ubuntu
MAINTAINER David Zumbrunnen <zumbrunnen@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get -y install curl libpq-dev git gnupg

RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
RUN \curl -sSL https://get.rvm.io | bash -s stable --ruby
RUN echo 'source /etc/profile.d/rvm.sh' >> /etc/bash.bashrc

ADD start_app /opt/start_app

EXPOSE 80

CMD ["/opt/start_passenger"]
