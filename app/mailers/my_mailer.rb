class MyMailer < ApplicationMailer   
  helper :application
  layout 'mailer'

  def contact_us
    #reply_to = "#{user.first_name} #{user.last_name} <#{user.email}>"
    #@body = "body"
    mail(to: "stephenwalter@chicagobooth.edu", subject: "New message from PainNavigator user")
  end
  
end