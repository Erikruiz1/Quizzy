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
  { name: "Travelling", category: "Leisure" }
]

topics_image_uris = [
  "https://plus.unsplash.com/premium_photo-1673892648237-900d0fb73a54?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1915&q=80",
  "https://plus.unsplash.com/premium_photo-1677519808834-bb8f10865df9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80",
  "https://images.unsplash.com/photo-1517976487492-5750f3195933?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
  "https://plus.unsplash.com/premium_photo-1679470210717-97fc30968fdf?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80",
  "https://images.unsplash.com/photo-1615304001748-fde575b7d968?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80",
  "https://images.unsplash.com/photo-1501869150797-9bbb64f782fd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80",
  "https://plus.unsplash.com/premium_photo-1661380732508-93beb2601f24?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2069&q=80",
  "https://images.unsplash.com/photo-1462747772350-460bb4aad7f4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
  "https://images.unsplash.com/photo-1614726365930-627c75da663e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80",
  "https://images.unsplash.com/photo-1635372722656-389f87a941b7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1931&q=80",
  "https://images.unsplash.com/photo-1596495577886-d920f1fb7238?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2074&q=80",
  "https://images.unsplash.com/photo-1532342342267-77e8db262ebc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
  "https://images.unsplash.com/photo-1485846234645-a62644f84728?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2059&q=80",
  "https://images.unsplash.com/photo-1529485726363-95c8d62f656f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80",
  "https://images.unsplash.com/photo-1485119502162-016e4409beab?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
  "https://images.unsplash.com/photo-1645418245061-6490355fc74c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1854&q=80",
  "https://images.unsplash.com/photo-1616442751986-fe0df84ad730?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
  "https://images.unsplash.com/photo-1614496341624-7c0ad7321034?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80",
  "https://images.unsplash.com/photo-1682944600817-e95b34e43be8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80",
  "https://images.unsplash.com/photo-1499591934245-40b55745b905?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2072&q=80"
]


topics_data.each_with_index do |topic_data, index|
  file = URI.open(topics_image_uris[index])
  topic = Topic.new(topic_data)
  topic.photo.attach(io: file, filename: "tree.png", content_type: "image/png")
  topic.save
end
