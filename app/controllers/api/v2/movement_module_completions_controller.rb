module Api
  module V2
    class MovementModuleCompletionsController < ApplicationController
      before_action :get_user

      def index
        movement_modules = @user.movement_modules
      
        render json: MovementModuleCompletionSerializer.new(movement_modules).serializable_hash.to_json
      end

      # def index
      #   movement_modules = MovementModuleCompletion.all.order(:created_at).reverse

      #   render json: MovementModuleCompletionSerializer.new(movement_modules).serializable_hash.to_json
      # end


      def create
        movement_module = @user.movement_modules.new(movement_module_params)

        if movement_module.save
          render json: MovementModuleCompletionSerializer.new(movement_module).serializable_hash.to_json
        else 
          render json: { error: movement_module.errors.messages }, status: 422
        end
      end

      def update
        movement_module = MovementModuleCompletion.find_by(id: params[:id])

        if movement_module.update(movement_module_params)
          render json: MovementModuleCompletionSerializer.new(movement_module).serializable_hash.to_json
        else 
          render json: { error: movement_module.errors.messages }, status: 422
        end
      end

      def destroy
        movement_modules = @user.movement_modules

        if movement_modules.destroy
          head :no_content
        else 
          render json: { error: user.errors.messages }, status: 422
        end
      end

      private

      def movement_module_params
        params.require(:movement_module)
        .permit(:uid, :user_id, :status, :module_id)
      end

    end
  end
end