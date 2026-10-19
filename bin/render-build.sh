#!/usr/bin/env bash
set -o errexit

bundle install
bundle exec rails assets:precompile
mkdir -p public/assets
cp app/assets/stylesheets/application.css public/assets/application.css
bundle exec rails db:migrate
bundle exec rails db:seed
