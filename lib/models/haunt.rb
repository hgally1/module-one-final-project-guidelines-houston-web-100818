class Haunt < ActiveRecord::Base

    has_many :paranormal_experiences
    has_many :ghost_hunters, through: :paranormal_experiences

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

