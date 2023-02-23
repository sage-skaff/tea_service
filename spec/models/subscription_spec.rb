require 'rails_helper'

RSpec.describe Subscription do
    describe 'relationships' do
        it { should belong_to :customer }
        it { should belong_to :tea }
    end

    describe 'validations' do
        it { should validate_presence_of :title }
        it { should validate_presence_of :price }
        it { should validate_presence_of :status }
    end
end