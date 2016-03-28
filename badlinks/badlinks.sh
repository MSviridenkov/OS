#!/bin/bash

go() {
    for file in "$1"/*
    do
        if [ -d "${file}" ]
            then
                go ${file}
            else
                if [ -h "${file}" -a `stat -c %Y "${file}"` -lt "$(date -d 'week ago' +%s)" ]
                    then
                        echo ${file}
                fi
        fi
    done
}

go $1
