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
puts "Created #{User.count} users."

chuckType = Category.create(description: "Chuck Norris Facts")
nerdType = Category.create(description: "Nerd Jokes")
fakerType = Category.create(description: "Random Faker")
puts "Created #{Category.count} categories."

chuckSource = Source.create(description: "Chuck Norris DB", source: "http://www.icndb.com/api")
nerdSource = Source.create(description: "Oficial Jokes API", source: "https://github.com/15Dkatz/official_joke_api")
fakerSource = Source.create(description: "Wellington's mind using Faker", source: "https://github.com/stympy/faker")
puts "Created #{Source.count} sources."

10.times do
  joke = Joke.create(
      question: "What did #{Faker::Superhero.name} say to #{Faker::HarryPotter.character}?",
      answer: Faker::TheFreshPrinceOfBelAir.quote,
      source: fakerSource,
      category: fakerType)

      users.each { |u| Review.create(score: Faker::Number.between(1, 10), joke: joke, user: u)}
end
puts "Created #{Joke.count} jokes."

# Chuck Norris Jokes here
uri = URI('http://api.icndb.com/jokes/random/10')
response = Net::HTTP.get(uri)
chuckNorrisJokes = JSON.parse(response)['value']

chuckNorrisJokes.each do |cnjoke|
  joke = Joke.create(
      quote: cnjoke['joke'],
      source: chuckSource,
      category: chuckType)

      users.each { |u| Review.create(score: Faker::Number.between(1, 10), joke: joke, user: u)}
end
puts "Created #{Joke.count} jokes."

# Nerd Jokes here
uri = URI('https://08ad1pao69.execute-api.us-east-1.amazonaws.com/dev/random_ten')

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
puts "Created #{Joke.count} jokes."

puts "Created #{Review.count} review."
