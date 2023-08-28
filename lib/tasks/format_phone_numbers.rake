# lib/tasks/format_phone_numbers.rake

namespace :custom do
  desc "Format phone numbers"
  task :format_phone_numbers => :environment do
    users = User.all
    formatted_users = []

    users.each do |user|
      if user.phone.present?
        cleaned_phone = user.phone.gsub(/\D/, '')

        if cleaned_phone.match?(/^\d{10}$/)
          formatted_phone = '+1' + cleaned_phone
          user.update(phone: formatted_phone)
          # formatted_users << user.clone.tap { |u| u.phone = formatted_phone }
          puts user.uid
        else
          next
        end
      else
        next
      end
    end
  end
end




