#!/bin/bash

# rover  -workingDir "/github/workspace/terraform" \
#     -tfBackendConfig "backend.config" \
#     -tfVarsFile "demo.tfvars" \
#     -standalone true

rover -workingDir "$1" \
    -tfBackendConfig "$2" \
    -tfVarsFile "$3" \
    -standalone true

unzip -o rover.zip -d ./rover-website