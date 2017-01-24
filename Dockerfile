# Deploy Ghost on a CentOS Docker container

# Set OS
FROM centos

ADD Makefile Makefile

# Install Make, configures host and port,
# and run the Ghost installation file
RUN yum install -y make
RUN export GHOST_PORT=80
RUN export GHOST_HOST=0.0.0.0
RUN make

# Expose Ghost's current default port
# Remember to change this line and the `run` target,
# if you want to use another port
EXPOSE 2368

MAINTAINER Zura Guerra <hey@zura.space>
