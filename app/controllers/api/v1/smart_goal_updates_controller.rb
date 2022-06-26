module Api
  module V1
    class SmartGoalUpdatesController < ApplicationController

      def create
        smart_goal_update = smart_goal.smart_goal_updates.new(smart_goal_update_params)

        if smart_goal_update.save
          render json: SmartGoalSerializer.new(smart_goal).serializable_hash.to_json
        else 
          render json: { error: smart_goal_update.errors.messages }, status: 422
        end
      end

      def destroy
        smart_goal_update = SmartGoalUpdate.find(params[:id])

        if smart_goal_update.destroy
          head :no_content
        else 
          render json: { error: smart_goal_update.errors.messages }, status: 422
        end
      end

      private

      def smart_goal
        @smart_goal ||= SmartGoal.find(params[:smart_goal_id])
      end
      
      def smart_goal_update_params
        params.require(:smart_goal_update).permit(:smart_goal_id, :goal_update)
      end
    end
  end
end