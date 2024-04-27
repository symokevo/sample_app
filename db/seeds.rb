# Create a main sample user.
User.create!( name: "Example User", email: "simon@suuef.com", password: "foobar", password_confirmation: "foobar" )

# Generate a bunch of additional users.
99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@suuef.com"
  password = "password"
  User.create!( name: name, email: email, password: password, password_confirmation: password )
end
