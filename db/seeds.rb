# Generate a bunch of users
50.times do |n|
  email = "example-#{n + 1}@email.com"
  password = "password"
  User.create!(
    email: email,
    password: password,
    password_confirmation: password
  )
end

# Generate a bunch of blog posts
users = User.order(:created_at).take(10)
100.times do
  title = Faker::Lorem.sentence(word_count: 5)
  content = Faker::Lorem.sentence(word_count: 40)
  users.each { |user| user.blogs.create!(content: content, title: title) }
end
