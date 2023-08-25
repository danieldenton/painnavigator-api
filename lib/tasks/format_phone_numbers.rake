

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

          formatted_user = user.clone
          formatted_user.phone = formatted_phone

          formatted_users << formatted_user
        else
          next
        end
      else
        next
      end
    end
  end
end



