FROM buildpack-deps:jessie

EXPOSE 8080

ENV HOME=/usr/src/app

USER root
ADD run.sh /run.sh
RUN chmod +x /*.sh
CMD ["/run.sh"]

RUN chown -R 1001:0 $GEM_HOME 
USER 1001

WORKDIR /usr/src/app 


ONBUILD ADD Gemfile* /usr/src/app/
CMD ["ls"]

ONBUILD RUN bundle install
ONBUILD ADD . /usr/src/app/
