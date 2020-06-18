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
