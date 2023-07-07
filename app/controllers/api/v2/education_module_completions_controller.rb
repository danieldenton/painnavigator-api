module Api
  module V2
    class EducationModuleCompletionsController < ApplicationController
      before_action :get_user

      def index
        education_modules = EducationModuleCompletion.all.order(:created_at).reverse

        render json: EducationModuleCompletionSerializer.new(education_modules).serializable_hash.to_json
      end

      def create
        education_module = @user.education_modules.new(education_module_params)

        if education_module.save
          if @user.condensed_program
            unit = EducationUnit.where("id > ?", @user.education_modules.last.module_id).where({ :condensed_program => true })[0]
            
            if unit 
              render json: {
                "data": {
                  "id": unit.id,
                  "type": "education_module_completion",
                  "attributes": {
                    "id": unit.id,
                    "date_time_value": nil,
                    "status": nil,
                    "module_id": unit.module_order,
                    "education_progress": education_module.education_progress
                  }
                }
              }
            else 
              render json: {
                "data": {
                  "id": 66,
                  "type": "education_module_completion",
                  "attributes": {
                    "id": 66,
                    "date_time_value": nil,
                    "status": nil,
                    "module_id": 66,
                    "education_progress": education_module.education_progress
                  }
                }
              }
            end
          else
            #render json: EducationModuleCompletionSerializer.new(education_module).serializable_hash.to_json
            render json: {
              "data": {
                "id": @user.education_modules.last.module_id + 1,
                "type": "education_module_completion",
                "attributes": {
                  "id": @user.education_modules.last.module_id + 1,
                  "date_time_value": nil,
                  "status": nil,
                  "module_id": @user.education_modules.last.module_id + 1,
                  "education_progress": education_module.education_progress
                }
              }
            }
          end
        else 
          render json: { error: education_module.errors.messages }, status: 422
        end
      end

      def update
        education_module = EducationModuleCompletion.find_by(id: params[:id])

        if education_module.update(education_module_params)
          render json: EducationModuleCompletionSerializer.new(education_module).serializable_hash.to_json
        else 
          render json: { error: education_module.errors.messages }, status: 422
        end
      end

      private

      def education_module_params
        params.require(:education_module_completion)
        .permit(:uid, :user_id, :status, :module_id, :education_progress)
      end

    end
  end
end