# Joy Tech Test README

requires ruby-3.2.2 and a local instance of pg. .

this is a stripped back rails app, containing only a model & service object layer.

Unit tests within the spec folder demonstrate the requirements of the test.

## setup

`docker-compose build`

`docker compose run --rm api bundle exec rake db:setup`

## run tests

`docker compose run --rm bundle exec rspec`

