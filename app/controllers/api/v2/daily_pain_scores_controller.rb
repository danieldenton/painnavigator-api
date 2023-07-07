module Api
  module V2
    class DailyPainScoresController < ApplicationController
      before_action :get_user
      before_action :set_daily_pain_score, only: [:show, :update, :destroy]
    
      def set_daily_pain_score
        @daily_pain_score = DailyPainScore.find(params[:id])
      end
    
      def daily_pain_score_params
        params.require(:daily_pain_score).permit(:score, :date_time_value)
      end
    
      def index
        @daily_pain_scores = @user.daily_pain_scores
        render json: @daily_pain_scores
      end
    
      def create
        @daily_pain_score = @user.daily_pain_scores.new(daily_pain_score_params)
        if @daily_pain_score.save
          render json: @daily_pain_score, status: :created
        else
          render json: @daily_pain_score.errors, status: :unprocessable_entity
        end
      end
    
      def update
        if @daily_pain_score.update(daily_pain_score_params)
          render json: @daily_pain_score
        else
          render json: @daily_pain_score.errors, status: :unprocessable_entity
        end
      end
    end
  end
end