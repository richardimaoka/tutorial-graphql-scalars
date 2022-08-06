import {
  GraphQLResolveInfo,
  GraphQLScalarType,
  GraphQLScalarTypeConfig,
} from "graphql";
export type Maybe<T> = T | null;
export type InputMaybe<T> = Maybe<T>;
export type Exact<T extends { [key: string]: unknown }> = {
  [K in keyof T]: T[K];
};
export type MakeOptional<T, K extends keyof T> = Omit<T, K> & {
  [SubKey in K]?: Maybe<T[SubKey]>;
};
export type MakeMaybe<T, K extends keyof T> = Omit<T, K> & {
  [SubKey in K]: Maybe<T[SubKey]>;
};
/** All built-in and custom scalars, mapped to their actual values */
export type Scalars = {
  ID: string;
  String: string;
  Boolean: boolean;
  Int: number;
  Float: number;
  DateTime: any;
  EmailAddress: string;
  NonNegativeFloat: any;
  NonNegativeInt: any;
  PhoneNumber: any;
  PositiveFloat: any;
  PositiveInt: any;
  PostalCode: any;
  URL: any;
};

export type Person = {
  __typename?: "Person";
  ageInYears: Maybe<Scalars["PositiveInt"]>;
  birthDate: Maybe<Scalars["DateTime"]>;
  currentlyActiveProjects: Maybe<Scalars["NonNegativeInt"]>;
  emailAddress: Maybe<Scalars["EmailAddress"]>;
  heightInInches: Maybe<Scalars["PositiveFloat"]>;
  homePage: Maybe<Scalars["URL"]>;
  homePostalCode: Maybe<Scalars["PostalCode"]>;
  minimumHourlyRate: Maybe<Scalars["NonNegativeFloat"]>;
  name: Maybe<Scalars["String"]>;
  phoneNumber: Maybe<Scalars["PhoneNumber"]>;
};

export type Query = {
  __typename?: "Query";
  me: Maybe<Person>;
};

export type ResolverTypeWrapper<T> = Promise<T> | T;

export type ResolverWithResolve<TResult, TParent, TContext, TArgs> = {
  resolve: ResolverFn<TResult, TParent, TContext, TArgs>;
};
export type Resolver<TResult, TParent = {}, TContext = {}, TArgs = {}> =
  | ResolverFn<TResult, TParent, TContext, TArgs>
  | ResolverWithResolve<TResult, TParent, TContext, TArgs>;

export type ResolverFn<TResult, TParent, TContext, TArgs> = (
  parent: TParent,
  args: TArgs,
  context: TContext,
  info: GraphQLResolveInfo
) => Promise<TResult> | TResult;

export type SubscriptionSubscribeFn<TResult, TParent, TContext, TArgs> = (
  parent: TParent,
  args: TArgs,
  context: TContext,
  info: GraphQLResolveInfo
) => AsyncIterable<TResult> | Promise<AsyncIterable<TResult>>;

export type SubscriptionResolveFn<TResult, TParent, TContext, TArgs> = (
  parent: TParent,
  args: TArgs,
  context: TContext,
  info: GraphQLResolveInfo
) => TResult | Promise<TResult>;

export interface SubscriptionSubscriberObject<
  TResult,
  TKey extends string,
  TParent,
  TContext,
  TArgs
> {
  subscribe: SubscriptionSubscribeFn<
    { [key in TKey]: TResult },
    TParent,
    TContext,
    TArgs
  >;
  resolve?: SubscriptionResolveFn<
    TResult,
    { [key in TKey]: TResult },
    TContext,
    TArgs
  >;
}

export interface SubscriptionResolverObject<TResult, TParent, TContext, TArgs> {
  subscribe: SubscriptionSubscribeFn<any, TParent, TContext, TArgs>;
  resolve: SubscriptionResolveFn<TResult, any, TContext, TArgs>;
}

export type SubscriptionObject<
  TResult,
  TKey extends string,
  TParent,
  TContext,
  TArgs
> =
  | SubscriptionSubscriberObject<TResult, TKey, TParent, TContext, TArgs>
  | SubscriptionResolverObject<TResult, TParent, TContext, TArgs>;

export type SubscriptionResolver<
  TResult,
  TKey extends string,
  TParent = {},
  TContext = {},
  TArgs = {}
> =
  | ((
      ...args: any[]
    ) => SubscriptionObject<TResult, TKey, TParent, TContext, TArgs>)
  | SubscriptionObject<TResult, TKey, TParent, TContext, TArgs>;

export type TypeResolveFn<TTypes, TParent = {}, TContext = {}> = (
  parent: TParent,
  context: TContext,
  info: GraphQLResolveInfo
) => Maybe<TTypes> | Promise<Maybe<TTypes>>;

export type IsTypeOfResolverFn<T = {}, TContext = {}> = (
  obj: T,
  context: TContext,
  info: GraphQLResolveInfo
) => boolean | Promise<boolean>;

export type NextResolverFn<T> = () => Promise<T>;

export type DirectiveResolverFn<
  TResult = {},
  TParent = {},
  TContext = {},
  TArgs = {}
> = (
  next: NextResolverFn<TResult>,
  parent: TParent,
  args: TArgs,
  context: TContext,
  info: GraphQLResolveInfo
) => TResult | Promise<TResult>;

