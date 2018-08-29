class CartController < ApplicationController
  def show
    @cart = Cart.find_by(user_id: current_user.id) || Cart.create(user_id: current_user.id)
  end

  def empty
    @cart.items.destroy_all
  end
end
