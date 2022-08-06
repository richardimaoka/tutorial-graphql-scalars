#!/bin/sh

cd "$(dirname "$0")" || exit # REMOVE THIS IN aggregate.sh
cd ../ || exit               # REMOVE THIS IN aggregate.sh - cd to the git repository root

git apply # restore the EmailAddress information from the string type in JavaScript

# if you use a text schema definition, you can't use ScalrNameTypeDefinition

# nested structure
#   https://www.graphql-scalars.dev/docs/quick-start
#   type Person {
#     birthDate: DateTime
#     ageInYears: PositiveInt
#     heightInInches: PositiveFloat
#     minimumHourlyRate: NonNegativeFloat
#     currentlyActiveProjects: NonNegativeInt
#     email: EmailAddress
#     homePage: URL
#     phoneNumber: PhoneNumber
#     homePostalCode: PostalCode
#    }
#
#    or types for realistic apps, like Reviewer and Store, etc

# many more scalar types

# if you use .gql schema file, you can't use ScalrNameTypeDefinition

npm