class OrdersController < ApplicationController

    def new
        puts params
      @order=Order.create(user_id: current_user.id, cart_id: current_user.cart.id)
    end

    def create
        customer = Stripe::Customer.create(
            email:current_user.email,
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
