class Api::V1::SubscriptionsController < ApplicationController
    def index
        if Customer.find_by(id: params[:customer_id]) != nil
            customer = Customer.find_by(id: params[:customer_id])
            render json: SubscriptionSerializer.new(customer.subscriptions), status: 200
        else
            render json: { error: "Unable to find customer's subscriptions"}
        end
    end

    def create
        subscription = Subscription.new(subscription_params)
        if subscription.save
            render json: SubscriptionSerializer.new(subscription), status: 201
        else
            render json: { error: "Unable to add subscription"}, status: :bad_request
        end
    end

    def update
        subscription = Subscription.find(params[:id])
        if params[:update].present?
            subscription.update(status: params[:update])
            render json: SubscriptionSerializer.new(subscription), status: 200
        else
            render json: { error: "Unable to update subscription status" }, status: :bad_request
        end
    end

    private
    def subscription_params
        params.permit(:title, :price, :status, :customer_id, :tea_id)
    end
end