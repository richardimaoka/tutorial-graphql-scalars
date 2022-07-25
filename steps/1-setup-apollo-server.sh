#!/bin/sh

cd "$(dirname "$0")" || exit # REMOVE THIS IN aggregate.sh
cd ../ || exit               # REMOVE THIS IN aggregate.sh - cd to the git repository root


npm init -y
npm install --save-dev typescript
npx tsc --init
npm install --save-dev ts-node-dev
npm set-script start "ts-node-dev --respawn src/index.ts"
npm install apollo-server graphql

npm install -D @graphql-codegen/cli
npx graphql-codegen-generator init
# ...answers
npm install

git apply # bare bone src/index.ts, fold to show the file content
git apply # bare bone schema.gql, fold to show the file content
npm generate
npm start

# query from apollo studio
