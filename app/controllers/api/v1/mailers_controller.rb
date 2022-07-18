module Api
  module V1
    class MailersController < ApplicationController
      before_action :find_user, only: [:contact_us]
      
      def contact_us
        body = params[:body]
        email = params[:email]
        name = params[:name]
        mg_client = Mailgun::Client.new(ENV['MG_API_KEY'])

        email_info =  { 
          :from => email,
          :to => "info@painnavigator.io",  
          :subject => "PainNavigator Contact Form Submission from #{name}",
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