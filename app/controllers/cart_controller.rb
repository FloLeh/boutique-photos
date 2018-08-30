class CartController < ApplicationController
  def show
    if Cart.find_by(user_id: current_user.id)
      @cart = Cart.find_by(user_id: current_user.id)
    else
      @cart = Cart.create(user_id: current_user.id)
    end
  end

  def empty
    @cart = Cart.find_by(user_id: current_user.id)
    @cart.items.destroy_all
    redirect_to cart_path
  end

  def remove_item
    CartsItem.destroy(CartsItem.find_by(item_id: params[:item_id]).id)
    redirect_to cart_path
  end
end
