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
    iuser += 1
end

puts "Created 10 users"