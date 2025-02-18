class WellnessCoachesController < ApplicationController
  before_action :authenticate_wellness_coach!

  def index
  end

  def wellness
    @users = User.all.order(has_unreplied_message: :desc)
    @messages = Message.all.where.not({ "sender_id" => 1})
    render({ :template => "dashboard/wellness" })
  end

  def reply_to_user
    @recipient_id = params[:recipient_id]
    body = params[:body]
    @recipient = User.find_by(id: @recipient_id)
    message = Message.new(sender_id: 1, recipient_id: @recipient_id, body: body)

    if message.save
      token = @recipient.expo_push_token
            if token.present?
              messages = [{
                to: token,
                body: "You have a new message from your wellness coach"
              }]
              client = Exponent::Push::Client.new
              handler = client.send_messages(messages)
              # client.verify_deliveries(handler.receipt_ids)
            end
      User.find_by(id: @recipient_id).update(has_unreplied_message: false)
      redirect_to "/wellness"
    else 
      render json: { error: message.errors.messages }, status: 422
    end
  end

  private

  def wellness_coach_params
    params.require(:wellness_coach)
    .permit(:email)
  end

end