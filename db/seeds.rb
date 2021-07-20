# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
   email: 'test@test.com',
   password: 'testtest')

Customer.create!(
   email: 'test@test.com',
   password: 'testtest',
   last_name: 'test',
   first_name: 'test',
   last_name_kana: 'test',
   first_name_kana: 'test',
   postcode: '0000000',
   address: 'test',
   phone_number: '00000000000',
   is_delete: 'false'
   )

Products.create!(
   name: 'test',
   text: 'test',
   price: 'price',
   is_active: 'true',
   )
