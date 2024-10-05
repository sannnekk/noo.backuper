# Use a lightweight base image like Debian or Ubuntu
FROM debian:bullseye-slim

# Set environment variables to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary tools for downloading and installing MySQL APT repo
RUN apt-get update && \
    apt-get install -y wget lsb-release gnupg

# Add MySQL APT repository to the container
RUN wget https://dev.mysql.com/get/mysql-apt-config_0.8.26-1_all.deb && \
    dpkg -i mysql-apt-config_0.8.26-1_all.deb && \
    rm -f mysql-apt-config_0.8.26-1_all.deb

# Update the package list and install MySQL client (including mysqldump)
RUN apt-get update && \
    apt-get install -y mysql-client && \
    apt-get clean

RUN mkdir /var/backup

COPY . .