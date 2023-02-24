require 'rails_helper'

RSpec.describe 'Post Customer Registration' do
  it 'creates a new customer from json body' do
    json_payload = {
        "first_name": "Ahsoka",
        "last_name": "Tano",
        "email": "atano@jedi.com",
        "address": "Jedi Temple, Coruscant"
    }

    post '/api/v1/customers', params: json_payload.to_json,
                          headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

    expect(response).to have_http_status(201)

    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_response).to have_key(:data)
    expect(parsed_response[:data]).to have_key(:type)
    expect(parsed_response[:data]).to have_key(:id)
    expect(parsed_response[:data]).to have_key(:attributes)
    expect(parsed_response[:data][:attributes]).to have_key(:first_name)
    expect(parsed_response[:data][:attributes]).to have_key(:last_name)
    expect(parsed_response[:data][:attributes]).to have_key(:email)
    expect(parsed_response[:data][:attributes]).to have_key(:address)
    expect(parsed_response[:data][:attributes][:first_name]).to eq("Ahsoka")
  end

  it 'returns error if customer email already exists' do
    customer = Customer.create!(first_name: 'Ahsoka', last_name: 'Tano', email: 'atano@jedi.com', address: "Jedi Temple, Coruscant")
    json_payload = {
        "first_name": "Ahsoka",
        "last_name": "Tano",
        "email": "atano@jedi.com",
        "address": "Jedi Temple, Coruscant"
    }

    post '/api/v1/customers', params: json_payload.to_json,
                          headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

    expect(response).to have_http_status(400)

    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_response).to have_key(:email)
    expect(parsed_response[:email].first).to eq("has already been taken")
  end
end