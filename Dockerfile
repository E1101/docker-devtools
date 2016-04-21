# --------------------------------------------------------------------
# | Tools Included:
# | 
# |  git, php-cli, composer, curl
# | 
# | Usage:
# | 
# |  dk run --rm -e USER=$USER -e USERID=$UID -v $(pwd):/data IMAGE command
# |  ! optionaly you can change current directory with -w always used with -v

FROM ubuntu:latest

MAINTAINER Payam Naderi <naderi.payam@gmail.com>

# Install base packages
RUN apt-get update && \
    apt-get install -y --force-yes \
        curl \
        git \
	php5-cli && \
        curl -sS https://getcomposer.org/installer | php && \
        mv composer.phar /usr/local/bin/composer

COPY entrypoint.sh /entrypoint.sh
RUN chmod 0755 /*.sh

RUN mkdir /data
VOLUME ["/data"]
WORKDIR /data

ENTRYPOINT ["/entrypoint.sh"]
