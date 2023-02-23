class Subscription < ApplicationRecord
    belongs_to :customer
    has_many :teas

    validates_presence_of :title
    validates_presence_of :price
    validates_presence_of :status
end