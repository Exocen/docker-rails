docker-rails
============

A simple Docker Image for running Ruby on Rails Rails applications with Passenger.

## Starting The Container

`docker run -d -name <containername> -link <dbcontainer>:db -e APP_NAME=<appname> zumbrunnen/rails`

When the container starts, the necessary gems will be installed, then the DB will be prepared (created and migrated), and eventually, Passenger will be started in standalone mode. See [the start script](../master/start_app).

###Remarks
1. Link to a DBMS (`<dbcontainer>`) of your choice. It works with zumbrunnen/postgresql.
2. Override these default environment variables as needed (using `-e KEY=value`):
 * `APP_RUBY_VERSION=2.0.0`
 * `RAILS_ENV=production`
 * `DB_USERNAME=docker`
 * `DB_PASSWORD=docker`


## Database Connection
When linked to another container holdig your database, use something like this in `config/database.yml`:
```
production:
  adapter: postgresql
  database: appname_production
  username: <%= ENV['DB_USERNAME'] %>
  password: <%= ENV['DB_PASSWORD'] %>
  host: <%= ENV['DB_PORT_5432_TCP_ADDR'] %>
  port: <%= ENV['DB_PORT_5432_TCP_PORT'] %>
  pool: 5
  timeout: 5000
```

