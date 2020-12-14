# Rails ERB Practice 01
- `rails new` with Simpacker+Parcel by Rails6.0+MySQL8.0 sample

## Rails README
- Ruby version
 - 2.6
- Database creation
  - `rails db:create`
  - `rails db:migrate`
- Deployment instructions
  - `docker-compose up -d`

## Reference sources
- docker-compose 下で rails new して Rails6+Simpacker+Parcel 環境を作る | 北山淳也 | zenn
  - https://zenn.dev/junki555/articles/b8843631113c2d6be01a
- 【Rails/JS】Simpackerを使って、お手軽にモダンな開発環境を整える | しきゆらの備忘録
  - https://shikiyura.com/2019/11/rails-with-parcel/
- Webpackerはもう要らない〜 Simpacker | Qiita
  - https://qiita.com/park-jh/items/65a278f206773179e922
- Simpacker: Rails と webpack をもっとシンプルにインテグレーションしたいのです | クックパッド開発者ブログ
  - https://techlife.cookpad.com/entry/2019/07/08/100000
- Simpacker parcel example | hokaccha / simpacker | GitHub
  - https://github.com/hokaccha/simpacker/tree/master/example/parcel
- mugi-uno / parcel-plugin-bundle-manifest | GitHub
  - https://github.com/mugi-uno/parcel-plugin-bundle-manifest
- CLI | Parcel
  - https://ja.parceljs.org/cli.html
- Webpacker移行ガイド / Migrating from Webpacker to Simpacker | SlideShare
  - https://speakerdeck.com/iguchi1124/migrating-from-webpacker-to-simpacker

## add TailwindCSS
### memo
yarn add postcss postcss-cli tailwindcss postcss-modules postcss-nested autoprefixer --dev

### build
`yarn parcel build --out-dir public/packs --public-url /packs app/assets/stylesheets/**.css --no-content-hash --no-source-maps`

## Reference sources
- Parcel + TailwindCSS(+Simpacker) でドハマりした話 | 北山淳也 | zenn
  - https://zenn.dev/junki555/articles/de8a9df90d50e2
- parcel ~ はじめの一歩 ~ | Qiita
  - https://qiita.com/kunio_takahashi/items/550a3fec1a4d3c1b4665
- PostCSSもサクッと導入！話題のビルドツール「Parcel」を試してみた | ペパボテックブログ
  - https://tech.pepabo.com/2018/01/11/hands-on-parcel/


## add devise
### memo
Gemfile
```
gem 'bcrypt', '~> 3.1.7'
# Devise
gem 'devise'
gem 'omniauth-twitter'
gem 'public_uid'
```

```bash
bundle install
bundle exec rails generate devise:install
```

config/environments/development.rb
```rb
  # Devise mailer setting
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
```

```bash
bundle exec rails g controller Top index
      create  app/controllers/top_controller.rb
       route  get 'top/index'
      invoke  erb
      create    app/views/top
      create    app/views/top/index.html.erb
      invoke  helper
      create    app/helpers/top_helper.rb
      invoke  assets
      invoke    css
      create      app/assets/stylesheets/top.css
```

app/views/layouts/application.html.erb
```html
<!DOCTYPE html>
<html>
  <head>
    <title>App</title>
    <%= csrf_meta_tags %>
    <%= csp_meta_tag %>

    <%= stylesheet_link_tag    'application', media: 'all' %>
  </head>

  <body>
    <!-- ここを追加 -->
    <p class="notice"><%= notice %></p>
    <p class="alert"><%= alert %></p>
    <!-- ここを追加 -->

    <%= yield %>
  </body>
</html>
```

```bash
bundle exec rails g devise:views
      invoke  Devise::Generators::SharedViewsGenerator
      create    app/views/devise/shared
      create    app/views/devise/shared/_error_messages.html.erb
      create    app/views/devise/shared/_links.html.erb
      invoke  form_for
      create    app/views/devise/confirmations
      create    app/views/devise/confirmations/new.html.erb
      create    app/views/devise/passwords
      create    app/views/devise/passwords/edit.html.erb
      create    app/views/devise/passwords/new.html.erb
      create    app/views/devise/registrations
      create    app/views/devise/registrations/edit.html.erb
      create    app/views/devise/registrations/new.html.erb
      create    app/views/devise/sessions
      create    app/views/devise/sessions/new.html.erb
      create    app/views/devise/unlocks
      create    app/views/devise/unlocks/new.html.erb
      invoke  erb
      create    app/views/devise/mailer
      create    app/views/devise/mailer/confirmation_instructions.html.erb
      create    app/views/devise/mailer/email_changed.html.erb
      create    app/views/devise/mailer/password_change.html.erb
      create    app/views/devise/mailer/reset_password_instructions.html.erb
      create    app/views/devise/mailer/unlock_instructions.html.erb
```

