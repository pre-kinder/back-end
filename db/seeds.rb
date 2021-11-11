# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require "factory_bot_rails"
FactoryBot::Syntax::Methods

Child.destroy_all
Teacher.destroy_all
Event.destroy_all

Classroom.destroy_all
Parent.destroy_all


class1 = create(:classroom)
class2 = create(:classroom)
class3 = create(:classroom)

p_unit1 = create(:parent)
p_unit2 = create(:parent)
p_unit3 = create(:parent)

kid1 = create(:child, classroom: class1, parent: p_unit1)
kid2 = create(:child, classroom: class1, parent: p_unit2)
kid3 = create(:child, classroom: class2, parent: p_unit2)
kid4 = create(:child, classroom: class2, parent: p_unit3)

prof1 = create(:teacher, classroom: class1)
prof2 = create(:teacher, classroom: class2)
prof3 = create(:teacher, classroom: class2)

occasion1 = create(:event, classroom: class1)
occasion2 = create(:event, classroom: class2)
occasion3 = create(:event, classroom: class2)

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
