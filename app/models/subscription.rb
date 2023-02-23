class Subscription < ApplicationRecord
    enum status: { cancelled: 0, active: 1 }
    belongs_to :customer
    belongs_to :tea

    validates_presence_of :title
    validates_presence_of :price
    validates_presence_of :status
end