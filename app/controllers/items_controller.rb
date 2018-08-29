class ItemsController < ApplicationController
  def show

  end

  def add_to_cart
    CartsItem.create(cart_id: current_user.cart.id, item_id: params[:id])
    redirect_to cart_path
  end
end
