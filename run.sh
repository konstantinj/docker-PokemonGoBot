#!/bin/bash

root=/PokemonGoBot
config=$root/config.properties

for e in $(env); do
    case $e in
        POGO_*)
            k=$(echo ${e,,} | cut -d= -f1 | cut -c 6-)
            v=$(echo $e | cut -d= -f2)
            if grep -Fq "$k" $config; then
                sed -i "s/^$k.*/$k=$v/g" $config
            else
                echo  "$k=$v">>$config
            fi
    esac
done

java -jar $root/pogo.scraper-all.jar
