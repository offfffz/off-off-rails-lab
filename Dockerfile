FROM ruby:2.3.1-alpine
WORKDIR /usr/src/app

RUN apk add --update \
  build-base \
  libxml2-dev \
  libxslt-dev \
  postgresql-dev \
  nodejs \
  && rm -rf /var/cache/apk/*

RUN gem install bundler rails

COPY ./lab/Gemfile /usr/src/app/Gemfile
RUN bundle install

COPY ./lab /usr/src/app

CMD ["rails", "server", "-p", "3000"]

ENV RAILS_ENV=production
