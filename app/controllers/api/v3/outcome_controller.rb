module Api
  module V3
    class OutcomeController < ApplicationController
      before_action :get_user
    
      # def set_daily_pain_score
      #   @daily_pain_score = DailyPainScore.find(params[:id])
      # end
    
      # def daily_pain_score_params
      #   params.require(:daily_pain_score).permit(:score, :date_time_value)
      # end
    
      def index
        @outcome = @user.outcome
        render json: @outcome
      end
    
      def create
        @outcome = @user.outcome.new(daily_pain_score_params)
        if @outcome.save
          render json: @outcome, status: :created
        else
          render json: @outcome.errors, status: :unprocessable_entity
        end
      end
    
      def update
        if @outcome.update(daily_pain_score_params)
          render json: @outcome
        else
          render json: @outcome.errors, status: :unprocessable_entity
        end
      end

      def destroy
        if @outcome.destroy
          head :no_content
        else 
          render json: { error: outcome.errors.messages }, status: 422
        end
      end
    end
  end