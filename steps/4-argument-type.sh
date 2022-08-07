#!/bin/sh

cd "$(dirname "$0")" || exit # REMOVE THIS IN aggregate.sh
cd ../ || exit               # REMOVE THIS IN aggregate.sh - cd to the git repository root

# ## 4. graphql-scalarsをargument型に使った際の動作確認

# ここまではfieldの型にcustom scalarを使う方法を見てきましたが、ここからはargument型の場合を見てみましょう。searchというfieldを追加し、そのargumentでcustom scalarであるCountryCodeを使います。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```shell
git apply patches/7833b58.patch # add CountryCode to schema.gql
git apply patches/c1d6bcd.patch # add country to index.ts
git apply patches/3f8aece.patch # update data/Query.json
# ```

# <details><summary>:white_check_mark: Result: 上記コマンドで更新される schema.gql</summary><div>

# ```diff:server/schema.gql
# scalar EmailAddress
# + scalar CountryCode

# type Person {
#   emailAddress: EmailAddress
#   name: String
# +   country: CountryCode
# }

# type Query {
#   me: Person
# +  search(country: CountryCode): [Person]
# }
# ```

# ---

# </div></details>

# <details><summary>:white_check_mark: Result: 上記コマンドで更新される index.ts</summary><div>

# ```diff:server/src/index.ts
# import { ApolloServer, gql } from "apollo-server";
# import * as fs from "fs";
# - import { EmailAddressResolver } from "graphql-scalars";
# + import { CountryCodeResolver, EmailAddressResolver } from "graphql-scalars";
# import { Query, Resolvers } from "./generated/graphql";

# const typeDefs = gql`
# @@ -16,6 +16,9 @@ const resolvers: Resolvers<LoadingDataContext> = {
#     me(_parent, _args, context, _info) {
#       return context.Query.me;
#     },
# +     search(_parent, _args, context, _info) {
# +       return context.Query.search;
# +     },
#   },
#   Person: {
#     name(parent, _args, _context, _info) {
# @@ -24,8 +27,12 @@ const resolvers: Resolvers<LoadingDataContext> = {
#     emailAddress(parent, _args, _context, _info) {
#       return parent.emailAddress;
#     },
# +     country(parent, _args, _context, _info) {
# +       return parent.country;
# +     },
#   },
#   EmailAddress: EmailAddressResolver,
# +   CountryCode: CountryCodeResolver,
# };

# const readJsonFile = async (relativeFileName: string): Promise<any> => {
# ```

# ---

# </div></details>

# <details><summary>:white_check_mark: Result: 上記コマンドで更新される Query.json</summary><div>

# ```diff:server/data/Query.json
# {
#   "me": {
#     "emailAddress": "jason.summerwinnter@gmail.com",
# -     "name": "Jason Summerwinter"
# -   }
# +     "name": "Jason Summerwinter",
# +     "country": "JP"
# +   },
# +   "search": [
# +     {
# +       "emailAddress": "jason.fallspring@gmail.com",
# +       "name": "Jason FallSpring",
# +       "country": "JP"
# +     },
# +     {
# +       "emailAddress": "kate.heartspadediamond@gmail.com",
# +       "name": "Kate HeartSpadeDiamond",
# +       "country": "JP"
# +     },
# +     {
# +       "emailAddress": "yosuke.kishidamax@gmail.com",
# +       "name": "Yosuke KishidaMax",
# +       "country": "JP"
# +     },
# +     {
# +       "emailAddress": "bob.BobbDobb@gmail.com",
# +       "name": "Bob BobbDobb",
# +       "country": "JP"
# +     }
# +   ]
# }
# ```

# ---

# </div></details>

# :large_orange_diamond: Action: Apollo Studio Explorerからクエリを実行して、動作を確認してください。

# <details><summary>:white_check_mark: Result: Apollo Studio Explorerからクエリの実行</summary><div>

# 型チェックエラー
# ランタイムエラー

# ---

# </div></details>

# argumentでcustom scalarを使ったときの動作がこれで確認できました。
