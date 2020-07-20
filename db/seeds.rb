# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Spot.create(name: "トタンコットン", zip: "hoge", address: "hogehoge", tel: "000-0000-0000")
Spot.create(name: "cafe4", zip: "hoge", address: "hogehoge", tel: "000-0000-0000")
Spot.create(name: "sora cafe", zip: "hoge", address: "hogehoge", tel: "000-0000-0000")
Spot.create(name: "Clematis", zip: "hoge", address: "hogehoge", tel: "000-0000-0000")
Spot.create(name: "moikka", zip: "hoge", address: "hogehoge", tel: "000-0000-0000")
Spot.create(name: "木村園", zip: "hoge", address: "hogehoge", tel: "000-0000-0000")
Spot.create(name: "むじゃき", zip: "hoge", address: "hogehoge", tel: "000-0000-0000")
Spot.create(name: "芛堂寺", zip: "hoge", address: "hogehoge", tel: "000-0000-0000")
Spot.create(name: "異国龍", zip: "hoge", address: "hogehoge", tel: "000-0000-0000")
Spot.create(name: "達郎", zip: "hoge", address: "hogehoge", tel: "000-0000-0000")
Spot.create(name: "七福亭", zip: "hoge", address: "hogehoge", tel: "000-0000-0000")
Spot.create(name: "俺の生きる道", zip: "hoge", address: "hogehoge", tel: "000-0000-0000")
Spot.create(name: "ZEYO", zip: "hoge", address: "hogehoge", tel: "000-0000-0000")

Spot.create(name: "ガーリーショット", zip: "hoge", address: "hogehoge", tel: "000-0000-0000")
Spot.create(name: "うまいもん太陽", zip: "hoge", address: "hogehoge", tel: "000-0000-0000")
Spot.create(name: "", zip: "hoge", address: "hogehoge", tel: "000-0000-0000")

Spot.create(name: "あすかて食堂", zip: "hoge", address: "hogehoge", tel: "000-0000-0000")
Spot.create(name: "くい亭", zip: "hoge", address: "hogehoge", tel: "000-0000-0000")
Spot.create(name: "好来屋", zip: "hoge", address: "hogehoge", tel: "000-0000-0000")
Spot.create(name: "HARE GOHAN", zip: "hoge", address: "hogehoge", tel: "000-0000-0000")
Spot.create(name: "フライパン", zip: "hoge", address: "hogehoge", tel: "000-0000-0000")
Spot.create(name: "RanRan", zip: "hoge", address: "hogehoge", tel: "000-0000-0000")
Spot.create(name: "誠寿司", zip: "hoge", address: "hogehoge", tel: "000-0000-0000")
Spot.create(name: "まつもと", zip: "hoge", address: "hogehoge", tel: "000-0000-0000")

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n + 1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
3.times do |n|
  content = "sample folder #{n}"
  description = "sample text #{n}"
  users.each { |user| user.folders.create!(name: content, description: description) }
end

users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

folders = Folder.order(:created_at).take(6)
spots = Spot.all
spots.sample(5).each do |spot|
  folders.each { |folder| folder.spots << spot }
end
