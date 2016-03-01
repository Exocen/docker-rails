MAINTAINERNAME=exo
IMAGENAME=rorimage
CONTAINERNAME=ROR

all: build run

build:
	docker build -t $(MAINTAINERNAME)/$(IMAGENAME) .

run:
	-docker stop $(CONTAINERNAME)
	-docker rm $(CONTAINERNAME)
	docker run -d --name $(CONTAINERNAME)\
       -p 80:80\
       -e APP_NAME=down \
       -e APP_REPO_URL="https://github.com/exocen/website.git"\
       -e APP_REPO_REF=down \
       -e RAILS_ENV=production \
       -e SECRET_KEY_BASE="28b6bb0f242f71064916fad6ae463fe91f5adc302222dfc02c348ae1941eaf82"\
 $(MAINTAINERNAME)/$(IMAGENAME)
