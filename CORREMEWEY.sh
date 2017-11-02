#!/bin/bash

sudo mysqld_safe
bundle install
rake db:migrate
rails server
