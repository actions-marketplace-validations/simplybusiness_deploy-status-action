FROM ruby:2.7.1

LABEL maintainer="simplybusiness <opensourcetech@simplybusiness.co.uk>"

ENV BUNDLER_VERSION="2.2.26"

RUN gem install bundler --version "${BUNDLER_VERSION}"


RUN mkdir -p /runner/action

WORKDIR /runner/action

COPY Gemfile* ./

COPY lib ./lib

RUN bundle install --retry 3

ENV BUNDLE_GEMFILE /runner/action/Gemfile

RUN chmod +x /runner/action/lib/action.rb

ENTRYPOINT ["ruby", "/runner/action/lib/action.rb"]
