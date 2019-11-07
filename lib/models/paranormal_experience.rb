class Paranormal_Experience < ActiveRecord::Base

    belongs_to :haunt
    belongs_to :ghost_hunters

    def self.visual_haunting_
        ["orbs", "shadow", "figure", "lights", "items moving", "apparition"]
    end
        
    def self.auditory_haunting_array
        ["disembodied", "voice", "scream", "growl", "footsteps", "knocking", "cries", "giggling", "laughing", "moaning", "unexplained sounds"]
    end
        
    def self.physical_haunting_array
        ["thrown item", "cold spot", "poltergeist", "touch", "scratch", "possess"]
    end
end