production_key_path = Rails.root.join('config', 'credentials', 'production.key')
production_key = File.read(production_key_path).strip

# Configure your application to use the production key
PainNavigatorMobileApi.configure do |config|
  config.production_key = production_key
end
