#!/bin/bash

echo "============================ PHP Versions ==============================="
echo "phpenv versions"
$HOME/.phpenv/bin/phpenv versions
printf "\n\n"

declare -a versions=('5.6' '7.0' '7.2')

for version in "${versions[@]}"
  do
    export PATH=$HOME/.phpenv/bin:$HOME/.phpenv/extensions:$PATH;
    eval "$(phpenv init -)"

    echo "=============== Switching to version $version  ======================"
    echo "phpenv global $version"
    $HOME/.phpenv/bin/phpenv global $version
    printf "\n"
    rm -rf ~/.composer && ln -s ~/.phpenv/versions/$(phpenv version-name)/composer ~/.composer
    echo "======================== Checking version ==========================="
    echo "php --version"
    php --version
    printf "\n"
  done
