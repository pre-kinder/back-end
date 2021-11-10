# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Child.destroy_all
Teacher.destroy_all
Event.destroy_all

Classroom.destroy_all
Parent.destroy_all


class1 = Classroom.create(name: "Room 1 Badgers")
class2 = Classroom.create(name: "Room 2 Chipmunks")
class3 = Classroom.create(name: "Room 3 Frogs")

p_unit1 = FactoryBot.create(:parent)
p_unit2 = FactoryBot.create(:parent)
p_unit3 = FactoryBot.create(:parent)

kid1 = FactoryBot.create(:child, classroom: class1, parent: p_unit1)
kid2 = FactoryBot.create(:child, classroom: class1, parent: p_unit2)
kid3 = FactoryBot.create(:child, classroom: class2, parent: p_unit2)
kid4 = FactoryBot.create(:child, classroom: class2, parent: p_unit3)

prof1 = FactoryBot.create(:teacher, classroom: class1)
prof2 = FactoryBot.create(:teacher, classroom: class2)
prof3 = FactoryBot.create(:teacher, classroom: class2)

occasion1 = FactoryBot.create(:event, classroom: class1)
occasion2 = FactoryBot.create(:event, classroom: class2)
occasion3 = FactoryBot.create(:event, classroom: class2)

# post = create(:post, user: user)
# class Seed
#   def self.start
#     seed = Seed.new
#     seed.generate_destinations
#   end
#
#   def generate_destinations
#     50.times do |i|
#       dest = Destination.create!(
#         name: Faker::Address.city,
#         zip: Faker::Address.zip,
#         description: Faker::Lorem.sentence,
#         image_url: Faker::Placeholdit.image
#       )
#       puts "Destination #{i}: #{dest.name} created!"
#     end
#   end
# end
#
# Seed.start
