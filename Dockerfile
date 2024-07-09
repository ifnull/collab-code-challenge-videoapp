# Use the official Ruby image from the Docker Hub
FROM ruby:3.1

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Set the working directory
WORKDIR /app

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile /app/Gemfile

# Uncomment after first run
# COPY Gemfile.lock /app/Gemfile.lock

# Install gems
RUN bundle install

# Copy the rest of the application code
COPY . /app

# Expose port 3000 to the Docker host, so we can access the Rails app
EXPOSE 3000

# Specify the command to run when the container starts
CMD ["rails", "server", "-b", "0.0.0.0"]
