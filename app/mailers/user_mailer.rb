class UserMailer < ApplicationMailer
    def welcome_email
        @user = params[:user]
        @url  = 'thp-nantes-boutique.herokuapp.com/login'
        mail(to: @user.email, subject: 'Welcome to My Atomic Kitten !')
      end
end
