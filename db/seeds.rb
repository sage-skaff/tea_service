# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
customer_1 = Customer.create!(first_name: 'Ahsoka', last_name: 'Tano', email: 'atano@jedi.com', address: 'Space')
        customer_2 = Customer.create!(first_name: 'Din', last_name: 'Djarin', email: 'ddjarin@mando.com', address: 'Space')
        tea_1 = Tea.create!(title: 'Yerba Mate', description: 'Energizing Yerba Mate Tea', temperature: 170, brew_time: 180)
        tea_2 = Tea.create!(title: 'Green Tea', description: 'Green Tea with Ginseng', temperature: 165, brew_time: 240)
        tea_3 = Tea.create!(title: 'Ashwagandha', description: 'Calming Ashwagandha', temperature: 203, brew_time: 600)
        subscription_1 = Subscription.create!(title: "Yerba Mate Blend", price: 15, status: "active", customer_id: customer_1.id, tea_id: tea_1.id)
        subscription_2 = Subscription.create!(title: "Green Tea Blend", price: 17, status: "active", customer_id: customer_1.id, tea_id: tea_2.id)
        subscription_3 = Subscription.create!(title: "Ashwagandha Blend", price: 20, status: "active", customer_id: customer_1.id, tea_id: tea_3.id)
