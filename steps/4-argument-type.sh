#!/bin/sh

cd "$(dirname "$0")" || exit # REMOVE THIS IN aggregate.sh
cd ../ || exit               # REMOVE THIS IN aggregate.sh - cd to the git repository root

# ## graphql-scalarsをargument型に使った際の動作確認

# argument type
#   Apollo Studio, send wrong type - error
#   Apollo Studio, send wrong format - error