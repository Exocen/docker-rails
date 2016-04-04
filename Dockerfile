FROM exocen/ruby:latest
MAINTAINER Exo

RUN apt-get update

#Install imageMagic
RUN apt-get install -qq -y imagemagick

# Install nodejs
RUN apt-get install -qq -y nodejs

# Intall software-properties-common for add-apt-repository
RUN apt-get install -qq -y software-properties-common

# Install Nginx.
RUN add-apt-repository -y ppa:nginx/development
RUN apt-get update
<<<<<<< HEAD
RUN apt-get install -qq -y nginx-light
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf
RUN chown -R www-data:www-data /var/lib/nginx
# Add default nginx config
ADD nginx-sites.conf /etc/nginx/sites-enabled/default

# Install foreman
RUN gem install foreman
=======
RUN apt-get -y install curl libpq-dev git gnupg gawk g++ gcc make   \
      libreadline6-dev libyaml-dev libsqlite3-dev autoconf  \
            libgdbm-dev libncurses5-dev automake libtool bison pkg-config \
	          libffi-dev lsb-release nodejs ImageMagick libgmp-dev
>>>>>>> beabd0fd7f0a2ce56dc9d00e806752cc28c4285d

# Rails App directory
WORKDIR /app

# Add default unicorn config
ADD unicorn.rb /app/config/unicorn.rb

# Add default foreman config
ADD Procfile /app/Procfile

ENV RAILS_ENV production

CMD bundle exec rake assets:precompile && foreman start -f Procfile
