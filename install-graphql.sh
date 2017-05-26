#!/bin/sh

# This script will prompt for the magento repo auth details, so cannot
# be run from the Dockerfile

set -x

if [ ! -d $HOME/.composer ]; then
    mkdir $HOME/.composer
fi
if [ ! -f $HOME/.composer/auth.json ]; then
    echo "Warning: No ~/.composer/auth.json file, Magento repo keys missing?"
fi

cd /var/www/magento2
composer config minimum-stability dev
composer config repositories.alankent vcs git@github.com:alankent/module-graphql.git
composer require alankent/module-graphql:* --prefer-source
