FROM buildpack-deps:jessie

EXPOSE 8080

ENV HOME=/usr/src/app
WORKDIR $HOME 

USER root
ADD run.sh /run.sh
RUN chmod +x /*.sh
CMD ["/run.sh"]

RUN chown -R 1001:0 $GEM_HOME 
USER 1001

ONBUILD COPY Gemfile /usr/src/app/ 
ONBUILD COPY Gemfile.lock /usr/src/app/ 
ONBUILD COPY . /usr/src/app

RUN gem install bundler --version "$BUNDLER_VERSION" \ 
&& bundle config --global path "$GEM_HOME" \ 
&& bundle config --global bin "$GEM_HOME/bin" 

