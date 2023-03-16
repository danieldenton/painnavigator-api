class AddMeaningChallengesToSmartGoal < ActiveRecord::Migration[6.1]
  def change
    add_column :smart_goals, :meaning, :string
    add_column :smart_goals, :challenges, :string
  end
end
