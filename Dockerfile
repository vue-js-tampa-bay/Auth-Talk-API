FROM ruby:2.6.2-alpine
RUN apk add --no-cache --update build-base nodejs postgresql-dev bash tzdata imagemagick nano
RUN mkdir /auth_talk_api
WORKDIR /auth_talk_api
COPY Gemfile /auth_talk_api/Gemfile
COPY Gemfile.lock /auth_talk_api/Gemfile.lock
RUN bundle install
COPY . /auth_talk_api

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]