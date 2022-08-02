#!/bin/sh

cd "$(dirname "$0")" || exit # REMOVE THIS IN aggregate.sh
cd ../ || exit               # REMOVE THIS IN aggregate.sh - cd to the git repository root

# npm install graphql-scalars
# EmailAddress - schema.gql, data/Query.json, Apollo Studio
#   override in index.ts, and return 10 -> error https://github.com/richardimaoka/tutorial-graphql-scalars/commit/5edea8ed55cf85d145edfc3c36746a74378aa148
#   config.yml to set string -> static type checking! https://github.com/richardimaoka/tutorial-graphql-scalars/commit/5edea8ed55cf85d145edfc3c36746a74378aa148
        # ![2022-08-03_00h20_53.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/75738/25250495-3c88-b8e3-20f5-c89dca067c1e.png)
        # (property) emailAddress: Resolver<Maybe<ResolverTypeWrapper<string>>, Person, LoadingDataContext, {}>
        # Type '(parent: Person, _args: {}, _context: LoadingDataContext, _info: GraphQLResolveInfo) => number' is not assignable to type 'Resolver<Maybe<ResolverTypeWrapper<string>>, Person, LoadingDataContext, {}>'.
        #   Type '(parent: Person, _args: {}, _context: LoadingDataContext, _info: GraphQLResolveInfo) => number' is not assignable to type 'ResolverFn<Maybe<ResolverTypeWrapper<string>>, Person, LoadingDataContext, {}>'.
        #     Type 'number' is not assignable to type 'Maybe<ResolverTypeWrapper<string>> | Promise<Maybe<ResolverTypeWrapper<string>>>'.ts(2322)
        # graphql.ts(170, 3): The expected type comes from property 'emailAddress' which is declared here on type 'PersonResolvers<LoadingDataContext, Person>'
#   however, returning a string with wrong-format passes static typing...

# argument type
#   Apollo Studio, send wrong type - error
#   Apollo Studio, send wrong format - error

run generate
npm start
