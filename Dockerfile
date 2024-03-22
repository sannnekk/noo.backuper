FROM alpine:3

RUN apk --update add bash mysql-client

RUN mkdir /var/backup

COPY . .