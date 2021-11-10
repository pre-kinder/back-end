# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Classroom.destroy_all

classroom1 = Classroom.create!(name: "Room 1 Badgers")
classroom2 = Classroom.create!(name: "Room 2 Chipmunks")
classroom3 = Classroom.create!(name: "Room 3 Frogs")
