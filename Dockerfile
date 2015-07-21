#
# Dockerfile for a MySQL database.
#
# https://github.com/confirm-it-solutions/docker-mysql
#

# Pull django base image.
FROM confirm/debian

MAINTAINER confirm IT solutions, dbarton

# Run ansible to install celery.
ADD ansible /etc/ansible
RUN ansible-playbook /etc/ansible/build.yml -c local

# Define mountable directories.
VOLUME ["/data"]

# Expose ports.
EXPOSE 3306

# Start it.
WORKDIR /data
CMD /start
