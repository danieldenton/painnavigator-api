require 'twilio-ruby'

class TwillioStopController < ApplicationController

  def handle
    incoming_number = params[:From]
    incoming_body = params[:Body]
    user = User.find_by(phone: incoming_number)

    Rails.logger.info "Incoming SMS from: #{incoming_number}: #{incoming_body}"

    if incoming_body.downwcase == "stop"
      user.update(opt_out_sms: true)
      twiml = Twilio::TwiML::MessagingResponse.new do |response|
        response.message(body: "You have successfully unsubscribed from PainNavigator's reminder SMS messages. If you wish to restart these messages simply reply 'START' to this number. If you need anything else at all please get in touch with your Wellness Coach through you PainNavigator app.")
      end
      
    elsif incoming_body.downwcase == "start"
      user.update(opt_out_sms: false)
      twiml = Twilio::TwiML::MessagingResponse.new do |response|
        response.message(body: "You have successfully subscribed to PainNavigator's reminder SMS messages!")
      end

    else
      twiml = Twilio::TwiML::MessagingResponse.new do |response|
        response.message(body: "Hello! This is PainNavigator's automated SMS messaging number. To get in touch with PainNavigator please message your Wellness Coach through the PainNavigator app! Otherwise to unsubscribe from these reminder text messages simply reply 'STOP' or to subscribe 'START'. Have a great day!")
      end
    end

    render xml: twiml.to_s
  end
end


