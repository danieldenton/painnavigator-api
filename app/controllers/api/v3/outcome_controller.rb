module Api
  module V3
    class OutcomeController < ApplicationController
      before_action :get_user
    
      def outcome_params
        params.require(:outcome).permit(:recommendation, :outcome_enjoyment_of_life, :outcome_activity_interference, :outcome_anxious, :outcome_unable_to_stop_worrying, :outcome_little_interest_or_pleasure, :outcome_depressed)
      end
    
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