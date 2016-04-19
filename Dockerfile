FROM buildpack-deps:jessie

ENV RUBY_MAJOR 2.2
ENV RUBY_VERSION 2.2.3
ENV RUBYGEMS_VERSION 2.4.8

Copy the S2I scripts from the specific language image to $STI_SCRIPTS_PATH 
COPY ./s2i/bin/ $STI_SCRIPTS_PATH 

 
# Each language image can have 'contrib' a directory with extra files needed to 
# run and build the applications. 
COPY ./contrib/ /opt/app-root 

 
RUN chown -R 1001:0 /opt/app-root 
 
USER 1001 

# Set the default CMD to print the usage of the language image 
CMD $STI_SCRIPTS_PATH/usage 
