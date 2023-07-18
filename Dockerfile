FROM ruby:3.2.2

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /joy-tech-test
COPY Gemfile /joy-tech-test/Gemfile
COPY Gemfile.lock /joy-tech-test/Gemfile.lock
RUN bundle install

CMD ["rails", "server", "-b", "0.0.0.0"]
