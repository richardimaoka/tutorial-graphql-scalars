#!/bin/sh

cd "$(dirname "$0")" || exit # REMOVE THIS IN aggregate.sh
cd ../ || exit               # REMOVE THIS IN aggregate.sh - cd to the git repository root


# new terminal
npm init -y
echo "node_modules" > .gitignore
npm install --save-dev typescript
npx tsc --init
npm install --save-dev ts-node-dev
npm set-script start "ts-node-dev --respawn src/index.ts"
npm install apollo-server graphql
git apply # bare bone src/index.ts, fold to show the file content
git apply # bare bone schema.gql, fold to show the file content
npm start

# new terminal
npm install -D @graphql-codegen/cli
npx graphql-codegen-generator init
# codgen interactive questions & answers
npm install
npm set-script start "...."
npm generate
git apply # use generated types in src/index.ts

git apply # use data.json
git apply # define context type

# query from apollo studio
