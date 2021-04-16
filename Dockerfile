FROM jetbrains/teamcity-agent

MAINTAINER Camilo Colón
LABEL version="1.0"
LABEL description="The great TeamCity CI with PHP"

RUN apt-get update \
    && apt-get install -y software-properties-common \
        wget \
    && add-apt-repository ppa:ondrej/php \
    && apt-get update -qq \
    && apt-get install -y php7.2-cli php-pear php7.2-curl php7.2-dev \ 
        php7.2-gd php7.2-mbstring php7.2-zip php7.2-mysql php7.2-xml php7.2-intl \
    && rm -rf /var/lib/apt/lists/* \
    && cd ~ \
    && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php -r "if (hash_file('SHA384', 'composer-setup.php') === '93b54496392c062774670ac18b134c3b3a95e5a5e5c8f1a9f115f203b75bf9a129d5daa8ba6a13e2cc8a1da0806388a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    && php composer-setup.php --install-dir=/usr/bin --filename=composer \
    && php -r "unlink('composer-setup.php');" \
    && composer global require "phpunit/phpunit ^7" \
    && ln -s ~/.composer/vendor/bin/phpunit /usr/local/bin/phpunit \
    && composer global require 'phpunit/dbunit=*' \
    && composer global require 'phpunit/php-invoker=*' \ 
    && composer global require 'phpunit/phpunit-selenium=*' \
    && composer global require phpmd/phpmd \
    && ln -s ~/.composer/vendor/bin/phpmd /usr/local/bin/phpmd \
    && composer global require pdepend/pdepend \
    && ln -s ~/.composer/vendor/bin/pdepend /usr/local/bin/pdepend \
    && cd ~ && wget https://github.com/phpDocumentor/phpDocumentor2/releases/download/v2.9.0/phpDocumentor.phar \
    && mv ~/phpDocumentor.phar /usr/bin && chmod a+x /usr/bin/phpDocumentor.phar \
    && ln -s /usr/bin/phpDocumentor.phar /usr/bin/phpdoc \
    && composer global require mayflower/php-codebrowser \
    && ln -s ~/.composer/vendor/bin/phpcb /usr/local/bin/phpcb \
    && composer global require sebastian/phpcpd \
    && ln -s ~/.composer/vendor/bin/phpcpd /usr/local/bin/phpcpd \
    && composer global require phploc/phploc \
    && ln -s ~/.composer/vendor/bin/phploc /usr/local/bin/phploc \
    && composer global require squizlabs/php_codesniffer \
    && ln -s ~/.composer/vendor/bin/phpcs /usr/local/bin/phpcs
