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
`yarn parcel build --out-dir public/packs --public-url /packs app/assets/stylesheets/**.css`

## Reference sources
- Parcel + TailwindCSS(+Simpacker) でドハマりした話 | 北山淳也 | zenn
  - https://zenn.dev/junki555/articles/de8a9df90d50e2
- parcel ~ はじめの一歩 ~ | Qiita
  - https://qiita.com/kunio_takahashi/items/550a3fec1a4d3c1b4665
- PostCSSもサクッと導入！話題のビルドツール「Parcel」を試してみた | ペパボテックブログ
  - https://tech.pepabo.com/2018/01/11/hands-on-parcel/
