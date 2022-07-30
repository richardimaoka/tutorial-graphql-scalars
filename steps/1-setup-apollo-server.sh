#!/bin/sh

cd "$(dirname "$0")" || exit # REMOVE THIS IN aggregate.sh
cd ../ || exit               # REMOVE THIS IN aggregate.sh - cd to the git repository root

# ## Set up Apollo Server
mkdir server
# shellcheck disable=SC2164 # REMOVE THIS IN aggregate.sh
cd server

npm init -y
echo "node_modules" > .gitignore

# install and initialize typescript
npm install --save-dev typescript
npx tsc --init

# ts-node-dev for watch and restart a TypeScript server
npm install --save-dev ts-node-dev
npm set-script start "ts-node-dev --respawn src/index.ts"

# apollo server
npm install apollo-server graphql


# ## Set up Codegen
# install and setup graphql-codegen
npm install -D @graphql-codegen/cli # @2.10.0
# 本来ならここで npx graphql-code-generator init
    # ? What type of application are you building? Backend - API or server
    # ? Where is your schema?: (path or url) schema.gql
    # ? Pick plugins: TypeScript (required by other typescript plugins),
    # TypeScript Resolvers (strongly typed resolve functions)
    # ? Where to write the output: src/generated/graphql.ts
    # ? Do you want to generate an introspection file? No
    # ? How to name the config file? codegen.yml
    # ? What script in package.json should run the codegen? generate
npm install --save-dev  @graphql-codegen/typescript @graphql-codegen/typescript-resolvers
npm set-script generate "graphql-codegen --config codegen.yml --watch ./schema.gql" # update generate script

curl https://raw.githubusercontent.com/richardimaoka/tutorial-apollo-server-setup/main/server/config.yml > config.yml
curl https://raw.githubusercontent.com/richardimaoka/tutorial-apollo-server-setup/main/server/schema.gql > schema.gql
mkdir src
curl https://raw.githubusercontent.com/richardimaoka/tutorial-apollo-server-setup/main/server/src/index.ts > src/index.ts
mkdir data
curl https://raw.githubusercontent.com/richardimaoka/tutorial-apollo-server-setup/main/server/data/Query.json > data/Query.json

