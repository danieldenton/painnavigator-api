class DailyPainScoresController < InheritedResources::Base

  private

    def daily_pain_score_params
      params.require(:daily_pain_score).permit(:user_id, :daily_scores)
    end

end
