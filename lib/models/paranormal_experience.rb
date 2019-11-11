
class Paranormal_Experience < ActiveRecord::Base

    belongs_to :haunt
    belongs_to :ghost_hunters

    def self.haunt_labeler
        arr = []
        activity = { 
            :visual => ["orbs", "shadow", "figure", "lights", "items moving", "apparition"], 
            :auditory => ["disembodied", "voice", "scream", "growl", "footsteps", "knocking", "cries", "giggling", "laughing", "moaning", "unexplained sounds"],
            :physical => ["thrown item", "cold spot", "poltergeist", "touch", "scratch", "possess", "feel", "felt"] 
        }
        x = 1
        activity.each do |type|
            type.each do |keyword|
                if  Haunt.description.include? "#{activity}"
                    puts "Type: #{type}, Name: #{Haunt.name}"
                    x += 1
                end
            end
        end
    end
            


    def visual_haunt
        arr = []
        visual = ["orbs", "shadow", "figure", "lights", "items moving", "apparition"]
        visual.each do |activity|
            if Haunt.description.include? "#{activity}"
                arr << self
            end
        end
        arr
    end
        
        



  
    def self.auditory
        arr = []
        auditory = ["disembodied", "voice", "scream", "growl", "footsteps", "knocking", "cries", "giggling", "laughing", "moaning", "unexplained sounds"]
        auditory.each do |activity|
            if Haunt.description.include? "#{activity}"
                arr << self
            end
        puts arr
        end
    end
        
    def self.physical_haunting_array
        physical = ["thrown item", "cold spot", "poltergeist", "touch", "scratch", "possess"]
    end
end