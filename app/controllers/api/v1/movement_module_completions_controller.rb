module Api
  module V1
    class MovementModuleCompletionsController < ApplicationController
      before_action :get_user

      def index
        education_modules = MovementModuleCompletion.all.order(:created_at).reverse

        render json: MovementModuleCompletionSerializer.new(education_modules).serializable_hash.to_json
      end

      def create
        education_module = @user.education_modules.new(education_module_params)

        if education_module.save
          render json: MovementModuleCompletionSerializer.new(education_module).serializable_hash.to_json
        else 
          render json: { error: education_module.errors.messages }, status: 422
        end
      end

      def update
        education_module = MovementModuleCompletion.find_by(id: params[:id])

        if education_module.update(education_module_params)
          render json: MovementModuleCompletionSerializer.new(education_module).serializable_hash.to_json
        else 
          render json: { error: education_module.errors.messages }, status: 422
        end
      end

      private

      def education_module_params
        params.require(:education_module)
        .permit(:uid, :user_id, :status, :module_id)
      end

    end
  end
end