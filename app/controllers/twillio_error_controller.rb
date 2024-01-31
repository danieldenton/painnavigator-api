class TwillioErrorController < ApplicationController

  def handle
    payload = params[:payload]
    # Your logic to handle or inspect the payload
    render plain: "Webhook Payload: #{payload}"
  end
  end

end
