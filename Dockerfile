FROM ruby:2.7.1
RUN apt-get update && apt-get install -y \
  curl \
  build-essential \
  libpq-dev &&\
  curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install -y nodejs yarn vim

RUN mkdir /findr
WORKDIR /findr
COPY Gemfile /findr/Gemfile
COPY Gemfile.lock /findr/Gemfile.lock
COPY package.json /findr/package.json
COPY yarn.lock /findr/yarn.lock
RUN bundle install
RUN yarn install --check-files
COPY . /findr

EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
