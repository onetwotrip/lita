# Base image
FROM ruby:2.5.1

# Working dir
RUN mkdir /lita
WORKDIR /lita

# Installing dependicies
ADD Gemfile* /lita/
RUN bundle install --without development test --clean

# Run lita
CMD ln -s k8s_config/lita_config.rb lita_config.rb && bundle exec lita
