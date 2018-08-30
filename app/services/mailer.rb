require 'dotenv'
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
              'Name'=> 'passenger 1'
          }
      ],
      'Subject'=> 'Your email flight plan!',
      'TextPart'=> "Hello #{current_user.first_name}, welcome to Mailjet! May the delivery force be with you!",
      'HTMLPart'=> "<h3>Dear #{current_user.first_name} , welcome to Mailjet!</h3><br />May the delivery force be with you!"
    }]}
    test = Mailjet::Send.create(email)

  end

end
