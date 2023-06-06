class Api::V2::DailyPainScoresController < ApplicationController
  before_action :find_user_by_uid, only: [:index, :create]

  def index
    # Find daily pain scores for the user
    daily_pain_scores = @user.daily_pain_scores
    render json: daily_pain_scores
  end

  def create
    # Create a new daily pain score for the user
    daily_pain_score = @user.daily_pain_scores.build(daily_pain_score_params)
    if daily_pain_score.save
      render json: daily_pain_score, status: :created
    else
      render json: { errors: daily_pain_score.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def find_user_by_uid
    @user = User.find_by(uid: params[:uid])
    render json: { error: 'User not found' }, status: :not_found unless @user
  end

  def daily_pain_score_params
    params.require(:daily_pain_score).permit(:score)
  end
end
