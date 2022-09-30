#!/bin/bash

rover -standalone true \
    -workingDir "$1" \
    -tfBackendConfig "$2" \
    -tfVarsFile "$3" \

unzip -o rover.zip -d ./rover-website