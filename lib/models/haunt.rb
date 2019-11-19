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


            
phrase = "One of the most terrifying places in all of Pennsylvania must be Eastern State Penitentiary. This was the first penitentiary in the United States and it was designed specifically with the intention of placing prisoners in a situation where they spent time silently reflection on their crimes without interaction with other people. Those incarcerated in this prison were subjected to both physical and psychological torture. Some of the famous methods used here included the ‘Mad Chair’ where prisoners would be strapped tightly in and be left sitting completely motionless for days without food and water – often driving them to insanity. Other methods included clamping their tongue with the ‘Iron Gag’ which would cause severe pain and bleeding if they tried to speak, and throwing prisoners into ‘The Hole’ where they could be kept in a dark pit for weeks at a time. Needless to say, many men held here went completely insane and many of them died. It is no surprise that visitors hear footsteps, screams, moans and other unexplained noises. Visitors also report being grabbed, scratched and followed in the prison. These days the building houses a museum and is used as one of the most terrifying Halloween haunted houses in the country!"

    def self.find_by_states(place)
        arr = []

        state = ":#{place}"

        Self.all.each do |h|
            if h[state] == "#{place}"
                arr << h
            end
        end
        puts arr
    end

    # def find_by_state(input)
    #     state = “/n#{input}”
    #     tester = Haunt.where( state: “#{state}“)
    #     tester.each do |haunt|
    #         puts “Name: #{haunt.name}”
    #         puts “State: #{haunt.state}”
    #         puts “City: #{haunt.city}”
    #         puts “Description: #{haunt.description}”
    #     end
    #  end



        



end


