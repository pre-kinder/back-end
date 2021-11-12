# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require "factory_bot_rails"

Child.destroy_all
Teacher.destroy_all
Event.destroy_all

Classroom.destroy_all
Parent.destroy_all


class1 = Classroom.create!(name: "Room 1 Pintozzi Pumas")
class2 = Classroom.create!(name: "Room 2 Chipmunks")
class3 = Classroom.create!(name: "Room 3 Frogs")

# def generate_children
#   20.times do |i|
#     children = Children.create!(
#       first_name { Faker::Name.first_name }
#       last_name { Faker::Name.last_name }
#       birthday { Faker::Date.birthday(min_age: 3, max_age: 5) }
#     )
#   end
#   children
# end


p_unit1 = Parent.create!(first_name: 'Lucy', last_name: 'Loo',
                        phone_number: '123-455-6677',
                        address: "123 Main St Denver, CO 37278",
                        email: "lucy@gmail.com",
                        google_id: '27494238520',
                        google_image_url: '2368ihefndskzsaudfd89djfasf')

p_unit2 = Parent.create!(first_name: 'Dave', last_name: 'Doodle',
                        phone_number: '362-348-3743',
                        address: "123 Main St Denver, CO 37278",
                        email: "dave@gmail.com",
                        google_id: '3829440344',
                        google_image_url: '2368ihefndskzsaudfd89djfasf')

p_unit3 = Parent.create!(first_name: 'Andy', last_name: 'Anty',
                        phone_number: '363-522-4523',
                        address: "123 Main St Denver, CO 37278",
                        email: "andy@gmail.com",
                        google_id: '634823749',
                        google_image_url: '2368ihefndskzsaudfd89djfasf')

# kid1 = create(:child, classroom: class1, parent: p_unit1)
# kid2 = create(:child, classroom: class1, parent: p_unit2)
# kid3 = create(:child, classroom: class2, parent: p_unit2)
# kid4 = create(:child, classroom: class2, parent: p_unit3)

kid1 = Child.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        birthday: Faker::Date.birthday(min_age: 3, max_age: 5), classroom: class1, parent: p_unit1
      )

kid2 = Child.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        birthday: Faker::Date.birthday(min_age: 3, max_age: 5), classroom: class1, parent: p_unit2
      )

kid3 = Child.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        birthday: Faker::Date.birthday(min_age: 3, max_age: 5), classroom: class2, parent: p_unit2
      )

kid4 = Child.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        birthday: Faker::Date.birthday(min_age: 3, max_age: 5), classroom: class2, parent: p_unit3
      )

teacher1 = Teacher.create!(first_name: 'Amada', last_name: 'Aooooyooo',
                        phone_number: '327-433-4343',
                        address: "123 Main St Denver, CO 37278",
                        email: "amada@gmail.com",
                        google_id: '372349473',
                        google_image_url: '2368ihefndskzsaudfd89djfasf',
                        classroom: class1)

teacher2 = Teacher.create!(first_name: 'Betty', last_name: 'Tochihara',
                      phone_number: '362-238-2384',
                      address: "123 Main St Denver, CO 37278",
                      email: "betty@gmail.com",
                      google_id: '382947340123',
                      google_image_url: '2368ihefndskzsaudfd89djfasf',
                      classroom: class2)

teacher3 = Teacher.create!(first_name: 'Henry', last_name: 'Howdy',
                      phone_number: '632-344-3432',
                      address: "123 Main St Denver, CO 37278",
                      email: "henry@gmail.com",
                      google_id: '80034723',
                      google_image_url: '2368ihefndskzsaudfd89djfasf',
                      classroom: class3)

# occasion1 = create(:event, classroom: class1)
# occasion2 = create(:event, classroom: class2)
# occasion3 = create(:event, classroom: class2)
