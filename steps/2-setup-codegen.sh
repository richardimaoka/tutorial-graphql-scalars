#!/bin/sh

cd "$(dirname "$0")" || exit # REMOVE THIS IN aggregate.sh
cd ../ || exit               # REMOVE THIS IN aggregate.sh - cd to the git repository root


git apply # schema.gql
git apply # use generated types in src/index.ts

git apply # use data.json
git apply # define context type

# query from apollo studio







npm run generate
npm start
