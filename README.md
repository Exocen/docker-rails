docker-rails
============

A simple Docker Image for running Ruby on Rails Rails applications with Passenger.

## Starting The Container

`docker run -d -name <containername> -link <dbcontainer>:db -e APP_NAME=<appname> zumbrunnen/rails`

`docker run --name <appname> -e APP_NAME=<app_name> -e ... zumbrunnen/rails`

The environment variables needed are:

 * `APP_NAME` - e.g. "superapp"
 * `APP_REPO_URL` - A Git repo to clone the source from, e.g. "https://githubsecrettoken@github.com/organization/project.git"
 * `RAILS_ENV` - e.g. "production"
 * `DATABASE_URL` - In the form: "dbtype://user:password@hostname/dbname", e.g. "postgres://docker:docker@dbserver.lan/project_production"

When the container starts, the source will be cloned into /srv/$APP_NAME, the necessary gems will be installed, then the DB will be prepared (created and migrated), and eventually, Passenger will be started in standalone mode. See [the start script](../master/start_app).
