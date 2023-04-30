# SUMMARY
- 俺用設定ファイル管理リポジトリ

## vim
- 基本的にはNeoVimを使う

### 手順
1. ```git clone このリポジトリ```
2. クローンしたこのリポジトリのルートで```git submodule update```すると、dein.vimが落ちてくる
3. ```source setup.sh```で環境変数の設定と設定ファイルへのエイリアスを作る
4. dein.vimを使って管理しているライブラリの導入を行う為、以下の手順を実施する
    ```
    1. nvim（この時点で一部のライブラリの導入が始まるかも)  
       もし導入されたら5番に飛ぶ
    2. :UpdateRemotePlugins
    3. :source ~/.vimrc でリロード
    4. nvimを再起動すると、dein.vimで管理しているライブラリの導入が開始されるはず
    5. 各ライブラリが動作する(Pythonでの入力補完とか)ことが確認できたらOK
    ```

### トラブルシューティング的な
- TABでの候補選択ができない
    - nvimを開いて```source ~/.vimrc```すると大抵直る
- ライブラリの格納先を変えたのに、nvimが古いパスを見てしまう
    - :UpdateRemotePluginすれば多分直る
