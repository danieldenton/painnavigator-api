class DailyPainScore < ApplicationRecord
  belongs_to :user
  before_create :copy_user_id_to_admin_copy

  def copy_user_id_to_admin_copy
    self.user_id_copy_for_admin = user_id
  end
end
