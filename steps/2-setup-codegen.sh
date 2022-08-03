#!/bin/sh

cd "$(dirname "$0")" || exit # REMOVE THIS IN aggregate.sh
cd ../ || exit               # REMOVE THIS IN aggregate.sh - cd to the git repository root

# :large_orange_diamond: Action: 新しいターミナルを立ち上げてください。

# ```:terminal
npm install graphql-scalars
# ```

# :large_orange_diamond: Action: 以下のとおり `server/schema.gql` を更新してください。

# ```graphql:server/schema.gql
# scalar EmailAddress
#
# type Person {
#   emailAddress: EmailAddress
#   name: String
# }
#
# type Query {
#   me: Person
# }
# ```

# :large_orange_diamond: Action: 以下のとおり `server/src/index.ts` を更新してください。
# ```ts:server/src/index.ts
# import { ApolloServer, gql } from "apollo-server";
# import * as fs from "fs";
# import {
#   EmailAddressResolver,
#   TimestampResolver,
#   URLResolver,
# } from "graphql-scalars";
# import { EmailAddress } from "graphql-scalars/mocks";
# import { Query, Resolvers } from "./generated/graphql";
#
# const typeDefs = gql`
#   ${fs.readFileSync(__dirname.concat("/../schema.gql"), "utf8")}
# `;
#
# interface LoadingDataContext {
#   Query: Query;
# }
#
# const resolvers: Resolvers<LoadingDataContext> = {
#   Query: {
#     me(parent, args, context, info) {
#       return null;
#     },
#   },
#   Person: {
#     name(parent, args, context, info) {
#       return parent.name;
#     },
#     emailAddress(parent, args, context, info) {
#       return parent.emailAddress;
#     },
#   },
#   EmailAddress: EmailAddressResolver,
# };
#
# const readJsonFile = async (relativeFileName: string): Promise<any> => {
#   const jsonDataFile = __dirname.concat(relativeFileName);
#   const fileContent = await fs.promises.readFile(jsonDataFile, "utf8");
#   const jsonData = JSON.parse(fileContent);
#   return jsonData;
# };
#
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
#
# // The  method launches a web server.
# server.listen().then(({ url }) => {
#   console.log();
# });
#```

# :large_orange_diamond: Action: 以下のとおり `server/data/Query.json` を更新してください。

# EmailAddress - schema.gql, data/Query.json, Apollo Studio
#   override in index.ts, and return 10 -> error https://github.com/richardimaoka/tutorial-graphql-scalars/commit/5edea8ed55cf85d145edfc3c36746a74378aa148
#   config.yml to set string -> static type checking! https://github.com/richardimaoka/tutorial-graphql-scalars/commit/5edea8ed55cf85d145edfc3c36746a74378aa148
        # ![2022-08-03_00h20_53.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/25250495-3c88-b8e3-20f5-c89dca067c1e.png)
        # (property) emailAddress: Resolver<Maybe<ResolverTypeWrapper<string>>, Person, LoadingDataContext, {}>
        # Type '(parent: Person, _args: {}, _context: LoadingDataContext, _info: GraphQLResolveInfo) => number' is not assignable to type 'Resolver<Maybe<ResolverTypeWrapper<string>>, Person, LoadingDataContext, {}>'.
        #   Type '(parent: Person, _args: {}, _context: LoadingDataContext, _info: GraphQLResolveInfo) => number' is not assignable to type 'ResolverFn<Maybe<ResolverTypeWrapper<string>>, Person, LoadingDataContext, {}>'.
        #     Type 'number' is not assignable to type 'Maybe<ResolverTypeWrapper<string>> | Promise<Maybe<ResolverTypeWrapper<string>>>'.ts(2322)
        # graphql.ts(170, 3): The expected type comes from property 'emailAddress' which is declared here on type 'PersonResolvers<LoadingDataContext, Person>'
#   however, returning a string with wrong-format passes static typing... https://github.com/richardimaoka/tutorial-graphql-scalars/commit/3396121dde6f3ced560498c3c07e84b7d1d0d03e
#   querying from apollo studio givens a runtime error
    #  ![2022-08-03_00h31_54.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/d5bb9f73-4e20-3c32-9eeb-41e5e4d6c055.png)
    # {
    #   "errors": [
    #     {
    #       "message": "Value is not a valid email address: someone@@@@@gmail.com",
    #       "locations": [
    #         {
    #           "line": 3,
    #           "column": 5
    #         }
    #       ],
    #       "path": [
    #         "me",
    #         "emailAddress"
    #       ],
    #       "extensions": {
    #         "code": "INTERNAL_SERVER_ERROR",
    #         "exception": {
    #           "stacktrace": [
    #             "TypeError: Value is not a valid email address: someone@@@@@gmail.com",
    #             "    at GraphQLScalarType.validate$1 (/home/richardimaoka/ghq/src/github.com/richardimaoka/tutorial-graphql-scalars/server/node_modules/graphql-scalars/index.js:917:15)",
    #             "    at completeLeafValue (/home/richardimaoka/ghq/src/github.com/richardimaoka/tutorial-graphql-scalars/server/node_modules/graphql/execution/execute.js:738:39)",
    #             "    at completeValue (/home/richardimaoka/ghq/src/github.com/richardimaoka/tutorial-graphql-scalars/server/node_modules/graphql/execution/execute.js:619:12)",
    #             "    at executeField (/home/richardimaoka/ghq/src/github.com/richardimaoka/tutorial-graphql-scalars/server/node_modules/graphql/execution/execute.js:489:19)",
    #             "    at executeFields (/home/richardimaoka/ghq/src/github.com/richardimaoka/tutorial-graphql-scalars/server/node_modules/graphql/execution/execute.js:413:20)",
    #             "    at completeObjectValue (/home/richardimaoka/ghq/src/github.com/richardimaoka/tutorial-graphql-scalars/server/node_modules/graphql/execution/execute.js:914:10)",
    #             "    at completeValue (/home/richardimaoka/ghq/src/github.com/richardimaoka/tutorial-graphql-scalars/server/node_modules/graphql/execution/execute.js:635:12)",
    #             "    at executeField (/home/richardimaoka/ghq/src/github.com/richardimaoka/tutorial-graphql-scalars/server/node_modules/graphql/execution/execute.js:489:19)",
    #             "    at executeFields (/home/richardimaoka/ghq/src/github.com/richardimaoka/tutorial-graphql-scalars/server/node_modules/graphql/execution/execute.js:413:20)",
    #             "    at executeOperation (/home/richardimaoka/ghq/src/github.com/richardimaoka/tutorial-graphql-scalars/server/node_modules/graphql/execution/execute.js:344:14)"
    #           ]
    #         }
    #       }
    #     }
    #   ],
    #   "data": {
    #     "me": {
    #       "emailAddress": null,
    #       "name": "Jason Summerwinter"
    #     }
    #   }
    # }
# argument type
#   Apollo Studio, send wrong type - error
#   Apollo Studio, send wrong format - error

run generate
npm start
