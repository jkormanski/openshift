FROM buildpack-deps:jessie

ENV RUBY_MAJOR 2.2
ENV RUBY_VERSION 2.2.3
ENV RUBYGEMS_VERSION 2.4.8

RUN chown -R 1001:0 /opt/app-root 
 
USER 1001 
