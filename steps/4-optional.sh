#!/bin/sh

cd "$(dirname "$0")" || exit # REMOVE THIS IN aggregate.sh
cd ../ || exit               # REMOVE THIS IN aggregate.sh - cd to the git repository root

git apply # restore the EmailAddress information from the string type in JavaScript

# if you use a text schema definition, you can't use ScalrNameTypeDefinition

# Store and Reviewer structure

# many more scalar types

