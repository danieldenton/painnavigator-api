class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def admin
    @users = User.all
    @education_modules = EducationModule.all
    @education_module_completions = EducationModuleCompletion.all

    render({ :template => "dashboard/dashboard" })
  end

  def get_user
    @user ||= User.find_by(uid: params[:uid])
  end

end
