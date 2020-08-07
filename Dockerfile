FROM ruby:2.6.3-stretch
ENV BUNDLER_VERSION=1.17.3
RUN gem install bundler -v 1.17.3
WORKDIR /application
COPY Gemfile Gemfile.lock ./
RUN bundle config build.nokogiri --use-system-libraries
RUN bundle check || bundle install
COPY . ./
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt install -y nodejs
ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]
