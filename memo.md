# form について 6/18

- local:true にしないと ajax でフォームが送信される
- HTml の form で post ,get 以外するには `<input type="hidden name="_method" balue:patch>`みたいにするみたい。
- rails の form_with では model,scope,method,url を指定できる。

  - scope はルーティングで名前空間が指定されてれば利用らしい。
  - model なら存在するかどうかでいい感じに routing してくれるっぽい。

  ```

        /目標→{
            "_method"=>"patch",
                "authenticity_token"=>"c2Is0J6mKuAuybKUFOL+/m0pE0Wo1KZ+8+7HYjwlR0aDFRyX2KOe8cdYuVvQQrma+doc2Xc/ITNtyS4ezpgJxw==",
                "restaurant"=>{
                    "name"=>"異国龍",
                    "zip"=>"305-0005",
                    "address"=>"つくば市天久保2",
                    "tel"=>"2525262642",
                    "commit"=>"登録",
                    },
                "id"=>"4"
                }

      /動かない→ urlがおかしい
      /= form_with model: @restaurant,url:{action: :update},local: true do |f|

      /動かない→urlにタイポ・
      /= form_with url:{"restauant/#{@restaurant.id}",method:put},local: true do |f|

      /レンダリングはできるけど/restaurants/1/restauant/1にputしてしまう
      /= form_with(model: @restaurant, url:"restauant/#{@restaurant.id}", scope: :put, local: true) do |f|

      /動かなくはない(model+scope) ただしput:{name:~}みたいにパラメーターになってしまう
      /= form_with(model: @restaurant, scope: :put, local: true) do |f|

      /動く(model+method)
      /= form_with(model: @restaurant, method: :put, local: true) do |f|

      /動く(modelだけ)
      /= form_with(model: @restaurant,local: true) do |f|

      /動かない(urlだけ)→/restaurants/:id にpostするルーティングがない
      /= form_with(url:"/restaurants/#{@restaurant.id}" ,local: true) do |f|

      /動かなくはない。(url+methodだけ)restaurantでくくられない
      /= form_with(url:"/restaurants/#{@restaurant.id}",method: :patch ,local: true) do |f|

      /動いた(url+method+scope)
      /= form_with(url:"/restaurants/#{@restaurant.id}",method: :patch,scope: :restaurant ,local: true) do |f|
  ```

# redirect6/18

`redirect_to restaurant_path`したときにその時扱ってる restaurant の id で`/restaurants/:id`やってくれる.
id はなんて変数に入ってるんだ??
restaurant_path(:id)って書き方もあるっぽい

# JS パッケージ管理 6/19

- npm
- yarn
  どっちも同じ package.json が使える。yarn の方が安全で速い

yarn や npm install の時、-g を付けないとローカルインストール。(--save-dev はローカルの強調表現?)

# CSS フレームワークについて

html 側で CDN で読み込んだり、yarn で node モジュールとして読み込んだり gem としてインストールしたりどれをすればいいんだ？？  
rails6 なら webpack 使うべきらしい。なぜ？

## マテリアルデザインフレームワーク

Google 公式の*Material Components for the Web*か*Materialize*か
Materialize の方が人気で情報が多くて入門向け。なんで公式より人気なんだ?

# webpack

`app/javascript/packs/application.js`がエントリーポイント。ここで import する。
view の head で読み込み。ファイル名を第一引数で拡張子なしで書くみたい。  
→application.css と application.scss みたいに複数あったらどうなる？
→scss のみ読み込まれた

```
 = stylesheet_pack_tag 'application', media: 'all', 'data-turbolinks-track': 'reload'
    = javascript_pack_tag 'application', 'data-turbolinks-track': 'reload'
```

# attr_accessor :remember_token とは

動的に型が変わるオブジェクト属性を定義

# update_attribute

update_attribute は update のエイリアスらしい。  
save を呼び出している。

# is_password がよくわからん

`BCrypt::Password.new(remember_digest).is_password?(remember_token)`  
どゆこと?????調べても rails tuto ばっか出てくるし実用的じゃないのか？？？
