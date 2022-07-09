class MyMailer < ApplicationMailer   
  helper :application

  def contact_us(body, user)
    reply_to = "#{user.first_name} #{user.last_name} <#{user.email}>"
    @body = body
    mail(to: "stephenwalter@chicagobooth.edu", subject: "New message from PainNavigator user", reply_to: reply_to)
  end
  
end