FROM ruby:2.7.1

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

RUN groupadd --system app-user && adduser --system --ingroup app-user app-user

WORKDIR /app

RUN chown app-user:app-user /app

COPY Gemfile Gemfile.lock ./

# https://bundler.io/man/bundle-install.1.html#DEPLOYMENT-MODE
# https://github.com/capistrano/bundler/issues/115
# https://github.com/rubygems/bundler/issues/7531
RUN bundle config set without 'test development' && bundle config set frozen 'true'
RUN bundle install

USER app-user

COPY --chown=app-user:app-user . ./

HEALTHCHECK CMD bundle exec ruby healthcheck.rb

# https://puma.io/puma/
# Without arguments, puma will look for a rackup (.ru) file in the current working directory called config.ru
CMD bundle exec puma --config lib/runner_said_no_one_ever/config/puma.rb
