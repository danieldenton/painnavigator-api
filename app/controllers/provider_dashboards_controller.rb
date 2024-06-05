class ProviderDashboardsController < ApplicationController
  before_action :authenticate_provider_dashboard!
  before_action :set_current_provider_dashboard
  before_action :set_users

  def set_current_provider_dashboard
    if provider_dashboard_signed_in?
      @current_provider = current_provider_dashboard
      if params[:provider_id].present?
        @provider = Provider.find(params[:provider_id])
      else
        @provider = Provider.find_by(email: @current_provider.email)
      end
    end
  end

  def set_users
    @users = User.where(provider_id: @provider.id)
  end

  def dashboard
    
    date = Date.today
    @current_date = date.strftime("%B %d %Y")

    @starting_pain_score_counts = {}
    starting_pain_scores = @users.map(&:starting_pain_score)
    (1..10).each do |score| 
      count = starting_pain_scores.count(score)
      @starting_pain_score_counts[score] = count
    end

    user_counts_by_month = @users.group_by_month(:created_at, format: "%m-%Y").count
    puts user_counts_by_month
    @cumulative_user_count = {}
    cumulative_count = 0
    user_counts_by_month.each do |month, count|
      cumulative_count += count
      @cumulative_user_count[month] = cumulative_count
    end

    dates_on_app = @users.map(&:dates_on_app).flatten.map { |date_string| Date.strptime(date_string, "%m/%d/%y") }
    dates_on_app_by_month = dates_on_app.group_by { |date| date.strftime("%m-%Y") }
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

  def user_list
    date = Date.today
    @current_date = date.strftime("%B %d %Y")
  end

  def provider_list
    @providers = Provider.all
  end

end