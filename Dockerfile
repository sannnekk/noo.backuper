# Use an Ubuntu base image
FROM ubuntu:20.04

# Set non-interactive mode for installations
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install MySQL client (which includes mysqldump)
RUN apt-get update && \
    apt-get install -y mysql-client && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /usr/src/script

# Copy your script to the container
COPY mysql-backup.sh /usr/src/script/

# Ensure the script has the correct permissions
RUN chmod +x /usr/src/script/mysql-backup.sh