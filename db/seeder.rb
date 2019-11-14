require_relative 'seeds_helper'
require_relative '../config/environment'

def state_arr # puts states into an array
    arr = []
    href_arr.each do |state_href|
        href = "#{state_href}"

        html = open("#{href}")
        doc = Nokogiri::HTML(html)

        state = doc.css(".entry-title").text.split(" ").last
        arr << state
    end
    arr
end

href_arr.each do |state_href|
    href = "#{state_href}"
    haunt_hasher("#{state_href}").each do |one, two|
        two.each do |hash|
            Haunt.find_or_create_by({ name: "#{hash[:name]}", city: "#{hash[:city]}", state: "#{hash[:state]}", description: "#{hash[:description]}"})
        end
    end
end

# href_arr.each do |state_href|
#     href = "#{state_href}"
#     haunt_hasher("#{state_href}").each do |one, two|
#         two.each do |hash|
#             Paranormal_Experience.find_or_create_by({ })
#         end
#     end
# end


