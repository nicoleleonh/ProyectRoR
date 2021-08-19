# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#Create Admin
Admin.create(
    email: "admin@proyect.com",
    password: 123456
)

#Creations of Users
#First User
User.create(
    email: ("nicool@hotmail.com"), 
    password: 123456,
)
#Second User
User.create(
    email: ("urania@hotmail.com"), 
    password: 123456,
)
#Third User
User.create(
    email: ("francy@hotmail.com"), 
    password: 123456,
)
#Quarter
User.create(
    email: ("jose@hotmail.com"), 
    password: 123456,
)



#Creations of publications
# User.all.each do |user|
#     3.times do 
#         user.publications.create(
#             name: Faker::name,
#             age: rand(1..15),
#             description: "necesitamos ayuda con este perrito",
#             amountoraise: 20000,
#             amountcollected: 25000
#         )
#     end
# end

