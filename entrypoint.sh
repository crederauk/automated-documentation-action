#!/bin/bash

rover -standalone true \
    -workingDir "$1" \
    -tfBackendConfig "$1/$2" \
    -tfVarsFile "$1/$3" \

unzip -o rover.zip -d ./rover-website