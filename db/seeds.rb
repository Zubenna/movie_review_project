# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users = User.create([
{first_name: 'Daniel', surname: 'Eze', username: 'user-one', email: 'userone.email@example.com', password: '123456', password_confirmation:'123456', admin: true},
{first_name: 'Jack', surname: 'Brown', username: 'user-two', email: 'usertwo.email@example.com', password: '123456', password_confirmation:'123456', admin: true},
{first_name:  'Martin', surname: 'Kelly', username: 'user-three', email: 'usertwo.email@example.com', password: '123456', password_confirmation:'123456'}
])

