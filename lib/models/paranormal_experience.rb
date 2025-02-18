
class Paranormal_Experience < ActiveRecord::Base

    belongs_to :haunt
    belongs_to :ghost_hunters

    #def type_of_haunting_hash
    #   {
    #     :visual => ["orbs", "shadow", "figure", "lights", "items moving", "apparition"],  
    #     :auditory => ["disembodied", "voice", "scream", "growl", "footsteps", "knocking", "cries", "giggling", "laughing", "moaning", "unexplained sounds"],
    #     :physical => ["thrown item", "cold spot", "poltergeist", "touch", "scratch", "possess"]
    #   }
    # end

    # def self.type_of_experience
    #     type = Paranormal_Experience.all.where(description).select do | experience |
    #       words = experience.content.split(" ").collect do | word |
    #         word.downcase.gsub(/[^0-9A-Za-z]/,'')
    #       end
    #       words.include?("type") && !(words & Paranormal_Experience.type_of_haunting_hash).empty?
    #     end
    #     types.collect do | date |
    #       name = User.all.where(id: date[:user_id])[0][:name]
    #       bar = Bar.all.where(id: date[:bar_id])[0][:name]
    #       { name: name, bar: bar, review: date.content }
        
    #     end

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
            



    def self.visual_haunting_array
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
        arr = []
        physical = ["thrown item", "cold spot", "poltergeist", "touch", "scratch", "possess"]
        physical.each do |activity|
            if Haunt.description.include? "#{activity}"
                arr << self
            end
        end
    end
  
end

