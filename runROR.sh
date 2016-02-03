#!/bin/bash
docker run -d --name ROR\
       -p 80:80\
       -e APP_NAME=down \
       -e APP_REPO_URL="https://github.com/exocen/website.git"\
       -e APP_REPO_REF=down \
       -e RAILS_ENV=production \
       -e SECRET_KEY_BASE="28b6bb0f242f71064916fad6ae463fe91f5adc302222dfc02c348ae1941eaf82"\
 rorimage
