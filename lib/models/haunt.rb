class Haunt < ActiveRecord::Base

    has_many :paranormal_experiences
    has_many :ghost_hunters, through: :paranormal_experiences


     
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

end


def search_by_state(location)
    arr = []
    this = Haunt.all
    this.each do |haunting|
        if haunting.state == "#{location}"
            arr << haunting
        end
    end
    arr
end
            
