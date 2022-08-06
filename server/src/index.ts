import { ApolloServer, gql } from "apollo-server";
import * as fs from "fs";
import {
  DateTimeResolver,
  EmailAddressResolver,
  NonNegativeFloatResolver,
  NonNegativeIntResolver,
  PhoneNumberResolver,
  PositiveFloatResolver,
  PositiveIntResolver,
  PostalCodeResolver,
  URLResolver,
} from "graphql-scalars";
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
  },
  Person: {
    name(parent, _args, _context, _info) {
      return parent.name;
    },
    birthDate(parent, _args, _context, _info) {
      return parent.birthDate;
    },
    ageInYears(parent, _args, _context, _info) {
      return parent.ageInYears;
    },
    heightInInches(parent, _args, _context, _info) {
      return parent.heightInInches;
    },
    minimumHourlyRate(parent, _args, _context, _info) {
      return parent.minimumHourlyRate;
    },
    currentlyActiveProjects(parent, _args, _context, _info) {
      return parent.currentlyActiveProjects;
    },
    emailAddress(parent, _args, _context, _info) {
      return parent.emailAddress;
    },
    homePage(parent, _args, _context, _info) {
      return parent.homePage;
    },
    phoneNumber(parent, _args, _context, _info) {
      return parent.phoneNumber;
    },
    homePostalCode(parent, _args, _context, _info) {
      return parent.homePostalCode;
    },
  },
  DateTime: DateTimeResolver,
  PositiveInt: PositiveIntResolver,
  PositiveFloat: PositiveFloatResolver,
  NonNegativeFloat: NonNegativeFloatResolver,
  NonNegativeInt: NonNegativeIntResolver,
  EmailAddress: EmailAddressResolver,
  URL: URLResolver,
  PhoneNumber: PhoneNumberResolver,
  PostalCode: PostalCodeResolver,
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
