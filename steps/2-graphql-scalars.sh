#!/bin/sh

cd "$(dirname "$0")" || exit # REMOVE THIS IN aggregate.sh
cd ../ || exit               # REMOVE THIS IN aggregate.sh - cd to the git repository root

# :large_orange_diamond: Action: 新しいターミナルを立ち上げてください。

# ```:terminal
# shellcheck disable=SC2164 # REMOVE THIS IN aggregate.sh
cd server
npm install graphql-scalars
# ```

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```shell
git apply patches/258a5ef.patch # update schema.gql
git apply patches/4bf1886.patch # update index.ts
git apply patches/6d40e7f.patch # update Query.json
# ```

# <details><summary>:white_check_mark: Result: 上記コマンドで更新される schema.gql</summary><div>

# ```graphql:server/schema.gql
# scalar EmailAddress

# type Person {
#   emailAddress: EmailAddress
#   name: String
# }

# type Query {
#   me: Person
# }
# ```

# ---

# </div></details>

# <details><summary>:white_check_mark: Result: 上記コマンドで更新される index.ts</summary><div>

# ```ts:server/src/index.ts
# import { ApolloServer, gql } from "apollo-server";
# import * as fs from "fs";
# import { EmailAddressResolver } from "graphql-scalars";
# import { Query, Resolvers } from "./generated/graphql";

# const typeDefs = gql`
#   ${fs.readFileSync(__dirname.concat("/../schema.gql"), "utf8")}
# `;

# interface LoadingDataContext {
#   Query: Query;
# }

# const resolvers: Resolvers<LoadingDataContext> = {
#   Query: {
#     me(_parent, _args, context, _info) {
#       return context.Query.me;
#     },
#   },
#   Person: {
#     name(parent, _args, _context, _info) {
#       return parent.name;
#     },
#     emailAddress(parent, _args, _context, _info) {
#       return parent.emailAddress;
#     },
#   },
#   EmailAddress: EmailAddressResolver,
# };

# const readJsonFile = async (relativeFileName: string): Promise<any> => {
#   const jsonDataFile = __dirname.concat(relativeFileName);
#   const fileContent = await fs.promises.readFile(jsonDataFile, "utf8");
#   const jsonData = JSON.parse(fileContent);
#   return jsonData;
# };

# const server = new ApolloServer({
#   typeDefs,
#   resolvers,
#   context: async ({ req }: any) => {
#     try {
#       const queryData: LoadingDataContext = await readJsonFile(
#         "/../data/Query.json"
#       );
#       return { Query: queryData };
#     } catch (err) {
#       console.log("***ERROR OCURRED***");
#       console.log(err);
#       throw new Error("internal error happened!!");
#     }
#   },
# });

# // The `listen` method launches a web server.
# server.listen().then(({ url }) => {
#   console.log(`🚀  Server ready at ${url}`);
# });

# ```

# ---

# </div></details>

# <details><summary>:white_check_mark: Result: 上記コマンドで更新される Query.json</summary><div>

# ```json:server/data/Query.json
# {
#   "me": { 
#     "emailAddress": "jason.summerwinnter@gmail.com",
#     "name": "Jason Summerwinter"
#   }
# }
# ```

# ---

# </div></details>

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```shell
git apply patches/8008a13.patch # return 10 in EmailAddress
# ```

# <details><summary>:white_check_mark: Result: 上記コマンドで更新される index.ts</summary><div>

# ```diff:server/src/index.ts
# emailAddress(parent, _args, _context, _info) {
# -  return parent.emailAddress;
# +  return 10;
# }
# ```    

# ---

# </div></details>

# 上記のソースコードは `return 10` としてnumber型の値を返しています。number型ではGraphQLのEmailAddress型の値を表現できないので、TypeScriptの型チェックでエラーを出してほしいところです。そこで以下の変更を行いましょう。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```shell
git apply patches/e60bb3a.patch # Update codegen.yml to set EmailAddress as string
# ```

# <details><summary>:white_check_mark: Result: 上記コマンドで更新される config.yml</summary><div>

# ```diff:config.yml
# generates:
#   src/generated/graphql.ts:
#     plugins:
#       - "typescript"
#       - "typescript-resolvers"
#     config:
#       avoidOptionals: true
# +       scalars:
# +         EmailAddress: string
# ```    

# ---

# </div></details>

# <details><summary>:white_check_mark: Result: config.ymlの変更に伴って、generated/graphql.ts が自動更新されます。</summary><div>

# ```diff:server/src/generated/graphql.ts
# export type Scalars = {
#   ID: string;
#   String: string;
#   Boolean: boolean;
#   Int: number;
#   Float: number;
# -  EmailAddress: any;
# +  EmailAddress: string;
# };
# ```    

# ---

# </div></details>

run generate
npm start
