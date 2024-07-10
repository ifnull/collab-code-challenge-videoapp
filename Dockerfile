# Use the official Ruby image from the Docker Hub
ARG RUBY_VERSION=3.3.4
FROM ruby:$RUBY_VERSION

# Install dependencies
RUN curl https://deb.nodesource.com/setup_12.x | bash
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs yarn

# Set the working directory
WORKDIR /app

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile ./
#COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Copy the rest of the application code
COPY . .

# Install node modules and compile assets
RUN yarn install --check-files

RUN bundle exec rails webpacker:compile

# Expose port 3000 to the Docker host, so we can access the Rails app
EXPOSE 3000

# Remove existing server.pid if present
RUN rm -f tmp/pids/server.pid

# Specify the command to run when the container starts
CMD ["rails", "server", "-b", "0.0.0.0"]
