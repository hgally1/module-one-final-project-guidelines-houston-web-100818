require_relative 'seeds_helper'
require_relative '../config/environment'
#require 'hash_dot'

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

# state_arr.each do |state|
#     haunters = JSON.parse(final_haunt_hash["#{state}"])
#     Haunt.new({
#         name: haunters["name"],
#         city: haunters["city"],
#         state: haunters["state"],
#         description: haunters["description"]
#     }).save
# end

# def entire
#     state_arr.each do |state|
#         puts final_haunt_hash["#{state}"]
#         puts "-----------------------------------------------"
#         puts "-----------------------------------------------"
#         puts "-----------------------------------------------"
#     end
# end

# puts entire

# state_arr.each do |index|
#     state = final_haunt_hash["#{index}"]
#     state.each do |haunter|
#         Haunt.find_or_create_by(
#             name: haunter["name"].to_s,
#             city: haunter["city"].to_s,
#             state: haunter["state"].to_s,
#             description: haunter["description"].to_s
#         )
#     end 
# end

# state_arr.each do |index|
#     state = final_haunt_hash["#{index}"]
#     state.each do |haunting|
#         haunter = haunting
#         Haunt.find_or_create_by(
#             name: state.haunter.name.to_s,
#             city: state.haunter.city.to_s,
#             state: state.haunter.state.to_s,
#             description: state.haunter.description.to_s
#         )
#     end 
# end



# final_haunt_hash.each do |state_hash|
#     state_hash.each do |haunter|
#         Haunt.new({
#             name: haunter["name"],
#             city: haunter["city"],
#             state: haunter["state"],
#             description: haunter["description"]
#         }).save
#     end
# end

# haunt_hash.each do |haunter|
#         Haunt.find_or_create_by(
#       name: haunter["name"],
#       city: haunter["city"],
#       state: haunter["state"],
#       description: haunter["description"]
#     )
# end

# state_arr.each do |state|
#     final_haunt_hash["#{state}"].each do |k, v|
#         v.each do |hash|
#             Haunt.create({ name: "#{hash[:name]}", city: "#{hash[:city]}", state: "#{hash[:state]}", description: "#{hash[:description]}"})
#         end
#     end
# end

href_arr.each do |state_href|
    href = "#{state_href}"
    haunt_hasher("#{state_href}").each do |one, two|
        two.each do |hash|
            Haunt.find_or_create_by({ name: "#{hash[:name]}", city: "#{hash[:city]}", state: "#{hash[:state]}", description: "#{hash[:description]}"})
        end
    end
end

href_arr.each do |state_href|
    href = "#{state_href}"
    haunt_hasher("#{state_href}").each do |one, two|
        two.each do |hash|
            Paranormal_Experience.find_or_create_by({ })
        end
    end
end


#     end

#     # Haunt.create({ name: "#{hname}", city: "#{hcity}", state: "#{hstate}", description: "#{hdesc}"})
# end
  
