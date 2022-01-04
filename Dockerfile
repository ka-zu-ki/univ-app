FROM ruby:2.6.6

ENV APP_ROOT /app

ENV LANG C.UTF-8

RUN mkdir ${APP_ROOT}

WORKDIR ${APP_ROOT}

RUN apt-get update -qq && \
    apt-get install -y \
    build-essential \
    libpq-dev \
    postgresql-client

COPY Gemfile /${APP_ROOT}/Gemfile
COPY Gemfile.lock /${APP_ROOT}/Gemfile.lock

RUN gem install bundler && \
    bundle install --jobs=4 --retry=3

COPY . ${APP_ROOT}

EXPOSE 3000
