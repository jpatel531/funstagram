class OrderMailer < ActionMailer::Base
  default from: "hello@funstagram.com"

  def confirmation(order)
  	mail(to: order.user.email, subject: 'Order confirmed')
  end

end
