class OrdersController < ApplicationController

    def new
        puts params
      @order=Order.create(user_id: current_user.id, cart_id: current_user.cart.id)
    end

    def create
        customer = Stripe::Customer.create(
            email:params[:stripeEmail],
            source:params[:stripeToken],
          )

        charge= Stripe::Charge.create(
            customer: customer.id,
            amount: @order.price,
            description: "Payement photo de ",
            currency: 'eur'
        )

        @order.update(payement: charge.to_json,state: 'paid')
        redirect_to order_path(@order)
        
        rescue Stripe::CardError => e
            flash[:alert]=e.message
    end

    def show
        @command= current_user.orders.where(state: 'paid')
        redirect_to new_orders_path
    end
end
