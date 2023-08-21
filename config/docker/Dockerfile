FROM ruby:3.2.2-bullseye

RUN apt-get update -qq && apt-get install -y wget build-essential libpq-dev postgresql-client

# Install Chrome for testing
RUN apt-get -y install chromium

# Install Yarn
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g yarn

# Install libvips
RUN apt-get -yqq install libvips

WORKDIR /app

RUN gem install bundler -v 2.4.15

COPY Gemfile Gemfile.lock ./
COPY package.json yarn.lock ./

RUN bundle instal
RUN yarn install --pure-lockfile

COPY . .

RUN bundle exec rails db:setup

CMD ["bin/rails", "server", "-b", "0.0.0.0"]
