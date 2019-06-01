FROM ruby:2.6.3
RUN mkdir /api
WORKDIR /api
COPY ./api/Gemfile /api/Gemfile
COPY ./api/Gemfile.lock /api/Gemfile.lock
RUN gem update --system
RUN gem install bundler
RUN bundle update --bundler
RUN bundle install
COPY ./api/ /api

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
