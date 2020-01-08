require 'faker'

puts "Destroying all Users in Data Base"
User.destroy_all
puts "All users destroyed"

puts "Destroying all Post in Data Base"
Post.destroy_all 
puts "All post destroyed"

puts "Destroying all Admin data"
Admin.destroy_all
puts "All admin destroyed"

puts "Destroying all Save Post data"
SavePost.destroy_all
puts "All SavePost data destroyed"

puts "Generating seed data..."

iuser = 0
while iuser < 11 do
    User.create(points: 0, name: Faker::Name.first_name, email: Faker::Internet.email, password_digest: "hello", user_name: Faker::Name.middle_name, surname: Faker::Name.last_name, n_of_reports: 0)
    puts "Created user number #{iuser}"
    iuser += 1
end
puts "Created 10 users"

ipost = 0
while ipost < 25 do
    Post.create(user_id: Faker::Number.decimal_part(digits: 1), category: Faker::Science.element, price: Faker::Number.decimal_part(digits: 3), postcode: Faker::Address.postcode, address: Faker::Address.street_name, city: Faker::Address.city, description: Faker::Hacker.say_something_smart, image_url: "0", condition: "new")
    puts "Created post number #{ipost}"
    ipost += 1
end
puts "Created 25 posts"

puts "Creating Admin"
Admin.create(user_name: Faker::FunnyName.name, password_digest: "hello")
puts "Created admin"

puts "Creating Save Post"
isavepost = 0 

while ipost <25 do 
    SavePost.create(post_id: Faker::Number.between(from: 1, to: 25), user_id: Faker::Number.between(from: 1, to: 10))
end 
