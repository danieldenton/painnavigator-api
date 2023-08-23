require 'concurrent'

namespace :text do
  desc "Send reminder text messages"
  task send_text_messages: :environment do
    
    current_day = Date.today.strftime('%A')

    if current_day == 'Saturday' || current_day == 'Sunday'
      puts "Skipping reminder text messages. It's the weekend."
      return
    end
    
    semaphore = Concurrent::Semaphore.new(6) # Maximum of 6 concurrent connections

    active_users = User.where(completed_program: false)

    active_users.each_slice(100) do |batch|
      batch.each do |user|
        if user.phone.present?
            message_params = {
              from: 'info@painnavigator.com',  # Your email address
              to: user[:phone],
              text: "Hello, #{user[:first_name]}! Don't forget to log your daily pain score on your PainNavigator app today."
            }

          # Acquire a permit from the semaphore
          semaphore.acquire

          # Send the text messages
          begin
            mg_client = Mailgun::Client.new('YOUR_MAILGUN_API_KEY')
            mg_domain = 'YOUR_MAILGUN_DOMAIN'
            client.send_messages([message])
            # client.verify_deliveries(handler.receipt_ids)
          ensure
            # Release the permit after the push notification is sent
            semaphore.release
          end
        end
      end
    end
  end
end