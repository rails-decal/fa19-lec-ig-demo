# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

10.times do |index|
  email = Faker::Internet.email
  password = Faker::Internet.password
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    bio: Faker::Quote.famous_last_words,
    email: email,
    password: password,
    password_confirmation: password
  )
  puts "Created user with #{email} and #{password}"
end

50.times do |index|
  Post.create!(
    user_id: Faker::Number.between(from: 1, to: User.count),
    caption: Faker::Quote.famous_last_words
  )
end

100.times do |index|
  Like.create!(
    user_id: Faker::Number.between(from: 1, to: User.count),
    post_id: Faker::Number.between(from: 1, to: Post.count)
  )
end
