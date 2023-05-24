require 'exponent-server-sdk'

desc "This task is sending reminder push notifications which are called by the Heroku scheduler add-on"
task :send_reminder_notifications => :environment do
  reminders = [
    "Don't forget to do your daily back stretches to alleviate chronic low back pain. Your body will thank you!",
    "Take a break and move around for a few minutes to help prevent low back pain from prolonged sitting.",
    "Today's tip: Apply heat therapy to your lower back to help relieve chronic pain and stiffness.",
    "Did you know that maintaining a healthy weight can help reduce chronic low back pain? Keep up the good work!",
    "It's time to schedule your next coaching session to help manage your chronic low back pain.",
    "Don't forget to practice good posture throughout the day to avoid exacerbating your chronic low back pain.",
    "Today's reminder: Avoid lifting heavy objects to prevent strain on your lower back.",
    "Remember to take short breaks and stretch throughout the day to help prevent chronic low back pain.",
    "Your personalized exercise plan is ready! Check it out in the app to help alleviate your chronic low back pain.",
    "Take a few minutes to engage with your PainNavigator app today to help manage your chronic low back pain.",
    "Remember to check your PainNavigator app for new exercises and resources to help alleviate your chronic low back pain.",
    "It's time for your daily digital therapy session to help manage your chronic low back pain.",
    "Don't forget to log your progress in the PainNavigator app to help track your chronic low back pain.",
    "Today's tip: Use the PainNavigator app to learn new ways to manage your chronic low back pain.",
    "It's been a while since your last digital therapy session. Open the app to stay on track with managing your chronic low back pain.",
    "Your personalized digital therapy plan is ready for you to access. Open the app now to get started on managing your chronic low back pain.",
    "Need some motivation to engage with your PainNavigator? Remember, consistent use can help alleviate your chronic low back pain.",
    "Set a reminder to engage with your PainNavigator each day to help stay on track with managing your chronic low back pain.",
    "Remember to give yourself a few minutes each day to engage with your PainNavigator app and help manage your chronic low back pain."
    ]
    random_index = rand(reminders.length)
    random_reminder = reminders[random_index]
    active_users = User.where(completed_program: false)
    active_users.each do |user|
      if user.expo_push_token.present?
        message = {
          to: user.expo_push_token,
          body: random_reminder
        }
        client = Exponent::Push::Client.new
        client.publish(random_reminder)
        # client.verify_deliveries(handler.receipt_ids)
      end
    end        
  end
end

