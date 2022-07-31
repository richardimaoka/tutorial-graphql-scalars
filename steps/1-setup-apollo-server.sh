#!/bin/sh

cd "$(dirname "$0")" || exit # REMOVE THIS IN aggregate.sh
cd ../ || exit               # REMOVE THIS IN aggregate.sh - cd to the git repository root

# ## Set up Apollo Server
mkdir server
# shellcheck disable=SC2164 # REMOVE THIS IN aggregate.sh
cd server

# node.js setup
npm init -y
echo "node_modules" > .gitignore

# install and initialize typescript
npm install --save-dev typescript
npx tsc --init

# ts-node-dev: watch and restart a TypeScript server
npm install --save-dev ts-node-dev
npm set-script start "ts-node-dev --respawn src/index.ts"

# apollo server
npm install apollo-server graphql

# install and setup graphql-codegen
npm install -D @graphql-codegen/cli # @2.10.0
# 本来ならここで npx graphql-code-generator initを行うが、対話モードに入ると時間がかかるので以下npm installで代替
npm install --save-dev  @graphql-codegen/typescript @graphql-codegen/typescript-resolvers
npm set-script generate "graphql-codegen --config codegen.yml --watch ./schema.gql" # update generate script


# copy files
mkdir src
mkdir data
curl https://raw.githubusercontent.com/richardimaoka/tutorial-apollo-server-setup/main/server/codegen.yml > codegen.yml
curl https://raw.githubusercontent.com/richardimaoka/tutorial-apollo-server-setup/main/server/schema.gql > schema.gql
curl https://raw.githubusercontent.com/richardimaoka/tutorial-apollo-server-setup/main/server/src/index.ts > src/index.ts
curl https://raw.githubusercontent.com/richardimaoka/tutorial-apollo-server-setup/main/server/data/Query.json > data/Query.json

npm run generate

# shellcheck disable=SC2164 # REMOVE THIS IN aggregate.sh
cd server
npm start