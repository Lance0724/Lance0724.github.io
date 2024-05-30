FROM ruby:3.3-alpine

RUN apk update && apk add --no-cache \
    build-base

RUN gem install jekyll bundler

# docker build -t jekyll .

# docker run --rm -it --volume="$PWD:/home/website" -p 0.0.0.0:4000:4000 jekyll ash

# docker run -it --volume="$PWD:/home/website" -p 4000:4000 -h RS-PF2YYCZ1 --name jtest -e JEKYLL_ENV=production jekyll ash -c "cd /home/website && bundle install && bundle exec jekyll s"

# bundle exec jekyll serve

# https://github.com/thedevslot/WhatATheme.git
