FROM jetbrains/teamcity-agent

USER root

MAINTAINER Camilo Colón
LABEL version="1.0"
LABEL description="TeamCity Agent to PHP"

# Installing PHP
RUN apt-get update \
    && apt-get install -y ca-certificates \
    apt-transport-https software-properties-common \
    && add-apt-repository ppa:ondrej/php \
    && apt-get install -y --no-install-recommends php8.0-fpm \
    php8.0-cli php8.0-mbstring php8.0-pdo php8.0-sqlite \
    php8.0-gd php8.0-xml php8.0-zip git unzip \
    && apt-get purge -y && apt autoremove -y && \
    apt-get clean && rm -rf /var/lib/apt/lists/* 

# Installing composer
RUN curl -sS https://getcomposer.org/installer -o composer-setup.php \
    && php -r "if (hash_file('SHA384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \ 



