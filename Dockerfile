# --------------------------------------------------------------------
# | Tools Included:
# | 
# |  git, php-cli, composer, curl
# |

FROM ubuntu:latest

MAINTAINER Payam Naderi <naderi.payam@gmail.com>

# Install base packages
RUN apt-get update && \
    apt-get install -y --force-yes \
        composer \
        curl \
        git \
	php5-cli

RUN mkdir /data
VOLUME ["/data"]
WORKDIR /data

