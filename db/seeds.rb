# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Spot.create(name: 'トタンコットン', zip: 'hoge', address: 'hogehoge', tel: '000-0000-0000')
Spot.create(name: 'むじゃき', zip: 'hoge', address: 'hogehoge', tel: '000-0000-0000')
Spot.create(name: 'cafe4', zip: 'hoge', address: 'hogehoge', tel: '000-0000-0000')
Spot.create(name: '芛堂寺', zip: 'hoge', address: 'hogehoge', tel: '000-0000-0000')
Spot.create(name: '異国龍', zip: 'hoge', address: 'hogehoge', tel: '000-0000-0000')
Spot.create(name: 'ガーリーショット', zip: 'hoge', address: 'hogehoge', tel: '000-0000-0000')

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n + 1}@railstutorial.org"
  password = 'password'
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end

User.create!(name: '管理者 ほつみちゃんねる',
             email: 'admin@admin.admin',
             password: 'foobar',
             password_confirmation: 'foobar',
             admin: true)

users = User.order(:created_at).take(6)
50.times do
  content = 'folder title sample'
  users.each { |user| user.folders.create!(name: content) }
end
