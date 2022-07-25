#!/bin/sh

cd "$(dirname "$0")" || exit # REMOVE THIS IN aggregate.sh
cd ../ || exit               # REMOVE THIS IN aggregate.sh - cd to the git repository root

npm install graphql-scalars

git apply # EmailAddress in schema, resolver
# query in apollo studio, errors

git apply # argument type in schema, resolver
# query in apollo studio, errors

# if you use a text schema definition, you can't use ScalrNameTypeDefinition
