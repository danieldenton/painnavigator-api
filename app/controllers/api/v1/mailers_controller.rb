module Api
  module V1
    class MailersController < ApplicationController
      before_action :find_user, only: [:contact_us]
      
      def contact_us
        body = params[:body]
        mg_client = Mailgun::Client.new(ENV['MG_API_KEY'])

        email_info =  { 
          :from => "info@painnavigator.io",
          :to => "me@stephenavocado.com",  
          :subject => "PainNavigator Contact Form Submission",
          :text => body
        }

        mg_client.send_message(ENV['MG_SENDING_DOMAIN'], email_info)
      end

      private

      def find_user
        uid = params[:uid]
        @user = User.find_by(uid: uid)
      end

      def contact_params
        params.require(:contact_us).permit(:uid, :body)
      end

    end
  end
end