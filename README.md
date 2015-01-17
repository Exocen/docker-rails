docker-rails
============

A simple Docker Image for running Ruby on Rails applications with Passenger. It checks for `.ruby-version` and `.ruby-gemset` files in the app's root directory and installs the desired Ruby version.

## Starting The Container

### Example

```
docker run --name foo_app \
    -e APP_NAME=foo \
    -e APP_REPO_URL="https://githubsecrettoken@github.com/organization/foo.git" \
    -e APP_REPO_REF=branchxy \
    -e RAILS_ENV=production \
    -e DATABASE_URL="postgres://docker:docker@dbserver.internal/foo_production" \
    -e SECRET_KEY_BASE="yoursecretkeybaseforproduction"
    zumbrunnen/rails
```

The environment variables needed are:

 * `APP_NAME` - Your app's name
 * `APP_REPO_URL` - A Git repo to clone the source from
 * `APP_REPO_REF` - A Git branch or tag to checkout (optional, defaults to master branch)
 * `RAILS_ENV` - The Ruby on Rails environment (optional, defaults to 'production')
 * `DATABASE_URL` - Database connection information
 * `SECRET_KEY_BASE` - Session storage key for this environment

When the container starts, the source will be cloned into /srv/$APP_NAME, the necessary gems will be installed, then the DB will be prepared (created and schema.rb loaded), and eventually, Passenger will be started in standalone mode. See [the start script](../master/start_app).

## Customization

To execute additional commands, place your scripts in `deploy` directory in your repo. All the .sh files in there will be run before Passenger starts.
