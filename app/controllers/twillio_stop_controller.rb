require 'twilio-ruby'

class TwillioStopController < ApplicationController

  def handle
    incoming_number = params[:From]
    incoming_body = params[:Body]
    stripped_body = incoming_body.downcase.strip
    user = User.find_by(phone: incoming_number)

    Rails.logger.info "Incoming SMS from: #{incoming_number}: #{stripped_body}"

    if stripped_body == "stop"
      user.update(opt_out_sms: true)
      
    elsif stripped_body == "start" || stripped_body == "unstop"
      user.update(opt_out_sms: false)

    else
      twiml = Twilio::TwiML::MessagingResponse.new do |response|
        response.message(body: "Hello! This is PainNavigator's automated SMS messaging number. To get in touch with PainNavigator please message your Wellness Coach through the PainNavigator app! Have a great day!")
      end
    end

    render xml: twiml.to_s
  end
end


