class OrdersController < ApplicationController

    def new
      puts params
      @cart = Cart.find_by(user_id: current_user.id)
      @order=Order.create(user_id: current_user.id, cart_id: current_user.cart.id)
      
    end

    def create
        @cart = Cart.find_by(user_id: current_user.id)
        @total=(@cart.items.map{|i| i.price}.sum)*100
        @total_cents=@total.to_i
        customer = Stripe::Customer.create(
            email:params[:stripeEmail],
            source:params[:stripeToken],
          )

        charge= Stripe::Charge.create(
            customer: customer.id,
            amount:@total_cents,
            description: "Payement photo de ",
            currency: 'eur',
            receipt_email:params[:stripeEmail] ,
        )

        
        @cart.items.destroy_all
        redirect_to root_path

        rescue Stripe::CardError => e
            flash[:alert]=e.message
    end

    def show
        @command= current_user.orders.where(state: 'paid')
        redirect_to new_order_path
    end
end
