User.create!(username: "TaxBronze",
              email: "test@user.com",
              password: "password",
              password_confirmation: "password",
              role: 1)

50.times do |n|
  name = Faker::Internet.user_name
  email = Faker::Internet.email
  password = "password"
  User.create!(username: name,
                email: email,
                password: password,
                password_confirmation: password)
end

users = User.order(:created_at).take(3)
50.times do
  title = Faker::Lorem.word
  content = Faker::Lorem.paragraph(2)
  location = Faker::Address.city
  website = Faker::Internet.url
  tagline = Faker::Hacker.say_something_smart
  users.each do |user|
    user.posts.create!(title: title, content: content)
    user.profile.update_attributes(tagline: tagline, location: location, website: website )
  end
end

users = User.all
user = users.first
following = users[2..30]
followers = users[3..20]
following.each { |followed| user.follow(followed)}
followers.each { |follower| follower.follow(user)}
