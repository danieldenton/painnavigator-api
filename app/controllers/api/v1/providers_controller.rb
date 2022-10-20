module Api
  module V1
    class ProvidersController < ApplicationController

      def check_referral_code
        provider = Provider.find_by(code: params[:code])
          if provider
            render json: ProviderSerializer.new(provider).serializable_hash.to_json
          else
            nil
          end
        end

        private

      def provider_params
        params.require(:provider).permit(
          :name, 
          :code, 
          :users_count,
        )
      end

    end
  end
end