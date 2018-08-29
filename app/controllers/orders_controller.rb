class OrdersController < ApplicationController
    def create
       @item=Item.find(params:item_id)
        @order=Order.create!(card_item_id)
    end
end
