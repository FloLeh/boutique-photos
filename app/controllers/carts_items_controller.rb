class CartsItemsController < ApplicationController
  def create
    CartsItem.create(cart_id: current_user.cart.id, item_id: params[:id])
  end

  def destroy(item_id)
    CartsItem.destroy(item_id: item_id)
  end
end
