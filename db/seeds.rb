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
    User.create(points: 0, name: Faker::Name.first_name, email: Faker::Internet.email, password_digest: "hello", user_name: Faker::Ancient.god, surname: Faker::Name.last_name, n_of_reports: 0)
    puts "Created user number #{iuser}"
    iuser += 1
end
puts "Created 10 users"

ipost = 0
while ipost < 25 do
    Post.create(title: Faker::House.furniture, urgent: false, user_id: Faker::Number.between(from: 154, to: 165), category: Faker::Science.element, price: Faker::Number.decimal_part(digits: 3), postcode: Faker::Address.postcode, address: Faker::Address.street_name, city: Faker::Address.city, description: Faker::Hacker.say_something_smart, image_url: Faker::LoremFlickr.image(size: "250x250"), condition: "new")
    puts "Created post number #{ipost}"
    ipost += 1
end
puts "Created 25 posts"

puts "Creating 10 urgent posts"

iurgentpost = 0
while iurgentpost < 10 do
    Post.create(title: "Selling my #{Faker::House.furniture}", urgent: true, user_id: Faker::Number.between(from: 154, to: 165), category: Faker::Science.element, price: Faker::Number.decimal_part(digits: 3), postcode: Faker::Address.postcode, address: Faker::Address.street_name, city: Faker::Address.city, description: Faker::Hacker.say_something_smart, image_url: Faker::LoremFlickr.image(size: "250x250"), condition: "new")
    puts "Created urgent post number #{iurgentpost}"
    iurgentpost += 1
end
puts "Created 10 urgent posts"

puts "Creating Admin"
Admin.create(username: Faker::FunnyName.name, password_digest: "hello")
puts "Created admin"

puts "Creating Save Post"
isavepost = 0 
while isavepost < 25 do 
    SavePost.create(post_id: Faker::Number.between(from: 24, to: 48), user_id: Faker::Number.between(from: 1, to: 10))
    puts "Created save post number #{isavepost}" 
    isavepost += 1
end 
puts "Created 25 save post"