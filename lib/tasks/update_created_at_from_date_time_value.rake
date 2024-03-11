namespace :db do
  desc "Update created_at from date_time_value in DailyPainScores"
  task update_created_at_from_date_time_value: :environment do
    DailyPainScore.find_each do |score|
      time = Time.at(score.date_time_value / 1000)

      score.update(created_at: time)
    end
  end
end