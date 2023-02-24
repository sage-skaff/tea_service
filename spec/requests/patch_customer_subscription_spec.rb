require 'rails_helper'

RSpec.describe 'Patch Customer Subscription' do
  it 'updates a customer tea subscription from json body' do
    customer = Customer.create!(first_name: 'Ahsoka', last_name: 'Tano', email: 'atano@jedi.com', address: 'Space')
    tea = Tea.create!(title: 'Yerba Mate', description: 'Energizing Yerba Mate Tea', temperature: 170, brew_time: 180)
    subscription = Subscription.create!(title: "Yerba Mate Blend", price: 15, status: "active", customer_id: customer.id, tea_id: tea.id)
    
    patch "/api/v1/customers/#{customer.id}/subscriptions/#{subscription.id}", params: {update: "cancelled"}

    expect(response).to be_successful
    expect(response).to have_http_status(200)
    expect(customer.subscriptions.first.status).to eq('cancelled')

    patch "/api/v1/customers/#{customer.id}/subscriptions/#{subscription.id}", params: {update: "active"}

    expect(response).to be_successful
    expect(response).to have_http_status(200)
    expect(customer.subscriptions.first.status).to eq('active')
  end

  it 'errors when update params missing' do
    customer = Customer.create!(first_name: 'Ahsoka', last_name: 'Tano', email: 'atano@jedi.com', address: 'Space')
    tea = Tea.create!(title: 'Yerba Mate', description: 'Energizing Yerba Mate Tea', temperature: 170, brew_time: 180)
    subscription = Subscription.create!(title: "Yerba Mate Blend", price: 15, status: "active", customer_id: customer.id, tea_id: tea.id)
    
    patch "/api/v1/customers/#{customer.id}/subscriptions/#{subscription.id}"

    expect(response).to have_http_status(400)

    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_response[:error]).to eq("Unable to update subscription status")
  end
end