desc "Run reminder notifications task"
task send_reminder_notifications: :environment do
  Rake::Task['reminder:send_notifications'].invoke
end

desc "Run reminder text task"
task send_reminder_text_messages: :environment do
  Rake::Task['reminder:send_text_messages'].invoke
end


