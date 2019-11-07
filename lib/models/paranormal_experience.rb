class Paranormal_Experience < ActiveRecord::Base

    belongs_to :haunt
    belongs_to :ghost_hunters

    def self.visual_haunting
       
    end

    def self.auditory_haunting
    end

    def self.physical_haunting
    end
end