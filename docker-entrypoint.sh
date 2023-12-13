#!/bin/bash
set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

exec bundle exec rake db:create
exec bundle exec rake db:migrate
exec bundle exec rake db:seed
exec yarn build
exec yarn build:css

exec bundle exec "$@"
