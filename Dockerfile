FROM ruby:3.1.2
ENV APP_ROOT /usr/src/app
RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y mariadb-client --no-install-recommends && rm -rf /var/lib/apt/lists/*
WORKDIR $APP_ROOT
COPY Gemfile* $APP_ROOT/
RUN gem install bundler && \
    bundle install
COPY . $APP_ROOT
