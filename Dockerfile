FROM jetbrains/teamcity-agent

USER root

MAINTAINER Camilo Colón
LABEL version="1.0"
LABEL description="The great TeamCity CI with PHP"

RUN apt-get update \
    && apt-get install -y ca-certificates \
    apt-transport-https software-properties-common \
    && add-apt-repository ppa:ondrej/php \
    && apt-get install -y php8.0-fpm
