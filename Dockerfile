FROM ruby:2.7.8-slim

RUN apt update && apt install build-essential -y
RUN gem install bundler:2.4.15

WORKDIR /usr/src

COPY Gemfile /usr/src
COPY Gemfile.lock /usr/src

RUN bundle install

COPY app.rb /usr/src
COPY config.ru /usr/src
ADD views /usr/src/views

EXPOSE 9292

CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0"]