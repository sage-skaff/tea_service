class SubscriptionSerializer
    include JSONAPI::Serializer
    attributes :title, :status, :price, :customer_id, :tea_id
end