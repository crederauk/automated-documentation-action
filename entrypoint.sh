#!/bin/bash

rover -workingDir "$1" \
    -tfBackendConfig "$2" \
    -tfVarsFile "$3" \
    -standalone true

unzip -o rover.zip -d ./rover-website