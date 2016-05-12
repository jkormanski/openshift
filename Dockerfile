FROM ruby:2.2 

# throw errors if Gemfile has been modified since Gemfile.lock 
RUN bundle config --global frozen 1 

RUN mkdir -p /usr/src/app 
WORKDIR /usr/src/app 

USER root
ADD run.sh /run.sh
RUN chmod +x /*.sh
CMD ["/run.sh"]

RUN chown -R 1001:0 /usr/src/app 
USER 1001
 
ENV BUNDLER_VERSION 1.12.3 
RUN gem install bundler --version "$BUNDLER_VERSION" 

 
ONBUILD COPY Gemfile /usr/src/app/ 
ONBUILD COPY Gemfile.lock /usr/src/app/ 

RUN cd /usr/src/app/
ONBUILD RUN bundle install 
ONBUILD COPY . /usr/src/app

RUN bundle show

