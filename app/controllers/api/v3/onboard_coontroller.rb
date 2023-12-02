module Api
  module V3
    class OnboardController < ApplicationController
      before_action :get_user
    
      # def set_daily_pain_score
      #   @daily_pain_score = DailyPainScore.find(params[:id])
      # end
    
      # def daily_pain_score_params
      #   params.require(:daily_pain_score).permit(:score, :date_time_value)
      # end
    
      def index
        @onboard = @user.onboard
        render json: @onboard
      end
    
      def create
        @onboard = @user.onboard.new(daily_pain_score_params)
        if @onboard.save
          render json: @outcome, status: :created
        else
          render json: @outcome.errors, status: :unprocessable_entity
        end
      end
    
      def update
        if @onboard.update(daily_pain_score_params)
          render json: @onboard
        else
          render json: @onboard.errors, status: :unprocessable_entity
        end
      end

      def destroy
        if @onboard.destroy
          head :no_content
        else 
          render json: { error: onboard.errors.messages }, status: 422
        end
      end
    end
  end