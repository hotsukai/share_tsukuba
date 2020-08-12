# シェアつくば

## このアプリについて

- rails の練習のために制作。
- おすすめスポットをまとめたフォルダ単位で共有することができる。
- アプリ内でユーザーをフォローすることでフォロー中のユーザーのフォルダがタイムラインに流れてくる。

## 動作方法

```
docker-compose build
docker-compose run web yarn install
docker-compose run web rails db:migrate:reset
docker-compose up
```
