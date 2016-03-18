MAINTAINERNAME=exo
IMAGENAME=rorimage
CONTAINERNAME=ROR
REPONAME=master

all: build run

build:
	docker build -t $(MAINTAINERNAME)/$(IMAGENAME) .

run:
	docker stop $(CONTAINERNAME)
	docker rm $(CONTAINERNAME)
	docker run -d --name $(CONTAINERNAME)\
       -p 80:80\
       -e APP_NAME=$(REPONAME) \
       -e APP_REPO_URL="https://github.com/exocen/website.git"\
       -e APP_REPO_REF=$(REPONAME) \
       -e RAILS_ENV=production \
       -e POSTGRES_USERNAME=postgres \
			 -e POSTGRES_PASSWORD=zazaza \
			 -e POSTGRES_IP=172.17.0.2 \
 $(MAINTAINERNAME)/$(IMAGENAME)
