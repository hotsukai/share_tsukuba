# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Restaurant.create(name: 'トタンコットン', zip: 'hoge', address: 'hogehoge', tel: '000-0000-0000')
Restaurant.create(name: 'むじゃき', zip: 'hoge', address: 'hogehoge', tel: '000-0000-0000')
Restaurant.create(name: 'cafe4', zip: 'hoge', address: 'hogehoge', tel: '000-0000-0000')
Restaurant.create(name: '芛堂寺', zip: 'hoge', address: 'hogehoge', tel: '000-0000-0000')
Restaurant.create(name: '異国龍', zip: 'hoge', address: 'hogehoge', tel: '000-0000-0000')
Restaurant.create(name: 'ガーリーショット', zip: 'hoge', address: 'hogehoge', tel: '000-0000-0000')

User.create!(name: 'Example User',
             email: 'example@railstutorial.org',
             password: 'foobar',
             password_confirmation: 'foobar',
             admin: true)
