class Api::V1::CustomersController < ApplicationController
    def create
        customer = Customer.create(customer_params)
        if customer.save!
          render json: CustomerSerializer.new(customer), status: 201
        else
          render json: customer.errors, status: :bad_request
        end
      end

      private

      def customer_params
        params.require(:customer).permit(:first_name, :last_name, :email, :address)
      end
end