class Api::V2::DailyPainScoresController < ApplicationController
  before_action :set_user, only: [:index, :create]
  before_action :set_daily_pain_score, only: [:show, :update, :destroy]

  # GET /api/v2/users/:user_id/daily_pain_scores
  def index
    @daily_pain_scores = @user.daily_pain_scores
    render json: @daily_pain_scores
  end

  # GET /api/v2/users/:user_id/daily_pain_scores/:id
  def show
    render json: @daily_pain_score
  end

  # POST /api/v2/users/:user_id/daily_pain_scores
  def create
    @daily_pain_score = @user.daily_pain_scores.new(daily_pain_score_params)
    if @daily_pain_score.save
      render json: @daily_pain_score, status: :created
    else
      render json: @daily_pain_score.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v2/users/:user_id/daily_pain_scores/:id
  def update
    if @daily_pain_score.update(daily_pain_score_params)
      render json: @daily_pain_score
    else
      render json: @daily_pain_score.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v2/users/:user_id/daily_pain_scores/:id
  def destroy
    @daily_pain_score.destroy
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_daily_pain_score
    @daily_pain_score = @user.daily_pain_scores.find(params[:id])
  end

  def daily_pain_score_params
    params.require(:daily_pain_score).permit(:scores)
  end
end
