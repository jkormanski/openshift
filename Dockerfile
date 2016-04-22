FROM buildpack-deps:jessie

EXPOSE 8080

ENV HOME=/usr/src/app

USER root
ADD run.sh /run.sh
RUN chmod +x /*.sh
CMD ["/run.sh"]

RUN chown -R 1001:0 $GEM_HOME 
USER 1001

RUN bundle config --global frozen 1 
WORKDIR /usr/src/app 

ONBUILD COPY Gemfile /usr/src/app/ 
ONBUILD COPY Gemfile.lock /usr/src/app/ 
ONBUILD RUN bundle install
ONBUILD COPY . /usr/src/app
