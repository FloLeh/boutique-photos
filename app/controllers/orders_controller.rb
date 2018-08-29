class OrdersController < ApplicationController
    def create
       @item=Item.find(params:item_id)
        @order=Order.create!(card_item_id)

        customer = Stripe::Customer.create(
            email: params['email'],
            source:'src_18eYalAHEMiOZZp1l9ZTjSU0',
          )

        charge= Stripe::Charge.create(
            customer: customer.id,
            amount: @order.price,
            description: "Payement photo de #{}",
            currency: 'eur'
        )

        @order.update(payement: charge.to_json,state: 'paid')
        redirect_to order_path(@order)
        
        rescue Stripe::CardError => e
            flash[:alert]=e.message
    end

    def show
        @command= current_user.orders.where(state: 'paid')
    end
end
