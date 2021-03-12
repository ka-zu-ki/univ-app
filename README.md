# アプリの概要

オンライン授業で感じた大学ポータルサイトの問題点を改善したい、

ユーザー視点でもっと良くすることができるという思いから作りました。

Rails APIモード + Reactで作成
*デプロイの都合でフロントエンドのレポジトリを分離しています
https://github.com/ka-zu-ki/univ-app-front

# 問題点、改善点

- とにかく遅い
- ブラウザバックできない
- 出席回数がわからない
- UIが一昔前
- 多くの生徒が別途で時間割アプリをダウンロードしている
- オンライン授業での課題を管理できていない生徒が多数

# 解決策

SPA化してページ遷移を速くする

履修登録した授業を自動で時間割に表示する機能を作る

履修している授業ごとにTodoを作成できる機能を作る

# 使用技術

## バックエンド

- Ruby 2.6.6
- Ruby on Rails 6.1.3
- gem 'rack-cors'
- gem 'bcrypt'
- gem 'faker'
- gem 'active_model_serializers'
- gem 'pry-rails'

## フロントエンド

- Javascript(ES6)
- React 17.0.1
- hooks
  - useState
  - useEffect
  - useReducer
  - useContext
- axios 0.21.1
- emotion 11.1.5
- react-router-dom 5.2.0
- react-hook-form 6.15.1

## データベース

PostgreSQL

## デプロイ

Heroku(バックエンド）

Vercel(フロントエンド）

# 機能

-  ログイン機能（cookie, session）
-  授業一覧
-  履修登録
-  Todo（CRUD)

# 今後追加したい機能

-  テスト（現在進行中）
-  出席カウント
-  Googleカレンダー同期
-  授業検索機能
-  レポート提出機能


# 今後取り入れたい、挑戦したい技術

-  Redux Toolkit
-  Typescript
-  AWS
-  Docker
