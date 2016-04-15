FROM phusion/baseimage:0.9.15

# Update Ubuntu and install common packages
RUN apt-get update -y
RUN apt-get install -y s3cmd

ADD files/s3cfg /.s3cfg
ADD files/config-s3.sh /config-s3.sh

# Main entrypoint script
RUN chmod 777 config-s3.sh

# Folders for s3cmd optionations
RUN mkdir /opt/src
RUN mkdir /opt/dest

WORKDIR /
CMD ["/config-s3.sh"]