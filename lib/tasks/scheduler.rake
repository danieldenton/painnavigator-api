desc "Run reminder notifications task"
task send_reminder_notifications: :environment do
  Rake::Task['reminder:send_notifications'].invoke
end


