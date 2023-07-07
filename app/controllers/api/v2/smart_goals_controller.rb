module Api
  module V2
    class SmartGoalsController < ApplicationController
      before_action :get_user

      def index
        smart_goals = SmartGoal.all.order(:created_at).reverse

        render json: SmartGoalSerializer.new(smart_goals).serializable_hash.to_json
      end

      def create
        smart_goal = @user.smart_goals.new(smart_goal_params)

        if smart_goal.save
          render json: SmartGoalSerializer.new(smart_goal).serializable_hash.to_json
        else 
          render json: { error: smart_goal.errors.messages }, status: 422
        end
      end

      def update
        smart_goal = SmartGoal.find_by(id: params[:id])

        if smart_goal.update(smart_goal_params)
          render json: SmartGoalSerializer.new(smart_goal).serializable_hash.to_json
        else 
          render json: { error: smart_goal.errors.messages }, status: 422
        end
      end

      def destroy
        smart_goal = SmartGoal.find_by(id: params[:id])

        if smart_goal.destroy
          head :no_content
        else 
          render json: { error: smart_goal.errors.messages }, status: 422
        end
      end

      private

      def smart_goal_params
        params.require(:smart_goal)
        .permit(:user_id, :goal, :steps, :reward, :status, :meaning, :challenges, :end_date)
      end

      def options
        @options ||= { include: %i[smart_goal_updates]}
      end

    end
  end
end