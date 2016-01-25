# container to just run cron scripts it finds in this directory
FROM alpine:latest

MAINTAINER Gavin Gray <g.d.b.gray@sms.ed.ac.uk>

# need docker installed to run docker commands
RUN apk add --update docker

# ADD in all scripts
ADD 15min/* /etc/periodic/15min/
ADD daily/* /etc/periodic/daily/
ADD hourly/* /etc/periodic/hourly/
ADD monthly/* /etc/periodic/monthly/
ADD weekly/* /etc/periodic/weekly/

# and make sure they're all runnable
RUN chmod -R a+x /etc/periodic

ENV DOCKER_HOST unix://docker.sock

# run the cron daemon in the foreground
CMD ["crond", "-f"]
