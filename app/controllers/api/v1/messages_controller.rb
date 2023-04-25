module Api
  module V1
    class MessagesController < ApplicationController
      before_action :find_user, only: [:get_conversation, :mark_conversation_read]
      
      def get_conversation
        messages = Message.where(sender_id: @user.id).or(Message.where(recipient_id: @user.id)).order(:created_at)

        render json: MessageSerializer.new(messages).serializable_hash.to_json
      end

      def mark_conversation_read
        messages = Message.where(sender_id: @user.id).or(Message.where(recipient_id: @user.id))

        messages.each do |message|
          if message.unread?
            message.update(status: 1)
          end
        end

        head :no_content
      end

      def index
        messages = Message.all.order(:created_at).reverse

        render json: MessageSerializer.new(messages).serializable_hash.to_json
      end

      def create
        sender_uid = params[:sender_id]
        @sender = User.find_by(uid: sender_uid)

        recipient_uid = params[:recipient_id]

        if User.find_by(uid: recipient_uid)
          @recipient = User.find_by(uid: recipient_uid)

        else 
          @recipient = User.first
        end

        body = params[:body]

        message = Message.new(sender_id: @sender.id, recipient_id: @recipient.id, body: body)

        if message.save
          if @sender.role == "standard"
            @sender.update(has_unreplied_message: true)
          elsif @sender.role == "wellness_coach" || @sender.role == "admin"

            expo_push_token = "ExponentPushToken[pl4gsnDTGSWaqjhi2D_4hj]"
            if expo_push_token.present?
              message = {
                to: expo_push_token,
                sound: "default",
                body: "You have a new message from your wellness coach"
              }
              client = Exponent::Push::Client.new
              handler = client.publish(message)
              client.verify_deliveries(handler.receipt_ids)
            end
            @recipient.update(has_unreplied_message: false)
          end
          render json: MessageSerializer.new(message).serializable_hash.to_json
        else 
          render json: { error: message.errors.messages }, status: 422
        end
      end

      private

      def find_user
        uid = params[:uid]
        @user = User.find_by(uid: uid)
      end

      def message_params
        params.require(:message).permit(:user_id, :sender_id, :recipient_id, :body)
      end

    end
  end
end



# @Deprecated
# client.publish(messages)

# MAX 100 messages at a time


# Array of all errors returned from the API
# puts handler.errors

# you probably want to delay calling this because the service might take a few moments to send
# I would recommend reading the expo documentation regarding delivery delays
