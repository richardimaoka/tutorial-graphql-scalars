#!/bin/sh

cd "$(dirname "$0")" || exit # REMOVE THIS IN aggregate.sh
cd ../ || exit               # REMOVE THIS IN aggregate.sh - cd to the git repository root

# argument type
#   Apollo Studio, send wrong type - error
#   Apollo Studio, send wrong format - error