```bash
bundle exec rails g devise User
      invoke  active_record
      create    db/migrate/20201206114053_devise_create_users.rb
      create    app/models/user.rb
      insert    app/models/user.rb
       route  devise_for :users
```

```bash
bundle exec rails g devise UserDatabaseAuthentication
      invoke  active_record
      create    db/migrate/20201207031626_devise_create_user_database_authentications.rb
      create    app/models/user_database_authentication.rb
      insert    app/models/user_database_authentication.rb
       route  devise_for :user_database_authentications
bundle exec rails g devise UserRegistration
      invoke  active_record
      create    db/migrate/20201207040342_devise_create_user_registrations.rb
      create    app/models/user_registration.rb
      insert    app/models/user_registration.rb
       route  devise_for :user_registrations
```

change
db/migrate/20201206114053_devise_create_users.rb
db/migrate/20201207031626_devise_create_user_database_authentications.rb
db/migrate/20201207040342_devise_create_user_registrations.rb

change
app/models/user.rb
app/models/user/database_authentication.rb
app/models/user/registration.rb

memo
```
-- ALTER TABLE `user_database_authentications` ADD CONSTRAINT fk_hoge FOREIGN KEY (`user_public_uid`) REFERENCES `users` (`public_uid`);

ALTER TABLE `user_database_authentications` DROP FOREIGN KEY fk_hoge;
```

```
bundle exec rails g controller User::Registrations show create
      create  app/controllers/user/registrations_controller.rb
       route  namespace :user do
  get 'registrations/show'
  get 'registrations/create'
end
      invoke  erb
      create    app/views/user/registrations
      create    app/views/user/registrations/show.html.erb
      create    app/views/user/registrations/create.html.erb
      invoke  helper
      create    app/helpers/user/registrations_helper.rb
      invoke  assets
      invoke    css
      create      app/assets/stylesheets/user/registrations.css
```

access
http://localhost:3000/registrations/confirmation/new

confirm letter-opener
http://localhost:3000/letter_opener

and access "Confirm my account"
sign-up name, email and password(password must be 6characters)

## devise Reference sources
- パーフェクトRails著者が解説するdeviseの現代的なユーザー認証のモデル構成について - joker1007’s diary
  - https://joker1007.hatenablog.com/entry/2020/08/17/141621
  - https://github.com/joker1007/devise_sample
- 記事紹介：devise のモデルを分割して単一責任の原則を導入する | 北山淳也 | zenn
  - https://zenn.dev/junki555/articles/0b211d19a294ad
- gem devise の module 翻訳 | 北山淳也 | zenn
  - https://zenn.dev/junki555/articles/dc41580eb3daec
- devise の複数モデル管理を試みる | Octo's blog
  - https://ccbaxy.xyz/blog/2020/03/20/ruby33/#devise-nobiyuwozuo-cheng
- Rails deviseの使い方（rails6版） | Qiita
  - https://qiita.com/cigalecigales/items/16ce0a9a7e79b9c3974e
- Rails5 Deviseのログイン判定 | ゆるりエンジニア
  - https://yuruli.info/rails5-how-to-get-frequency-of-user-login/
- deviseのTwitterログイン時はメール認証とメール送信をスキップする | Qiita
  - https://qiita.com/tegnike/items/a655c5ee7f71fb5bef08
- devise | GitHub
  - https://github.com/heartcombo/devise
- 【Rails】deviseの使い方をマスターしてログイン認証機能を実装しよう！ | Pikawaka
  - https://pikawaka.com/rails/devise

## public_uid Reference sources
- PublicUid | GitHub
  - https://github.com/equivalent/public_uid
- 【Rails6】deviseで会員登録時に乱数（ランダムな文字列）を生成 | GitHub
  - https://asalworld.com/1472/
- 【Rails】URLでidの代わりにランダムな文字列を表示させる | Qiita
  - https://qiita.com/at-946/items/03a5d03c8865ac4cbd2c
- Railsで主キーをid以外に設定し、ほかのテーブルとアソシエーションを結ぶ | Qiita
  - https://qiita.com/tanutanu/items/6c53b5290eaa9bf905d3
- 主キーがid以外のテーブルを外部キーに設定する方法 | きまぐれ備忘録
  - https://shara3.blogspot.com/2018/01/rails-id.html
