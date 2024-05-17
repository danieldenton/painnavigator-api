# require "csv"

# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# csv_text = File.read(Rails.root.join("lib", "csvs", "education_modules.csv"))
# csv = CSV.parse(csv_text.scrub, :headers => true, :encoding => "ISO-8859-1")
# #puts csv_text
# csv.each do |row|
#   v = EducationModule.new
#   v.name = row["name"]
#   v.source = row["source"]
#   v.module_type = row["module_type"]
#   v.module_id = row["module_id"]
#   v.post_completion_destination = row["post_completion_destination"]
#   v.length = row["length"]
#   v.skippable = row["skippable"]
#   v.summary = row["summary"]
#   v.save
#   puts "#{v.name} saved" 
# end

# puts "There are now #{EducationModule.count} rows in the education modules table"

# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

ProviderDashboard.create(email: "info@painnavigator.io", password: "password", password_confirmation: "password") if Rails.env.development?
