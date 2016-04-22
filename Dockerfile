FROM ruby:2.2.3

ENV HOME=/usr/src/app

USER root
ADD run.sh /run.sh
RUN chmod +x /*.sh
CMD ["/run.sh"]

RUN chown -R 1001:0 $GEM_HOME 
USER 1001

WORKDIR /usr/src/app 

ADD Gemfile* /usr/src/app/
RUN bundle install
ADD . /usr/src/app/
