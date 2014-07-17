class OrderMailer < ActionMailer::Base
  default from: "hello@funstagram.com"

  def confirmation(order)
  	@order = order
  	mail(to: order.user.email, subject: "You just ordered a #{order.post.title}")
  end

end
