module Api
  module V1
    class ProvidersController < ApplicationController

      def check_referral_code
        referral_code = Provider.find_by(code: params[:code])
          if referral_code
            render json Provider.id
          else
            nil
          end
    end
  end
end