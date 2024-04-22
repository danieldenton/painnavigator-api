require 'exponent-server-sdk'

namespace :reminder do
  desc "Send myself push notification"
  task notify_me: :environment do

    me = User.where(first_name: "Production2")
    expo_push_token = me.expo_push_token

    
    message = {
      to: expo_push_token,
      body: "hey bud"
    }

    begin
      client = Exponent::Push::Client.new(gzip: true)
      handler = client.send_messages([message])
    end
  end
end







