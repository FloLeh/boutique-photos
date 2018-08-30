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
            description: "Payement poster de #{@cart.items.map{|i| i.title}.join(', ')} ",
            currency: 'eur',
            receipt_email:params[:stripeEmail] ,
        )

        
        @cart.items.destroy_all


        mail = { messages: [{
          'From'=> {
              'Email'=> ENV['PRIVATE_EMAIL_ADRESS'],
              'Name'=> 'THP-nantes'
          },
          'To'=> [
              {
                  'Email'=> current_user.email,
                  'Name'=> current_user.first_name
              }
          ],
          'Subject'=> 'Votre achat sur Atomic Kitten ',
          'HTMLPart'=> "<h1>Salut #{current_user.first_name.capitalize},</h1> <h2>Voici les images que tu as commandé</h2> <img src='https://thp-nantes-boutique.herokuapp.com/assets/chat1-ec7132dc5b4f0d47196ee2fa5e333c5e645a2ecab110d1ca0175fc3abdbe04a7.jpg' alt=''>"
        }]}
        test = Mailjet::Send.create(mail)



        redirect_to root_path



        rescue Stripe::CardError => e
            flash[:alert]=e.message
    end

    def show
        @command= current_user.orders.where(state: 'paid')
        redirect_to new_order_path
    end
end
