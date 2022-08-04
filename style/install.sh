#!/bin/bash

(which npm > /dev/null 2>&1) || ((curl -fsSL https://deb.nodesource.com/setup_16.x | bash -) && sudo apt-get install -y --force-yes nodejs)
(which sass > /dev/null 2>&1) || npm install --location=global sass
(which cssbeautify > /dev/null 2>&1) || npm install --location=global cssbeautify
