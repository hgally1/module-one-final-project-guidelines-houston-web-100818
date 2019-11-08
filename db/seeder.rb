require_relative 'seeds_helper'
require_relative '../config/environment'

haunt_hash = final_haunt_hash["Alabama"]
# haunt_hash.each do |state|
#   state.each do |haunting|
#     Haunt.find_or_create_by(
#       name: haunting["name"],
#       city: haunting["city"],
#       state: haunting["state"],
#       description: haunting["description"]
#     )
#   end
# end

# states = ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Connecticut", "Delaware", "Distric of Colombia"] 

haunt_hash.each do |haunting|
    state.each do |haunting|
        Haunt.find_or_create_by(
      name: haunting["name"],
      city: haunting["city"],
      state: haunting["state"],
      description: haunting["description"]
    )
  end
end