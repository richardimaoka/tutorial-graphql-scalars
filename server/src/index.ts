import { ApolloServer, gql } from "apollo-server";
import * as fs from "fs";
import { CountryCodeResolver, EmailAddressResolver } from "graphql-scalars";
import { Query, Resolvers } from "./generated/graphql";

const typeDefs = gql`
  ${fs.readFileSync(__dirname.concat("/../schema.gql"), "utf8")}
`;

interface LoadingDataContext {
  Query: Query;
}

const resolvers: Resolvers<LoadingDataContext> = {
  Query: {
    me(_parent, _args, context, _info) {
      return context.Query.me;
    },
    search(_parent, args, context, _info) {
      const countryString = args.country;
      console.log(countryString);
      return context.Query.search;
    },
  },
  Person: {
    name(parent, _args, _context, _info) {
      return parent.name;
    },
    emailAddress(parent, _args, _context, _info) {
      return parent.emailAddress;
    },
    country(parent, _args, _context, _info) {
      return parent.country;
    },
  },
  EmailAddress: EmailAddressResolver,
  CountryCode: CountryCodeResolver,
};

const readJsonFile = async (relativeFileName: string): Promise<any> => {
  const jsonDataFile = __dirname.concat(relativeFileName);
  const fileContent = await fs.promises.readFile(jsonDataFile, "utf8");
  const jsonData = JSON.parse(fileContent);
  return jsonData;
};

const server = new ApolloServer({
  typeDefs,
  resolvers,
  context: async ({ req }: any) => {
    try {
      const queryData: LoadingDataContext = await readJsonFile(
        "/../data/Query.json"
      );
      return { Query: queryData };
    } catch (err) {
      console.log("***ERROR OCURRED***");
      console.log(err);
      throw new Error("internal error happened!!");
    }
  },
});

// The  method launches a web server.
server.listen().then(({ url }) => {
  console.log();
});
