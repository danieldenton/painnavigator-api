namespace :slurp do
  
  desc "TODO"
  task EducationUnits: :environment do
    require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "education_units.csv"))
    csv = CSV.parse(csv_text.scrub, :headers => true, :encoding => "ISO-8859-1")
    puts csv_text
    csv.each do |row|
      v = EducationUnit.new
      v.name = row["name"]
      v.source = row["source"]
      v.module_type = row["module_type"]
      v.module_order = row["module_order"]
      v.post_video_destination = row["post_video_destination"]
      v.length = row["length"]
      v.skippable = row["skippable"]
      v.summary = row["summary"]
      v.condensed_program = row["condensed_program"]
      v.steps = row["steps"]
      v.save
      puts "#{v.name} saved" 
    end

    puts "There are now #{EducationUnit.count} rows in the EducationUnit table"

  end

end