/** Mapping between all available schema types and the resolvers types */
export type ResolversTypes = {
  Boolean: ResolverTypeWrapper<Scalars["Boolean"]>;
  DateTime: ResolverTypeWrapper<Scalars["DateTime"]>;
  EmailAddress: ResolverTypeWrapper<Scalars["EmailAddress"]>;
  NonNegativeFloat: ResolverTypeWrapper<Scalars["NonNegativeFloat"]>;
  NonNegativeInt: ResolverTypeWrapper<Scalars["NonNegativeInt"]>;
  Person: ResolverTypeWrapper<Person>;
  PhoneNumber: ResolverTypeWrapper<Scalars["PhoneNumber"]>;
  PositiveFloat: ResolverTypeWrapper<Scalars["PositiveFloat"]>;
  PositiveInt: ResolverTypeWrapper<Scalars["PositiveInt"]>;
  PostalCode: ResolverTypeWrapper<Scalars["PostalCode"]>;
  Query: ResolverTypeWrapper<{}>;
  String: ResolverTypeWrapper<Scalars["String"]>;
  URL: ResolverTypeWrapper<Scalars["URL"]>;
};

/** Mapping between all available schema types and the resolvers parents */
export type ResolversParentTypes = {
  Boolean: Scalars["Boolean"];
  DateTime: Scalars["DateTime"];
  EmailAddress: Scalars["EmailAddress"];
  NonNegativeFloat: Scalars["NonNegativeFloat"];
  NonNegativeInt: Scalars["NonNegativeInt"];
  Person: Person;
  PhoneNumber: Scalars["PhoneNumber"];
  PositiveFloat: Scalars["PositiveFloat"];
  PositiveInt: Scalars["PositiveInt"];
  PostalCode: Scalars["PostalCode"];
  Query: {};
  String: Scalars["String"];
  URL: Scalars["URL"];
};

export interface DateTimeScalarConfig
  extends GraphQLScalarTypeConfig<ResolversTypes["DateTime"], any> {
  name: "DateTime";
}

export interface EmailAddressScalarConfig
  extends GraphQLScalarTypeConfig<ResolversTypes["EmailAddress"], any> {
  name: "EmailAddress";
}

export interface NonNegativeFloatScalarConfig
  extends GraphQLScalarTypeConfig<ResolversTypes["NonNegativeFloat"], any> {
  name: "NonNegativeFloat";
}

export interface NonNegativeIntScalarConfig
  extends GraphQLScalarTypeConfig<ResolversTypes["NonNegativeInt"], any> {
  name: "NonNegativeInt";
}

export type PersonResolvers<
  ContextType = any,
  ParentType extends ResolversParentTypes["Person"] = ResolversParentTypes["Person"]
> = {
  ageInYears: Resolver<
    Maybe<ResolversTypes["PositiveInt"]>,
    ParentType,
    ContextType
  >;
  birthDate: Resolver<
    Maybe<ResolversTypes["DateTime"]>,
    ParentType,
    ContextType
  >;
  currentlyActiveProjects: Resolver<
    Maybe<ResolversTypes["NonNegativeInt"]>,
    ParentType,
    ContextType
  >;
  emailAddress: Resolver<
    Maybe<ResolversTypes["EmailAddress"]>,
    ParentType,
    ContextType
  >;
  heightInInches: Resolver<
    Maybe<ResolversTypes["PositiveFloat"]>,
    ParentType,
    ContextType
  >;
  homePage: Resolver<Maybe<ResolversTypes["URL"]>, ParentType, ContextType>;
  homePostalCode: Resolver<
    Maybe<ResolversTypes["PostalCode"]>,
    ParentType,
    ContextType
  >;
  minimumHourlyRate: Resolver<
    Maybe<ResolversTypes["NonNegativeFloat"]>,
    ParentType,
    ContextType
  >;
  name: Resolver<Maybe<ResolversTypes["String"]>, ParentType, ContextType>;
  phoneNumber: Resolver<
    Maybe<ResolversTypes["PhoneNumber"]>,
    ParentType,
    ContextType
  >;
  __isTypeOf?: IsTypeOfResolverFn<ParentType, ContextType>;
};

export interface PhoneNumberScalarConfig
  extends GraphQLScalarTypeConfig<ResolversTypes["PhoneNumber"], any> {
  name: "PhoneNumber";
}

export interface PositiveFloatScalarConfig
  extends GraphQLScalarTypeConfig<ResolversTypes["PositiveFloat"], any> {
  name: "PositiveFloat";
}

export interface PositiveIntScalarConfig
  extends GraphQLScalarTypeConfig<ResolversTypes["PositiveInt"], any> {
  name: "PositiveInt";
}

export interface PostalCodeScalarConfig
  extends GraphQLScalarTypeConfig<ResolversTypes["PostalCode"], any> {
  name: "PostalCode";
}

export type QueryResolvers<
  ContextType = any,
  ParentType extends ResolversParentTypes["Query"] = ResolversParentTypes["Query"]
> = {
  me: Resolver<Maybe<ResolversTypes["Person"]>, ParentType, ContextType>;
};

export interface UrlScalarConfig
  extends GraphQLScalarTypeConfig<ResolversTypes["URL"], any> {
  name: "URL";
}

export type Resolvers<ContextType = any> = {
  DateTime: GraphQLScalarType;
  EmailAddress: GraphQLScalarType;
  NonNegativeFloat: GraphQLScalarType;
  NonNegativeInt: GraphQLScalarType;
  Person: PersonResolvers<ContextType>;
  PhoneNumber: GraphQLScalarType;
  PositiveFloat: GraphQLScalarType;
  PositiveInt: GraphQLScalarType;
  PostalCode: GraphQLScalarType;
  Query: QueryResolvers<ContextType>;
  URL: GraphQLScalarType;
};
