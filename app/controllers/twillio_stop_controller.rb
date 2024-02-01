require 'twilio-ruby'

class TwillioStopController < ApplicationController
  skip_before_action :verify_authenticity_token # Skip CSRF protection for debugging purposes

  def handle
    # Access the incoming SMS body
    incoming_body = params[:Body]

    # Log the incoming SMS body
    Rails.logger.info "Incoming SMS Body: #{incoming_body}"

    # Your logic to handle the incoming SMS goes here

    # Respond to Twilio with a simple message (optional)
    twiml = Twilio::TwiML::MessagingResponse.new do |response|
      response.message(body: "Hey!")
    end

    render xml: twiml.to_s
  end
end


