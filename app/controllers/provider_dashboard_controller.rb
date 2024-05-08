class ProviderDashboardController < ApplicationController
  def dashboard
    @provider = Provider.find(params[:provider_id])
    
    @users = User.where(provider_id: @provider.id)

    respond_to do |format|
      format.html
    end

    starting_pain_scores = @users.map(&:starting_pain_score)
    @starting_pain_score_counts = starting_pain_scores.group_by(&:itself).transform_values(&:count)

    # @user_counts_by_month = @users.group_by_month(:created_at).count
    # @earliest_month = @user_counts_by_month.keys.min
    # @latest_month = @user_counts_by_month.keys.max
  end
end