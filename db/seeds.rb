# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Review.destroy_all
User.destroy_all
Joke.destroy_all
Category.destroy_all
Source.destroy_all

5.times do
  User.create(
      name: Faker::Name.name,
      email: Faker::Internet.email)
end

users = User.all

chuckType = Category.create(description: "Chuck Norris Facts")
nerdType = Category.create(description: "Nerd Jokes")
fakerType = Category.create(description: "Random Faker")

chuckSource = Source.create(description: "Chuck Norris DB", source: "http://www.icndb.com/api")
nerdSource = Source.create(description: "Oficial Jokes API", source: "https://github.com/15Dkatz/official_joke_api")
fakerSource = Source.create(description: "Wellington's mind using Faker", source: "https://github.com/stympy/faker")

20.times do
  joke = Joke.create(
      question: "What did #{Faker::Superhero.name} say to #{Faker::HarryPotter.character}?",
      answer: Faker::TheFreshPrinceOfBelAir.quote,
      source: fakerSource,
      category: fakerType)

      users.each { |u| Review.create(score: Faker::Number.between(1, 10), joke: joke, user: u)}
end

# Chuck Norris Jokes here

# Nerd Jokes here

puts "Created #{User.count} users."
puts "Created #{Category.count} categories."
puts "Created #{Source.count} sources."
puts "Created #{Joke.count} jokes."
puts "Created #{Review.count} review."
