FROM ruby:2.5.5
ENV LANG C.UTF-8
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
apt-get install -y nodejs

RUN apt-get update -qq && apt-get install -y curl apt-transport-https wget && \
	curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
	echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
	apt-get update && apt-get install -y yarn && \
	getm install bundler 

WORKDIR /youtube_tutorial_bulletin
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
COPY package.json package.json
RUN bundle install

