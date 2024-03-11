namespace :db do
  desc "Populate user_id_copy_for_admin column in DailyPainScores"
  task populate_user_id_copy_for_admin: :environment do
    DailyPainScore.find_each do |score|
      score.update(user_id_copy_for_admin: score.user_id)
    end
  end
end