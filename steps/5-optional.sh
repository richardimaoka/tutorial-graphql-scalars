#!/bin/sh

cd "$(dirname "$0")" || exit # REMOVE THIS IN aggregate.sh
cd ../ || exit               # REMOVE THIS IN aggregate.sh - cd to the git repository root


# ## 5. (Optional) Custom scalarであるEmailAddressの情報を復元するため、TypeScriptで独自型を利用する

# 本チュートリアル「2. graphql-scalarsをfield型に使った際の動作確認」の最後で、TypeScriptの型チェックを効かせて不正なメールアドレスの形式を検出するには、独自型の利用が必要なことを述べました。以下ではそのテクニックを実際に見ていきます。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```shell
git apply patches/a827496.patch # EmailAddressString type
# ```

# <details><summary>:white_check_mark: Result: 上記コマンドで独自型 type EmailAddressString を定義するため、src/myTypes.tsを作成します。</summary><div>

# ```typescript:src/myTypes.ts
# export type EmailAddressString = string & { __type: "EmailAddressString" };

# export const isEmailAddressString = (
#   str: string
# ): str is EmailAddressString => {
#   const EMAIL_ADDRESS_REGEX =
#     /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/;

#   return EMAIL_ADDRESS_REGEX.test(str);
# };
# ```

# ---

# </div></details>


# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```shell
npm install --save-dev @graphql-codegen/add 
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
