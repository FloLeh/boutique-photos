require 'dotenv'
require 'open-uri'

Dotenv.load

class Mailer

  def send_email()
    email = { messages: [{
      'From'=> {
          'Email'=> ENV['PRIVATE_EMAIL_ADRESS'],
          'Name'=> 'THP-nantes'
      },
      'To'=> [
          {
              'Email'=> 'thp.acc.tests@gmail.com',
              'Name'=> 'flo'
          }
      ],
      'Subject'=> 'Bienvenue sur Atomic Kitten !',
      'HTMLPart'=> "<h1>Salut Flo,</h1> <img src='https://thp-nantes-boutique.herokuapp.com/assets/chat1-ec7132dc5b4f0d47196ee2fa5e333c5e645a2ecab110d1ca0175fc3abdbe04a7.jpg' alt=''>"
    }]}
    test = Mailjet::Send.create(email)
  end

end
