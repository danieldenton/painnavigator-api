class TwillioErrorController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:debug] 

  def debug
    payload = request.raw_post
    Rails.logger.debug "Twilio Error Payload: #{payload}"

    # You can also print to the console if you are running the server locally
    puts "Twilio Error Payload: #{payload}"

    # Respond with a success status
    head :ok
  end

end
