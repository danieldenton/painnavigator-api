class ProviderDashboardController < ApplicationController
  def dashboard
    @provider = Provider.find(params[:provider_id])
    
    @users = User.where(provider_id: @provider.id)

    @current_date = Date.today

    @starting_pain_score_counts = {}
    starting_pain_scores = @users.map(&:starting_pain_score)
    (1..10).each do |score| 
      count = starting_pain_scores.count(score)
      @starting_pain_score_counts[score] = count
    end

    user_counts_by_month = @users.group_by_month(:created_at).count
    @cumulative_user_count = {}
    cumulative_count = 0
    user_counts_by_month.each do |month, count|
      cumulative_count += count
      @cumulative_user_count[month] = cumulative_count
    end

    dates_on_app = @users.map(&:dates_on_app).flatten.map { |date_string| Date.strptime(date_string, "%m/%d/%y") }
    dates_on_app_by_month = dates_on_app.group_by { |date| date.strftime("%Y-%m") }
    @dates_on_app_by_month_count = dates_on_app_by_month.transform_values(&:count)

    @pain_score_trends = Hash.new(0)
    @users.each do |user|
      daily_pain_scores = DailyPainScore.where(user_id: user.id)
      last_pain_score = daily_pain_scores.any? ? daily_pain_scores.last.score : nil 
      if last_pain_score
        pain_score_trend = last_pain_score - user.starting_pain_score
        @pain_score_trends[pain_score_trend] += 1
      end
    end

    
  end
end