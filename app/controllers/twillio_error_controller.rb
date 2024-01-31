class TwillioErrorController < ApplicationController
  skip_before_action :verify_authenticity_token # Skip CSRF protection for debugging purposes

  def handle
    payload = request.raw_post
    Rails.logger.debug "Webhook Payload: #{payload}"
    render plain: "Webhook Payload: #{payload}"
  end
end


