MAINTAINERNAME=exo
IMAGENAME=rorimage
CONTAINERNAME=ROR
REPONAME=down

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
       -e POSTGRES_USERNAME=username \
			 -e POSTGRES_PASSWORD=password \
			 -e POSTGRES_IP=ip \
 $(MAINTAINERNAME)/$(IMAGENAME)
