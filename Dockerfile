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
 
ONBUILD COPY Gemfile /usr/src/app/ 
ONBUILD COPY Gemfile.lock /usr/src/app/ 
ONBUILD RUN bundle install 
ONBUILD COPY . /usr/src/app 

