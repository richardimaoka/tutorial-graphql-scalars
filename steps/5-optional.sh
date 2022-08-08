#!/bin/sh

cd "$(dirname "$0")" || exit # REMOVE THIS IN aggregate.sh
cd ../ || exit               # REMOVE THIS IN aggregate.sh - cd to the git repository root


# ## 5. (Optional) Custom scalarであるEmailAddressの情報を復元するため、TypeScriptで独自型を利用する

# 本チュートリアル「2. graphql-scalarsをfield型に使った際の動作確認」の最後で、TypeScriptの型チェックを効かせて不正なメールアドレスの形式を検出するには、独自型の利用が必要なことを述べました。以下ではそのテクニックを実際に見ていきます。

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```shell
git apply patches/2aa8329.patch # EmailAddressString type
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
git apply patches/e6f57b6.patch # Use EmailAddressString in codegen.yml
# ```


# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```shell
git apply patches/fdf1ea5.patch # emailAddress does not allow plain string
# ```

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```shell
git apply patches/8d95b4f.patch # email is validated near the database
# ```

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```shell
git apply patches/6e3ea45.patch # wrong format email address
# ```

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```shell
git apply patches/f28a02e.patch # correct email format
# ```

# :large_orange_diamond: Action: 以下のコマンドを入力してください。

# ```shell
git apply patches/3420df7.patch # revert back index.ts
# ```
