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

50.times do
  joke = Joke.create(
      question: "What did #{Faker::Superhero.name} say to #{Faker::HarryPotter.character}?",
      answer: Faker::TheFreshPrinceOfBelAir.quote,
      source: fakerSource,
      category: fakerType)

      users.each { |u| Review.create(score: Faker::Number.between(1, 10), joke: joke, user: u)}
end

# Nerd Jokes here
uri = URI('https://08ad1pao69.execute-api.us-east-1.amazonaws.com/dev/random_ten')
5.times do
  response = Net::HTTP.get(uri)
  nerdJokes = JSON.parse(response)

  nerdJokes.each do |njoke|
    joke = Joke.create(
        question: njoke['setup'],
        answer: njoke['punchline'],
        source: nerdSource,
        category: nerdType)

        users.each { |u| Review.create(score: Faker::Number.between(1, 10), joke: joke, user: u)}
  end
end

# Chuck Norris Jokes here
uri = URI('http://api.icndb.com/jokes/random/50')
response = Net::HTTP.get(uri)
chuckNorrisJokes = JSON.parse(response)['value']

chuckNorrisJokes.each do |cnjoke|
  joke = Joke.create(
      quote: cnjoke['joke'],
      source: chuckSource,
      category: chuckType)

      users.each { |u| Review.create(score: Faker::Number.between(1, 10), joke: joke, user: u)}
end

puts "Created #{User.count} users."
puts "Created #{Category.count} categories."
puts "Created #{Source.count} sources."
puts "Created #{Joke.count} jokes."
puts "Created #{Review.count} review."
