class Ghost_Hunter < ActiveRecord::Base

    has_many :paranormal_experiences
    has_many :haunts
end