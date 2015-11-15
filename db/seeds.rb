# Create Users
15.times do
  user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(8)
    )
end

User.create!(
  name: "Carl",
  email: "carl@tabrific.com",
  password: "Green123",
  confirmed_at: Time.now
  )

users = User.all

# Create Registered Applications
100.times do |n|
  RegisteredApplication.create!(
    user: users.sample,
    name: Faker::App.name,
    url: "www.google#{n}.com"
    )
end

registered_applications = RegisteredApplication.all

200.times do
  event = Event.create!(
    registered_application: registered_applications.sample,
    name: Faker::Lorem.sentence(2)
    )
end


puts 'Seed Finished'
puts "#{User.count} users created."
puts "#{RegisteredApplication.count} registered applications created."
puts "#{Event.count} events created."