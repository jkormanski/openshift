FROM buildpack-deps:jessie

RUN chown -R 1001:0 $GEM_HOME 
USER 1001 
