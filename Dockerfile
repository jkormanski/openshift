FROM buildpack-deps:jessie

EXPOSE 8080

RUN chown -R 1001:0 $GEM_HOME 
USER 1001 
