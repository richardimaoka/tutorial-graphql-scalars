#!/bin/sh

cd "$(dirname "$0")" || exit # REMOVE THIS IN aggregate.sh
cd ../ || exit               # REMOVE THIS IN aggregate.sh - cd to the git repository root

# npm install graphql-scalars
# EmailAddress - schema.gql, data/Query.json, Apollo Studio
#   override in index.ts, and return 10 -> error
#   config.yml to set string -> static type checking!
#   however, returning a string with wrong-format passes static typing...

# argument type
#   Apollo Studio, send wrong type - error
#   Apollo Studio, send wrong format - error

run generate
npm start
