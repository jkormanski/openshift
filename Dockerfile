FROM buildpack-deps:jessie

EXPOSE 8080

ENV HOME=/usr/src/app

USER root
ADD run.sh /run.sh
RUN chmod +x /*.sh
CMD ["/run.sh"]

RUN chown -R 1001:0 $GEM_HOME 
USER 1001

WORKDIR ${HOME} 
ENTRYPOINT ["container-entrypoint"] 

