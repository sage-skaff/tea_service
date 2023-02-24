require 'rails_helper'

RSpec.describe 'Get All Subscriptions' do
    it 'returns all subscriptions for a given customer' do
        customer_1 = Customer.create!(first_name: 'Ahsoka', last_name: 'Tano', email: 'atano@jedi.com', address: 'Space')
        customer_2 = Customer.create!(first_name: 'Din', last_name: 'Djarin', email: 'ddjarin@mando.com', address: 'Space')
        tea_1 = Tea.create!(title: 'Yerba Mate', description: 'Energizing Yerba Mate Tea', temperature: 170, brew_time: 180)
        tea_2 = Tea.create!(title: 'Green Tea', description: 'Green Tea with Ginseng', temperature: 165, brew_time: 240)
        tea_3 = Tea.create!(title: 'Ashwagandha', description: 'Calming Ashwagandha', temperature: 203, brew_time: 600)
        subscription_1 = Subscription.create!(title: "Yerba Mate Blend", price: 15, status: "active", customer_id: customer_1.id, tea_id: tea_1.id)
        subscription_2 = Subscription.create!(title: "Green Tea Blend", price: 17, status: "active", customer_id: customer_1.id, tea_id: tea_2.id)
        subscription_3 = Subscription.create!(title: "Ashwagandha Blend", price: 20, status: "active", customer_id: customer_1.id, tea_id: tea_3.id)

        get "/api/v1/customers/#{customer_1.id}/subscriptions"
        
        expect(response).to be_successful
        expect(response).to have_http_status(200)

        parsed_response = JSON.parse(response.body, symbolize_names: true)

        expect(parsed_response).to be_a(Hash)
        expect(parsed_response).to have_key(:data)
        expect(parsed_response[:data]).to be_a(Array)
        expect(parsed_response[:data].first).to have_key(:id)
        expect(parsed_response[:data].first).to have_key(:type)
        expect(parsed_response[:data].first).to have_key(:attributes)
        expect(parsed_response[:data].first[:attributes]).to have_key(:title)
        expect(parsed_response[:data].first[:attributes]).to have_key(:price)
        expect(parsed_response[:data].first[:attributes]).to have_key(:status)
        expect(parsed_response[:data].first[:attributes]).to have_key(:customer_id)
        expect(parsed_response[:data].first[:attributes][:customer_id]).to eq(customer_1.id)
        expect(parsed_response[:data].first[:attributes]).to have_key(:tea_id)
    end

    it 'errors when invalid customer id' do
        customer_1 = Customer.create!(first_name: 'Ahsoka', last_name: 'Tano', email: 'atano@jedi.com', address: 'Space')
        customer_2 = Customer.create!(first_name: 'Din', last_name: 'Djarin', email: 'ddjarin@mando.com', address: 'Space')
        tea_1 = Tea.create!(title: 'Yerba Mate', description: 'Energizing Yerba Mate Tea', temperature: 170, brew_time: 180)
        tea_2 = Tea.create!(title: 'Green Tea', description: 'Green Tea with Ginseng', temperature: 165, brew_time: 240)
        tea_3 = Tea.create!(title: 'Ashwagandha', description: 'Calming Ashwagandha', temperature: 203, brew_time: 600)
        subscription_1 = Subscription.create!(title: "Yerba Mate Blend", price: 15, status: "active", customer_id: customer_1.id, tea_id: tea_1.id)
        subscription_2 = Subscription.create!(title: "Green Tea Blend", price: 17, status: "active", customer_id: customer_1.id, tea_id: tea_2.id)
        subscription_3 = Subscription.create!(title: "Ashwagandha Blend", price: 20, status: "active", customer_id: customer_1.id, tea_id: tea_3.id)

        get "/api/v1/customers/13907672556/subscriptions"

        expect(response).to have_http_status(400)

        parsed_response = JSON.parse(response.body, symbolize_names: true)

        expect(parsed_response[:error]).to eq("Unable to find customer's subscriptions")
    end
end