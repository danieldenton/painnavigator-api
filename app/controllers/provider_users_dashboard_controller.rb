class ProviderUsersDashboardController < ApplicationController
  def user
    @user = User.find(params[:user_id])

    @starting_pain_score = @user.starting_pain_score

    daily_pain_scores = DailyPainScore.where(user_id: @user.id)
    @last_pain_score = daily_pain_scores.any? ? daily_pain_scores.last.score : @starting_pain_score

    @daily_pain_score_counts = {}
(1..10).each do |score|
  count = daily_pain_scores.count { |dps| dps.score == score }
  @daily_pain_score_counts[score] = count
end

    @number_of_logins = @user.dates_on_app.length

    @education_module_completions = EducationModuleCompletion.where(user_id: @user.id).count 

    movement_module_completions = MovementModuleCompletion.where(user_id: @user.id)
    @movement_module_completions = movement_module_completions.any? ? movement_module_completions.last.module_id : 0

    @smart_goal_count = SmartGoal.where(user_id: @user.id).count 

    @pain_score_trend = @last_pain_score - @starting_pain_score

  end
end
