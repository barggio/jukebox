# DEVELOPMENT DOCKERFILE

FROM ruby:2.4.1

RUN apt-get update && apt-get install vim postgresql-client -y

RUN gem install rails

RUN cd /usr/local                                                        \
    && wget https://nodejs.org/dist/v8.4.0/node-v8.4.0-linux-x64.tar.xz  \
    && tar -xvf node-v8.4.0-linux-x64.tar.xz                             \
    && mv node-v8.4.0-linux-x64 node                                     \
    && rm node-v8.4.0-linux-x64.tar.xz

ENV PATH "/usr/local/node/bin:$PATH"
ENV PORT "3333"
ENV HOST "0.0.0.0"

ENV RAILS_ENV "development"

RUN npm i -g yarn
COPY . /usr/src/app
WORKDIR /usr/src/app
#WORKDIR is like cd
RUN bundle install

ENV RAILS_SERVE_STATIC_FILES "true"
ENV SECRET_KEY_BASE "02f9fc8d7b09ad8a103d79085077521431933a8596f72b890f8862714f4b33e06fd03eff7972f5515828531caaa7267674a2ae9724225af6aab8f7ed635c739e"
RUN rails assets:clobber & rails assets:precompile

EXPOSE 3333
CMD ["rails", "server"]