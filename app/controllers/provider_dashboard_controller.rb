class ProviderDashboardController < ApplicationController
  def dashboard
    @provider = Provider.find(params[:provider_id])
    
    @users = User.where(provider_id: @provider.id)

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
    
  end
end