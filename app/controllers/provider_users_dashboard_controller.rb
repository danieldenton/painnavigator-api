class ProviderUsersDashboardController < ApplicationController
  def user
    @user = User.find(params[:user_id])

    @number_of_logins = @user.dates_on_app.length

    starting_pain_score = @user.starting_pain_score
    daily_pain_scores = DailyPainScore.where(user_id: @user.id)
    if daily_pain_scores.any?
      last_daily_pain_score = daily_pain_scores.last.score
    end
    @pain_progress = { "satrting pain score": starting_pain_score, "current pain. score": last_daily_pain_score }
  end
end
