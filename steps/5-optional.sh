#!/bin/sh

cd "$(dirname "$0")" || exit # REMOVE THIS IN aggregate.sh
cd ../ || exit               # REMOVE THIS IN aggregate.sh - cd to the git repository root


# ## 5. 

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```shell
npm install --save-dev @graphql-codegen/add 
# ```

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```shell
git apply patches/a827496.patch # EmailAddressString type
# ```

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```shell
git apply patches/3288f62.patch # Use EmailAddressString in codegen.yml
# ```

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```shell
git apply patches/04ba80e.patch # emailAddress does not allow plain string
# ```

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```shell
git apply patches/f97f618.patch # working
# ```

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```shell
git apply patches/dfeb0f2.patch # wrong format email is validated near the database
# ```

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```shell
git apply patches/9cf4c7d.patch # correct email format
# ```

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```shell
git apply patches/3c89889.patch # make search argument required
# ```

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```shell
git apply patches/061847a.patch # revert back index.ts
# ```
