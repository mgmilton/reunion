require 'erb'
require './lib/reunion'
reunion = Reunion.new("Sheboygan")
reunion.add_activity("Ice Fishing", {"Farve" => 30, "McCarthy" => 20}, 50)
reunion.add_activity("Slamming Brews", {"Dwight" => 10, "Shawna" => 10, "Gus" => 15}, 40)
template_letter = File.read "reunion_form.erb"
activities = reunion.activities
erb_template = ERB.new template_letter
form_letter = erb_template.result(binding)
Dir.mkdir("website") unless Dir.exists? "website"

filename = "website/reunion_details.html"

File.open(filename, 'w') do |file|
  file.puts form_letter
end
