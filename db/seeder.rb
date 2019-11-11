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



def self.auditory_haunting
    auditory = ["disembodied", "voice", "scream", "growl", "footsteps", "knocking", "cries", "giggling", "laughing", "moaning", "unexplained sounds"]
    auditory.each do |activity|
        if self.description.include? "#{activity}"
            puts "#{self.name} reportedly has the following activity: #{activity}"
        end
    end
end