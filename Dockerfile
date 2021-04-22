# Base image
FROM ruby:2.6.3

# Working dir
RUN mkdir /lita
WORKDIR /lita

# Installing dependicies
ADD Gemfile* /lita/
RUN gem install bundler
RUN bundle config set --local without 'development test'
RUN bundle install

# For the glory of emojis
ENV LANG=C.UTF-8

# Run lita
CMD ln -s k8s_config/lita_config.rb lita_config.rb && bundle exec lita
