#!/bin/bash

rover  -workingDir "/home/runner/work/terraform-rover-demo/terraform-rover-demo/terraform" -tfBackendConfig "backend.config" -tfVarsFile "demo.tfvars" -standalone true

# rover -standalone true \
#     -workingDir "$1" \
#     -tfBackendConfig "$2" \
#     -tfVarsFile "$3" \

unzip -o rover.zip -d ./rover-website