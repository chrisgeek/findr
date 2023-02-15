FROM ruby:2.7.1

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \ && apt-get install -y nodejs postgresql-client

RUN mkdir /findr

WORKDIR /findr

COPY Gemfile /findr/Gemfile

COPY Gemfile.lock /findr/Gemfile.lock

RUN bundle install –full-index

COPY . /findr

COPY entrypoint.sh /usr/bin/

RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]

