FROM buildpack-deps:jessie

EXPOSE 8080

LABEL io.k8s.description="Platform for building and running Ruby 2.2 applications" \ 
    io.k8s.display-name="Ruby 2.2" \ 
    io.openshift.expose-services="8080:http" \ 
    io.openshift.tags="builder,ruby,ruby22" 


RUN chown -R 1001:0 $GEM_HOME 
USER 1001 
