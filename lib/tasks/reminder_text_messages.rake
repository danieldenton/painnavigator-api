require 'twilio-ruby'
require 'concurrent'
require 'date'

namespace :reminder do
  desc "Send reminder text messages"
  task send_text_messages: :environment do
    
    current_day = Date.today.strftime('%A')

    if current_day == 'Saturday' || current_day == 'Sunday'
      puts "Skipping reminder text messages. It's the weekend."
      return
    end

    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']

    # deep_link_url = 'painnavigator://'
    deep_link_url = 'PainNavigator'
    
    semaphore = Concurrent::Semaphore.new(6)

    active_users = User.where(completed_program: false)

    current_date = Date.today.strftime('%Y-%m-%d')

    def convert_date_format(date_str)
      return nil if date_str.nil
      
      date = Date.strptime(date_str, '%m/%d/%y')
      formatted_date = date.strftime('%Y-%m-%d')
      return formatted_date
    end

    active_users.each_slice(100) do |batch|
      batch.each do |user|
        if user.phone.present? && user.last_date_on_app.present?
          if current_date != convert_date_format(user.last_date_on_app)

            # See reminder_notifications.rake for semaphore explqanation
            semaphore.acquire

            begin
              @client = Twilio::REST::Client.new(account_sid, auth_token)
              message = @client.messages.create(
                from: '+18667744194',
                to: user.phone,
                body: "Hi #{user[:name]}! Please remember to log your pain score today in the #{deep_link_url} app. Your daily input helps your Dr. best support you. Thank you!"
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
end