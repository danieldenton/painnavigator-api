production_key_path = ENV['PRODUCTION_KEY_PATH']
production_key = File.read(Rails.root.join(production_key_path)).strip

# Configure your application to use the production key
PainNavigatorMobileApi.configure do |config|
  config.production_key = production_key
end
