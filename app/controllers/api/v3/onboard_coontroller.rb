module Api
  module V3
    class OnboardController < ApplicationController
      before_action :get_user
    
      def onboard_params
        params.require(:outcome).permit(:starting_pain_score, :enjoyment_of_life, :activity_interference, :hopes_to_achieve, :anxious, :unable_to_stop_worrying, :little_interest_or_pleasure, :depressed, :type_of_pain, :pain_injections, :spine_surgery)
      end
    
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