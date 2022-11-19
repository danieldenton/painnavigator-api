class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def admin
    @users = User.all
    @education_modules = EducationModule.all
    @education_module_completions = EducationModuleCompletion.all

    render({ :template => "dashboard/dashboard" })
  end

  def wellness
    @users = User.all.order(has_unreplied_message: :desc)
    @messages = Message.all.where.not({ "sender_id" => 1})
    render({ :template => "dashboard/wellness" })
  end

  def reply_to_user
    recipient_id = params[:recipient_id]
    body = params[:body]

    message = Message.new(sender_id: 1, recipient_id: recipient_id, body: body)

    if message.save
      redirect_to "/wellness"
    else 
      render json: { error: message.errors.messages }, status: 422
    end
  end

  def get_user
    @user ||= User.find_by(uid: params[:uid])
  end

end
