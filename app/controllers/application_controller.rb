class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def get_user
    @user ||= User.find_by(uid: params[:uid])
  end

end
