require 'twilio-ruby'

class TwillioStopController < ApplicationController

  def handle
    incoming_number = params[:From]
    incoming_body = params[:Body]
    user = User.find_by(phone: incoming_number)

    Rails.logger.info "Incoming SMS from: #{incoming_number}: #{incoming_body}"

    if incoming_body.downcase.strip == "stop"
      user.update(opt_out_sms: true)
      
    elsif incoming_body.downcase.strip == "start"
      user.update(opt_out_sms: false)

    else
      twiml = Twilio::TwiML::MessagingResponse.new do |response|
        response.message(body: "Hello! This is PainNavigator's automated SMS messaging number. To get in touch with PainNavigator please message your Wellness Coach through the PainNavigator app! Have a great day!")
      end
    end

    render xml: twiml.to_s
  end
end


