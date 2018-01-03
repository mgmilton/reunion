require 'erb'
require './lib/reunion'
reunion = Reunion.new("Sheboygan")
reunion.add_activity("ice  fishing", {"Farve" => 30, "McCarthy" => 20}, 50)
reunion.add_activity("slamming brews", {"Dwight" => 10, "Shawna" => 10, "Gus" => 15}, 40)
template_letter = File.read "reunion_form.erb"
erb_template = ERB.new template_letter

form_letter = erb_template.result(binding)
reunion.create_website(form_letter)
