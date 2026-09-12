#!/usr/bin/env bash

set -o errexit

bundle install
bin/rails assets:precompile
bin/rails assets:clean

# Loads app tables plus Solid Cache, Queue, and Cable schemas into Supabase Postgres
bin/rails db:prepare
