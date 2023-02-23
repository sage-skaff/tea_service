class Api::V1::SubscriptionsController < ApplicationController
    def create
        subscription = Subscription.new(subscription_params)
        if subscription.save!
            render json: SubscriptionSerializer.new(subscription), status: 201
        else
            render json: { error: "Unable to add subscription"}, status: :bad_request
        end
    end

    private
    def subscription_params
        params.permit(:title, :price, :status, :customer_id, :tea_id)
    end
end