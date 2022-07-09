module Api
  module V1
    class MailersController < ApplicationController
      before_action :find_user, only: [:contact_us]
      
      def contact_us
        body = params[:body]
        MyMailer.contact_us(body, @user).deliver
        head :no_content
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