require 'twilio-ruby'

namespace :reminder do
  desc "Texting myself"
  task text_myself: :environment do

    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']

    @client = Twilio::REST::Client.new(account_sid, auth_token)
              message = @client.messages.create(
                from: '+18667744194',
                to: '+13233633279',
                body: "Hey bud"
              )
              puts message.sid

  end
end