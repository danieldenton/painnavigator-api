require 'twilio-ruby'
require 'concurrent'
require 'dotenv-rails'

namespace :reminder do
  desc "Send reminder text messages"
  task send_text_messages: :environment do
    
    current_day = Date.today.strftime('%A')

    if current_day == 'Saturday' || current_day == 'Sunday'
      puts "Skipping reminder text messages. It's the weekend."
      return
    end

    account_sid = process.ENV['TWILIO_ACCOUNT_SID']
    auth_token = process.ENV['TWILIO_AUTH_TOKEN']
    
    semaphore = Concurrent::Semaphore.new(6)

    active_users = User.where(completed_program: false)

    current_date = Date.today

    active_users.each_slice(100) do |batch|
      batch.each do |user|
        if user.phone.present? && current_date != Date.parse(user.last_date_on_app)

          # See reminder_notifications.rake for semaphore explqanation
          semaphore.acquire

          begin
            @client = Twilio::REST::Client.new(account_sid, auth_token)
            message = @client.messages.create(
              from: '+18667744194',
              to: user.phone,
              body: "Hello, #{user[:name]}! Don't forget to log your daily pain score on PainNavigator today."
            )
            puts message.sid
          ensure
    
            semaphore.release
          end
        end
      end
    end
  end
end