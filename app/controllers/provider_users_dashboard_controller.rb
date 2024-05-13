class ProviderUsersDashboardController < ApplicationController
  def user
    @user = User.find(params[:user_id])

    @provider = @user.provider_id

    @starting_pain_score = @user.starting_pain_score

    daily_pain_scores = DailyPainScore.where(user_id: @user.id)
    @last_pain_score = daily_pain_scores.any? ? daily_pain_scores.last.score : @starting_pain_score

    @daily_pain_scores = daily_pain_scores.map { |score| [score.created_at.to_date.to_s, score.score] }.to_h 

    @number_of_logins = @user.dates_on_app.length

    @education_module_completions = EducationModuleCompletion.where(user_id: @user.id).count 

    movement_module_completions = MovementModuleCompletion.where(user_id: @user.id)
    @movement_module_completions = movement_module_completions.any? ? movement_module_completions.last.module_id : 0

    @smart_goal_count = SmartGoal.where(user_id: @user.id).count 

    @pain_score_trend = @last_pain_score - @starting_pain_score

  end
end
