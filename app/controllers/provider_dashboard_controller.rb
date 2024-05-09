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
  end
end