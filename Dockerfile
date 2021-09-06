FROM ruby:alpine

RUN apk add --no-cache build-base \
  bash \
  postgresql-dev \
  tzdata \
  nodejs \
  yarn

COPY Gemfile* /usr/src/app/  
WORKDIR /usr/src/app
RUN bundle install           

COPY . /usr/src/app/