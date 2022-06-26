module Api
  module V1
    class PleasantActivitiesController < ApplicationController
      before_action :get_user

      def index
        pleasant_activities = PleasantActivity.all.order(:created_at).reverse

        render json: PleasantActivitySerializer.new(pleasant_activities).serializable_hash.to_json
      end

      def create
        pleasant_activity = @user.pleasant_activities.new(pleasant_activity_params)

        if pleasant_activity.save
          render json: PleasantActivitySerializer.new(pleasant_activity).serializable_hash.to_json
        else 
          render json: { error: pleasant_activity.errors.messages }, status: 422
        end
      end

      def update
        pleasant_activity = PleasantActivity.find_by(id: params[:id])

        if pleasant_activity.update(pleasant_activity_params)
          render json: PleasantActivitySerializer.new(pleasant_activity).serializable_hash.to_json
        else 
          render json: { error: pleasant_activity.errors.messages }, status: 422
        end
      end

      def destroy
        pleasant_activity = PleasantActivity.find_by(id: params[:id])

        if pleasant_activity.destroy
          head :no_content
        else 
          render json: { error: pleasant_activity.errors.messages }, status: 422
        end
      end

      private

      def pleasant_activity_params
        params.require(:pleasant_activity).permit(:user_id, :activities)
      end

    end
  end
end