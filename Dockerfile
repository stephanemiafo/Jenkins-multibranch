# Specify the base image
FROM centos:7

# Add a tag
LABEL name="mighty me"

ENV HOME=/apache

# It is best practice to set WORKDIR explicitely
WORKDIR /apache 

# Update our packages 
RUN yum -y update && \
    yum clean all && \
    yum install -y httpd

#Copy the app inside the container
COPY index.html /var/www/html

# Port that the container will listen from
EXPOSE 80

# Run httpd by doing systemctl start httpd in other words tell him to go to /usr/sbin/ and run httpd. 
# please start httpd when the container start.         
ENTRYPOINT [ "/usr/sbin/httpd" ]

# Prevent the container to exit, please run the container in the foreground
CMD [ "-D", "FOREGROUND" ]

