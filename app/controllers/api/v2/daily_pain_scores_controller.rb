module Api
  module V2
    class DailyPainScoresController < ApplicationController
      before_action :find_user_by_uid, only: [:index, :create]
      before_action :set_daily_pain_score, only: [:show, :update, :destroy]

      def find_user_by_uid
        @user = User.find_by(uid: params[:uid])
        render json: { error: 'User not found' }, status: :not_found unless @user
      end

      def set_daily_pain_score
        @daily_pain_score = @user.daily_pain_scores.find(params[:id])
      end

      def daily_pain_score_params
        params.require(:daily_pain_score).permit(:score, :created_at, :updated_at)
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

