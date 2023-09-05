# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
GameParticipation.destroy_all
GameTopic.destroy_all
Guess.destroy_all
Hint.destroy_all
Question.destroy_all
User.destroy_all
Game.destroy_all
Topic.destroy_all

# Seed Users
users_data = [
  { first_name: "Marta", last_name: "Doe", username: "marta", email: "marta.doe@example.com", password: "123456", age: 14 },
  { first_name: "Paula", last_name: "Doe", username: "paula", email: "paula.doe@example.com", password: "123456", age: 18 },
  { first_name: "Karl", last_name: "Doe", username: "karl", email: "karl.doe@example.com", password: "123456", age: 24 },
  { first_name: "Steven", last_name: "Doe", username: "steven", email: "steven.doe@example.com", password: "123456", age: 40 }
]

users_data.each do |user_data|
  User.create!(user_data)
end

topics_data = [
  { name: "Chemical Elements and Symbols", category: "Chemistry" },
  { name: "Literary Classics", category: "Literature" },
  { name: "Space Exploration Milestones", category: "Astronomy" },
  { name: "World Capitals", category: "Geography" },
  { name: "Famous Artists", category: "Art and Culture" },
  { name: "Human Anatomy and Systems", category: "Science" },
  { name: "Biology Basics", category: "Biology" },
  { name: "Ancient Civilizations", category: "History" },
  { name: "Historical Events of the 20th Century", category: "History" },
  { name: "Mathematical Puzzles", category: "Mathematics" },
  { name: "Advanced Mathematical Concepts", category: "Mathematics" },
  { name: "Classical Music Composers", category: "Music" },
  { name: "Movie Quotes", category: "Film and Television" },
  { name: "World Religions and Belief Systems", category: "Religion and Philosophy" },
  { name: "Famous Inventors", category: "Science and Technology" },
  { name: "Modern Technology and Innovations", category: "Science and Technology" },
  { name: "Literary Quotes", category: "Literature" },
  { name: "mythological characters", category: "Mythology" },
  { name: "Famous Paintings", category: "Art and Culture" }
]

topics_data.each do |topic_data|
  Topic.create!(topic_data)
end
