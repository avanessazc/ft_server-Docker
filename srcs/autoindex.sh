#!/bin/bash

if [ $# -ne 1 ]
then
    echo "It is not a valid parameter"
else
    if [ $1 != 'off' -a $1 != 'on' ]
    then
        echo "It is not a valid parameter"
    else
        if [ $1 = 'off' ]; then
            sed -i 's/autoindex on/autoindex off/g' /etc/nginx/sites-available/localhost
            echo "autoindex turned off"
            service nginx restart
        fi
        if [ $1 = 'on' ]; then
            sed -i 's/autoindex off/autoindex on/g' /etc/nginx/sites-available/localhost
            echo "autoindex turned on"
            service nginx restart
        fi
    fi
fi
