require 'twilio-ruby'
require 'concurrent'

namespace :text do
  desc "Send reminder text messages"
  task send_text_messages: :environment do
    
    current_day = Date.today.strftime('%A')

    if current_day == 'Saturday' || current_day == 'Sunday'
      puts "Skipping reminder text messages. It's the weekend."
      return
    end

   
    
    semaphore = Concurrent::Semaphore.new(6)

    active_users = User.where(completed_program: false)

    current_date = Date.today

    active_users.each_slice(100) do |batch|
      batch.each do |user|
        if user.phone.present? && current_date != Date.parse(user.last_date_on_app)
            message_params = {
              from: 'info@painnavigator.io',
              to: user[:phone],
              text: "Hello, #{user[:first_name]}! Don't forget to log your daily pain score on your PainNavigator app today."
            }

          # Acquire a permit from the semaphore
          semaphore.acquire

          begin
            mg_client = Mailgun::Client.new(ENV['MG_API_KEY'])
            mg_domain = ENV['MG_SENDING_DOMAIN']
            mg_client.send_message(mg_domain, message_params)
          ensure
            # Release the permit after the push notification is sent
            semaphore.release
          end
        end
      end
    end
  end
end