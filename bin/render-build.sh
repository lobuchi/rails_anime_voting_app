#!/usr/bin/env bash

set -o errexit

bundle install
bin/rails assets:precompile
bin/rails assets:clean

# db:prepare loads primary, queue, cache, and cable schemas on a single Postgres database
bin/rails db:prepare
