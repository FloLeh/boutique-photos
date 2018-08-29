class OrdersController < ApplicationController

    def new
      @order=Order.create(user_id: current_user.id, cart_id: current_user.cart.id)
    end

    def create

    end
end
