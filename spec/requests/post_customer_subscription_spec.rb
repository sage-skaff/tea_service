require 'rails_helper'

RSpec.describe 'Post Customer Subscription' do
  it 'creates a customer tea subscription from json body' do
    customer = Customer.create!(first_name: 'Ahsoka', last_name: 'Tano', email: 'atano@jedi.com', address: 'Space')
    tea = Tea.create!(title: 'Yerba Mate', description: 'Energizing Yerba Mate Tea', temperature: 170, brew_time: 180)
    subscription_params = {
        "title": "Yerba Mate Blend",
        "price": 15,
        "status": "active",
        "customer_id": customer.id,
        "tea_id": tea.id
    }
    post "/api/v1/customers/#{customer.id}/subscriptions", params: subscription_params

    expect(response).to be_successful
    expect(response).to have_http_status(201)
    expect(customer.subscriptions.first.title).to eq('Yerba Mate Blend')
  end
end