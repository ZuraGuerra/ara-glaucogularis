# Deploy Ghost on a CentOS Docker container

# Set OS
FROM centos

ADD Makefile Makefile

# Install Make and run the Ghost installation file
RUN yum install -y make
RUN make

# Expose Ghost's current default port
# Remember to change this line and the `run` target,
# if you want to use another port
EXPOSE 2368

MAINTAINER Zura Guerra <hey@zura.space>
