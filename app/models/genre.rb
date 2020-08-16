class Genre < ActiveRecord::Base
    # multiple artists
    has_many :artists
    # multiple songs
    has_and_belongs_to_many :songs
end